import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/core/networking/dio_factory.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:donor_app/features/auth/domain/repositories/auth_repository.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  bool isRefreshing = false;

  AuthInterceptor(this._dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !isRefreshing) {
      isRefreshing = true;
      try {
        final newAccessToken = await _refreshToken();
        if (newAccessToken != null) {
          // Update header for future requests
          DioFactory.setTokenIntoHeaderAfterLogin(newAccessToken);

          // Update header for the current failed request
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';

          // Retry original request
          final response = await _dio.fetch(err.requestOptions);
          handler.resolve(response);
        } else {
          await _clearTokensAndLogout();
          handler.reject(err);
        }
      } catch (e) {
        // Refresh itself failed
        await _clearTokensAndLogout();
        handler.reject(err);
      } finally {
        isRefreshing = false; // always unlock
      }
    } else {
      handler.next(err); // not 401, pass error normally
    }
    super.onError(err, handler);
  }

  Future<String?> _refreshToken() async {
    final oldAccessToken = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.accessToken,
    );
    final oldRefreshToken = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.refreshToken,
    );

    final result = await getIt<AuthRepository>().refreshToken(
      oldAccessToken,
      oldRefreshToken,
    );
    return result.when(
      success: (data) async {
        await _saveTokens(data.accessToken, data.refreshToken);
        return data.accessToken;
      },
      failure: (_) => null,
    );
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.accessToken,
      accessToken,
    );
    await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.refreshToken,
      refreshToken,
    );
  }

  Future<void> _clearTokensAndLogout() async {
    log('clearTokensAndLogout');
    await SharedPrefHelper.removeAllSecuredData();

    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.login,
      (route) => false,
    );
  }
}

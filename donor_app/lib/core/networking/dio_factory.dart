import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:donor_app/core/helpers/constants.dart';
import 'package:donor_app/core/helpers/shared_pref_helper.dart';
import 'package:donor_app/core/networking/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I dou't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeout = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();

      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;

      (dio!.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final httpClient = HttpClient()
          ..idleTimeout = timeout
          ..connectionTimeout = timeout;

        return httpClient;
      };

      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.accessToken,
    );

    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers.addAll({'Authorization': 'Bearer $token'});
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(AuthInterceptor(dio!));

    assert(() {
      dio?.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
      return true;
    }());
  }
}

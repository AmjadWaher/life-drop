import 'package:donor_app/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate_download_state.freezed.dart';

@freezed
class CertificateDownloadState with _$CertificateDownloadState {
  const factory CertificateDownloadState.initial() =
      _CertificateDownloadInitial;
  const factory CertificateDownloadState.loading() = CertificateDownloadLoading;
  const factory CertificateDownloadState.success(String filePath) =
      CertificateDownloadSuccess;
  const factory CertificateDownloadState.error({required ApiErrorModel error}) =
      CertificateDownloadError;
}

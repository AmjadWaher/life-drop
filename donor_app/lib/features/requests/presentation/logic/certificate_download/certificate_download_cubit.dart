import 'package:donor_app/core/networking/api_result.dart';
import 'package:donor_app/features/requests/domain/repository/requests_repository.dart';
import 'package:donor_app/features/requests/presentation/logic/certificate_download/certificate_download_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CertificateDownloadCubit extends Cubit<CertificateDownloadState> {
  final RequestsRepository _repository;
  CertificateDownloadCubit(this._repository)
    : super(const CertificateDownloadState.initial());

  Future<void> downloadCertificate(String requestId) async {
    emit(const CertificateDownloadState.loading());

    final result = await _repository.downloadCertificate(requestId);

    result.when(
      success: (filePath) => emit(CertificateDownloadState.success(filePath)),
      failure: (error) => emit(CertificateDownloadState.error(error: error)),
    );
  }
}

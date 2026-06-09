import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/mixins/snack_bar_mixin.dart';
import 'package:donor_app/core/widgets/app_text_button.dart';
import 'package:donor_app/features/requests/presentation/logic/certificate_download/certificate_download_cubit.dart';
import 'package:donor_app/features/requests/presentation/logic/certificate_download/certificate_download_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonationCertificateDownloadButton extends StatelessWidget
    with SnackBarMixin {
  const DonationCertificateDownloadButton({super.key, required this.requestId});
  final String requestId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CertificateDownloadCubit, CertificateDownloadState>(
      listener: (context, state) {
        if (state is CertificateDownloadSuccess) {
          showSuccessSnackBar(context, message: 'Certificate downloaded');
        }
        if (state is CertificateDownloadError) {
          showErrorSnackBar(
            context,
            message: state.error.getAllErrorMessages(),
          );
        }
      },
      builder: (context, state) {
        return AppTextButton(
          icon: const Icon(Icons.download, color: Colors.white),
          buttonText: 'Download Certificate',
          textStyle: context.textStyles.font16WhiteBold,
          isLoading: state is CertificateDownloadLoading,
          onPressed: () {
            context.read<CertificateDownloadCubit>().downloadCertificate(
              requestId,
            );
          },
        );
      },
    );
  }
}

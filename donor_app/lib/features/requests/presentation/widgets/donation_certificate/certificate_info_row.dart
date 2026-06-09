import 'package:donor_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class CertificateInfoRow extends StatelessWidget {
  const CertificateInfoRow({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: context.textStyles.font14TextSecondaryMedium,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: context.textStyles.font14TextPrimaryMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

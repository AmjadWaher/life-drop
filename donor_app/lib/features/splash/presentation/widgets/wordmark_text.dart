import 'package:donor_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class WordmarkText extends StatelessWidget {
  const WordmarkText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Life ',
        style: context.textStyles.font48TextPrimaryExtraBold.copyWith(
          letterSpacing: 2,
          wordSpacing: -10,
        ),
        children: [
          TextSpan(
            text: 'Drop',
            style: context.textStyles.font48PrimaryExtraBold.copyWith(
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:donor_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearLoading extends StatelessWidget {
  const LinearLoading({super.key, required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192.w,
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? const Color.fromARGB(255, 49, 53, 59)
            : context.colors.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [
              context.isDarkMode
                  ? const Color(0xFFDB313F)
                  : context.colors.primary,
              context.isDarkMode
                  ? context.colors.primary
                  : const Color(0xFFDB313F),
            ],
            stops: const [0.0, 1.0],
          ).createShader(bounds);
        },
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.transparent,
          minHeight: 6.h,
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
      ),
    );
  }
}

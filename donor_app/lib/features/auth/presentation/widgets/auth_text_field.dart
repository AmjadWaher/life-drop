import 'package:donor_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.title,
    required this.hintTextStyle,
    required this.titleStyle,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.controller,
    this.onTap,
    this.focusNode,
  });
  final String hintText;
  final String title;
  final TextStyle hintTextStyle;
  final TextStyle titleStyle;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final void Function()? onTap;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(title, style: titleStyle),
        verticalSpace(8),
        TextField(
          onTap: onTap,
          focusNode: focusNode,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintTextStyle,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(right: 12.w, left: 10.w),
                    child: suffixIcon,
                  )
                : null,
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 10.w, left: 12.w),
              child: prefixIcon,
            ),
          ),
        ),
      ],
    );
  }
}

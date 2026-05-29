import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrms/core/constants/app_colors.dart';

class OtpInputBox extends StatelessWidget {
  const OtpInputBox({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.previousFocusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 48,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(0xff1d2452),
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: '',
          hintText: '0',
          hintStyle: TextStyle(
            color: AppColors.grey.withOpacity(.16),
            fontWeight: FontWeight.w600,
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.zero,
          enabledBorder: _border(AppColors.grey.withOpacity(.22)),
          focusedBorder: _border(AppColors.primary),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            nextFocusNode?.requestFocus();
          } else {
            previousFocusNode?.requestFocus();
          }
        },
      ),
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/core/constants/app_colors.dart';

class SplashFooter extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const SplashFooter({super.key, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: Text(
        'Powered by Mine HR Solution',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.grey.withOpacity(0.7),
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/core/constants/app_colors.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    this.message = 'Complete your weekly report before Friday evening.',
    this.icon,
    this.iconColor,
    this.backgroundColor,
  });

  final String message;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.lightGrey,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(
            icon ?? Icons.lightbulb,
            color: iconColor ?? AppColors.warning,
            size: 22.r,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

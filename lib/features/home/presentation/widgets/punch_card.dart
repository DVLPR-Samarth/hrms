import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/core/constants/app_colors.dart';

class PunchCard extends StatelessWidget {
  const PunchCard({
    super.key,
    this.title = 'Today attendance',
    this.time = '09:30 AM',
    this.checkIn = '09:30 AM',
    this.checkOut = '--:--',
    this.backgroundColor,
  });

  final String title;
  final String time;
  final String checkIn;
  final String checkOut;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: AppColors.white, fontSize: 14.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            time,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              Expanded(
                child: _PunchInfo(label: 'Check in', value: checkIn),
              ),
              Expanded(
                child: _PunchInfo(label: 'Check out', value: checkOut),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PunchInfo extends StatelessWidget {
  const _PunchInfo({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white70, fontSize: 12.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/core/constants/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    this.greeting = 'Good morning',
    this.userName = 'John Doe',
    this.avatarText,
    this.avatarUrl,
    this.onNotificationTap,
  });

  final String greeting;
  final String userName;
  final String? avatarText;
  final String? avatarUrl;
  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundColor: AppColors.primary,
          backgroundImage: avatarUrl == null ? null : NetworkImage(avatarUrl!),
          child: Text(
            avatarUrl == null ? avatarText ?? userName.substring(0, 1) : '',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 22.sp,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onNotificationTap,
          icon: Icon(Icons.notifications_none, size: 24.r),
        ),
      ],
    );
  }
}

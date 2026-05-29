import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/core/constants/app_colors.dart';
import 'package:hrms/features/home/presentation/models/team_member_model.dart';

class TeamMemberItem extends StatelessWidget {
  const TeamMemberItem({
    super.key,
    this.member,
    this.name = 'Team Member',
    this.imageUrl =
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
    this.isOnline = false,
    this.subtitle,
  });

  final TeamMemberModel? member;
  final String name;
  final String imageUrl;
  final bool isOnline;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final memberName = member?.name ?? name;
    final memberImageUrl = member?.imageUrl ?? imageUrl;
    final memberIsOnline = member?.isOnline ?? isOnline;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.lightGrey,
                backgroundImage: NetworkImage(memberImageUrl),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 10.r,
                  width: 10.r,
                  decoration: BoxDecoration(
                    color: memberIsOnline
                        ? AppColors.success
                        : AppColors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 2.w),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  memberName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle ?? (memberIsOnline ? 'Online' : 'Offline'),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

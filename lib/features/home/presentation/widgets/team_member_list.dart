import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/core/constants/app_colors.dart';
import 'package:hrms/features/home/presentation/data/home_dummy_data.dart';
import 'package:hrms/features/home/presentation/models/team_member_model.dart';

class TeamMemberList extends StatelessWidget {
  const TeamMemberList({
    super.key,
    this.members = HomeDummyData.teamMembers,
  });

  final List<TeamMemberModel> members;

  @override
  Widget build(BuildContext context) {
    final visibleMembers = members.take(4).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'My Team',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
            ),
            SizedBox(width: 8.w),
            Icon(Icons.handshake, color: AppColors.primary, size: 26.r),
            SizedBox(width: 4.w),
            Text(
              members.length.toString().padLeft(2, '0'),
              style: TextStyle(
                color: AppColors.warning,
                fontSize: 15.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(35),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                'View All',
                style: TextStyle(
                  color: AppColors.success,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          "It's Team That can Make it Happen",
          style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
        ),
        SizedBox(height: 20.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(18.w, 34.h, 18.w, 22.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: visibleMembers.map((member) {
              return _TeamAvatar(member: member);
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _TeamAvatar extends StatelessWidget {
  const _TeamAvatar({required this.member});

  final TeamMemberModel member;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              CircleAvatar(
                radius: 38.r,
                backgroundColor: AppColors.lightGrey,
                backgroundImage: NetworkImage(member.imageUrl),
              ),
              Positioned(
                bottom: -6.h,
                child: Container(
                  height: 18.r,
                  width: 18.r,
                  decoration: BoxDecoration(
                    color: member.isOnline ? AppColors.success : AppColors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 2.w),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            member.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              height: 1.05,
            ),
          ),
        ],
      ),
    );
  }
}

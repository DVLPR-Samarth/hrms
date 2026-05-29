import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/core/constants/app_colors.dart';
import 'package:hrms/features/home/presentation/models/quick_access_model.dart';

class QuickAccessItem extends StatelessWidget {
  const QuickAccessItem({
    super.key,
    this.item,
    this.title = 'Leave',
    this.icon = Icons.event_available,
    this.color,
    this.onTap,
  });

  final QuickAccessModel? item;
  final String title;
  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final itemColor = color ?? AppColors.primary;
    final itemTitle = item?.title ?? title;
    final itemIcon = item?.icon ?? icon;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 52.r,
            width: 52.r,
            decoration: BoxDecoration(
              color: itemColor.withAlpha(31),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(itemIcon, color: itemColor, size: 24.r),
          ),
          SizedBox(height: 8.h),
          Text(
            itemTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

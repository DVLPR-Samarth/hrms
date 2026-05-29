import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms/features/home/presentation/constants/home_layout_constants.dart';
import 'package:hrms/features/home/presentation/data/home_dummy_data.dart';
import 'package:hrms/features/home/presentation/models/quick_access_model.dart';
import 'package:hrms/features/home/presentation/widgets/quick_access_item.dart';

class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({
    super.key,
    this.items = HomeDummyData.quickAccessItems,
  });

  final List<QuickAccessModel> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: HomeLayoutConstants.quickAccessColumns,
        mainAxisSpacing: HomeLayoutConstants.itemGap.h,
        crossAxisSpacing: HomeLayoutConstants.itemGap.w,
        childAspectRatio: HomeLayoutConstants.quickAccessAspectRatio,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return QuickAccessItem(title: item.title, icon: item.icon);
      },
    );
  }
}

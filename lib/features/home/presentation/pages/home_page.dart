import 'package:flutter/material.dart';
import 'package:hrms/core/constants/app_colors.dart';
import 'package:hrms/features/home/presentation/data/home_dummy_data.dart';
import 'package:hrms/features/home/presentation/widgets/action_card.dart';
import 'package:hrms/features/home/presentation/widgets/banner_card.dart';
import 'package:hrms/features/home/presentation/widgets/celebration_card.dart';
import 'package:hrms/features/home/presentation/widgets/home_header.dart';
import 'package:hrms/features/home/presentation/widgets/punch_card.dart';
import 'package:hrms/features/home/presentation/widgets/quick_access_item.dart';
import 'package:hrms/features/home/presentation/widgets/section_header.dart';
import 'package:hrms/features/home/presentation/widgets/team_member_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          children: [
            const HomeHeader(),
            const SizedBox(height: 20),
            const PunchCard(),
            const SizedBox(height: 16),
            const BannerCard(),
            const SizedBox(height: 20),
            const SectionHeader(title: 'Quick access'),
            const SizedBox(height: 12),
            GridView.builder(
              itemCount: HomeDummyData.quickAccessItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.82,
              ),
              itemBuilder: (context, index) {
                return QuickAccessItem(
                  item: HomeDummyData.quickAccessItems[index],
                );
              },
            ),
            const SizedBox(height: 20),
            const SectionHeader(title: 'Actions', actionText: 'View all'),
            const SizedBox(height: 12),
            const ActionCard(
              title: 'Apply for leave',
              subtitle: 'Request time off from your manager',
              icon: Icons.event_note_outlined,
              color: AppColors.primary,
            ),
            const SizedBox(height: 12),
            const ActionCard(
              title: 'Regularize attendance',
              subtitle: 'Fix missing punch entries',
              icon: Icons.schedule_outlined,
              color: AppColors.warning,
            ),
            const SizedBox(height: 20),
            const SectionHeader(title: 'Team today'),
            const SizedBox(height: 4),
            ...HomeDummyData.teamMembers.map(
              (member) => TeamMemberItem(member: member),
            ),
            const SizedBox(height: 16),
            const CelebrationCard(),
          ],
        ),
      ),
    );
  }
}

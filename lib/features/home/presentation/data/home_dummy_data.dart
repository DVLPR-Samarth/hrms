import 'package:flutter/material.dart';
import 'package:hrms/features/home/presentation/models/quick_access_model.dart';
import 'package:hrms/features/home/presentation/models/team_member_model.dart';

class HomeDummyData {
  static const List<TeamMemberModel> teamMembers = [
    TeamMemberModel(
      name: 'Aarav Sharma',
      imageUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
      isOnline: true,
    ),
    TeamMemberModel(
      name: 'Mira Patel',
      imageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
      isOnline: false,
    ),
    TeamMemberModel(
      name: 'Kabir Mehta',
      imageUrl:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?w=200',
      isOnline: true,
    ),
    TeamMemberModel(
      name: 'Neha Iyer',
      imageUrl:
          'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?w=200',
      isOnline: true,
    ),
  ];

  static const List<QuickAccessModel> quickAccessItems = [
    QuickAccessModel(title: 'Leave', icon: Icons.event_available),
    QuickAccessModel(title: 'Payslip', icon: Icons.receipt),
    QuickAccessModel(title: 'Attendance', icon: Icons.access_time),
    QuickAccessModel(title: 'Tasks', icon: Icons.check_circle),
    QuickAccessModel(title: 'Calendar', icon: Icons.calendar_today),
    QuickAccessModel(title: 'Holidays', icon: Icons.beach_access),
    QuickAccessModel(title: 'Documents', icon: Icons.folder_open),
    QuickAccessModel(title: 'Claims', icon: Icons.payment),
    QuickAccessModel(title: 'Directory', icon: Icons.group),
    QuickAccessModel(title: 'Policies', icon: Icons.policy),
    QuickAccessModel(title: 'Training', icon: Icons.school),
    QuickAccessModel(title: 'Support', icon: Icons.support_agent),
  ];
}

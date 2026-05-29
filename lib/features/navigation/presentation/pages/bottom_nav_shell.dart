import 'package:flutter/material.dart';
import 'package:hrms/features/chat/presentation/pages/chat_screen.dart';
import 'package:hrms/features/community/presentation/pages/community_screen.dart';
import 'package:hrms/features/home/presentation/pages/home_screen.dart';
import 'package:hrms/features/navigation/presentation/pages/menu_screen.dart';
import 'package:hrms/features/navigation/presentation/widgets/curved_bottom_nav_bar.dart';
import 'package:hrms/features/profile/presentation/pages/profile_screen.dart';

class BottomNavShell extends StatefulWidget {
  const BottomNavShell({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  State<BottomNavShell> createState() => _BottomNavShellState();
}

class _BottomNavShellState extends State<BottomNavShell> {
  late final ValueNotifier<int> _currentIndex;

  static const List<Widget> _screens = [
    HomeScreen(),
    CommunityScreen(),
    MenuScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = ValueNotifier<int>(widget.initialIndex);
  }

  @override
  void didUpdateWidget(covariant BottomNavShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialIndex != widget.initialIndex) {
      _currentIndex.value = widget.initialIndex;
    }
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ValueListenableBuilder<int>(
        valueListenable: _currentIndex,
        builder: (context, index, child) {
          return IndexedStack(index: index, children: _screens);
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
        child: ValueListenableBuilder<int>(
          valueListenable: _currentIndex,
          builder: (context, index, child) {
            return CurvedBottomNavBar(
              currentIndex: index,
              onTabSelected: (selectedIndex) {
                if (selectedIndex == _currentIndex.value) {
                  return;
                }

                _currentIndex.value = selectedIndex;
              },
            );
          },
        ),
      ),
    );
  }
}

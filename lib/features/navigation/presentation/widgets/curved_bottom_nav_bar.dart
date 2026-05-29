import 'package:flutter/material.dart';
import 'package:hrms/core/constants/app_colors.dart';
import 'package:hrms/features/navigation/presentation/widgets/bottom_nav_item.dart';

class CurvedBottomNavBar extends StatelessWidget {
  const CurvedBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  static const double height = 70;

  static const Color _activeColor = Color(0xff245f8d);
  static const Color _inactiveColor = Color(0xff9eb4d4);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: PhysicalShape(
              clipper: _NavbarClipper(),
              color: Colors.white,
              elevation: 10,
              shadowColor: Colors.black.withOpacity(.08),
              child: SizedBox(
                height: height,
                child: Row(
                  children: [
                    BottomNavItem(
                      label: 'Home',
                      icon: Icons.home_rounded,
                      isActive: currentIndex == 0,
                      activeColor: _activeColor,
                      inactiveColor: _inactiveColor,
                      onTap: () => onTabSelected(0),
                    ),

                    BottomNavItem(
                      label: 'Community',
                      icon: Icons.article_outlined,
                      isActive: currentIndex == 1,
                      activeColor: _activeColor,
                      inactiveColor: _inactiveColor,
                      onTap: () => onTabSelected(1),
                    ),

                    const SizedBox(width: 58),

                    BottomNavItem(
                      label: 'Chat',
                      icon: Icons.forum_outlined,
                      isActive: currentIndex == 3,
                      activeColor: _activeColor,
                      inactiveColor: _inactiveColor,
                      onTap: () => onTabSelected(3),
                    ),

                    BottomNavItem(
                      label: 'Profile',
                      icon: Icons.person_outline_rounded,
                      isActive: currentIndex == 4,
                      activeColor: _activeColor,
                      inactiveColor: _inactiveColor,
                      onTap: () => onTabSelected(4),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 0,
            child: Column(
              children: [
                _MenuButton(
                  isActive: currentIndex == 2,
                  onTap: () => onTabSelected(2),
                ),

                const SizedBox(height: 6),

                Text(
                  'Menu',
                  style: TextStyle(
                    color: currentIndex == 2 ? _activeColor : _inactiveColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
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

class _MenuButton extends StatelessWidget {
  const _MenuButton({required this.isActive, required this.onTap});

  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xff2d6f9e), Color(0xff1f4f78)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff245f8d).withOpacity(.22),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(
          Icons.grid_view_rounded,
          color: AppColors.white,
          size: 24,
        ),
      ),
    );
  }
}

class _NavbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final centerX = size.width / 2;

    return Path()
      ..moveTo(24, 0)
      ..quadraticBezierTo(0, 0, 0, 24)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 24)
      ..quadraticBezierTo(size.width, 0, size.width - 24, 0)
      ..lineTo(centerX + 50, 0)
      ..cubicTo(centerX + 38, 0, centerX + 36, 22, centerX, 22)
      ..cubicTo(centerX - 36, 22, centerX - 38, 0, centerX - 50, 0)
      ..lineTo(24, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';
import 'package:hrms/features/navigation/presentation/widgets/empty_tab_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyTabScreen(title: 'Menu');
  }
}

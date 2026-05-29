import 'package:flutter/material.dart';
import 'package:hrms/features/navigation/presentation/widgets/empty_tab_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyTabScreen(title: 'Home');
  }
}

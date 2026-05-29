import 'package:flutter/material.dart';
import 'package:hrms/features/navigation/presentation/widgets/empty_tab_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyTabScreen(title: 'Chat');
  }
}

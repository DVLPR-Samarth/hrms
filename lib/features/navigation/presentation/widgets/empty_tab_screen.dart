import 'package:flutter/material.dart';

class EmptyTabScreen extends StatelessWidget {
  const EmptyTabScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff7faff),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff1f5c88),
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

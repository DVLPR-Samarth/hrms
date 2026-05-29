import 'package:flutter/material.dart';
import 'package:hrms/features/home/presentation/widgets/punch_card.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    super.key,
    this.title = 'Today attendance',
    this.time = '09:30 AM',
    this.checkIn = '09:30 AM',
    this.checkOut = '--:--',
  });

  final String title;
  final String time;
  final String checkIn;
  final String checkOut;

  @override
  Widget build(BuildContext context) {
    return PunchCard(
      title: title,
      time: time,
      checkIn: checkIn,
      checkOut: checkOut,
    );
  }
}

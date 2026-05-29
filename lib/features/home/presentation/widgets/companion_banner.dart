import 'package:flutter/material.dart';
import 'package:hrms/features/home/presentation/widgets/banner_card.dart';

class CompanionBanner extends StatelessWidget {
  const CompanionBanner({
    super.key,
    this.message = 'Complete your weekly report before Friday evening.',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return BannerCard(message: message);
  }
}

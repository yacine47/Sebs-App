import 'package:flutter/material.dart';
import 'package:sebs_app/core/utils/colors.dart';

class TitleValueCard extends StatelessWidget {
  final String title;
  final String value;
  const TitleValueCard({
    super.key,
    required this.title,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: AppColors.greyTextColor),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ],
    );
  }
}

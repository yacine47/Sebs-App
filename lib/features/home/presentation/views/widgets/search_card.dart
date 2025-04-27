import 'package:flutter/material.dart';
import 'package:sebs_app/core/utils/colors.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            size: 16,
          ),
          const SizedBox(width: 8),
          const Text(
            "Search event...",
            style: TextStyle(color: AppColors.greyTextColor, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

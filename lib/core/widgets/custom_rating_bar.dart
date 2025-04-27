import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sebs_app/core/utils/app_colors.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.itemSize, required this.rating});
  final double itemSize;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemSize: itemSize,
      rating: rating,
      unratedColor: AppColors.dashedLineColor,
      itemBuilder: (context, index) => const Icon(
        Icons.star_rounded,
        color: AppColors.primaryColor,
        // size: 16,
      ),
    );
  }
}

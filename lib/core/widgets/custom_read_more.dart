import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/widgets/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomReadMore extends StatelessWidget {
  const CustomReadMore({super.key, required this.text, required this.isLoading});
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: ReadMoreText(
        text,
        trimMode: TrimMode.Line,
        colorClickableText: AppColors.greyTextColor,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        style: AppStyles.style14.copyWith(
          color: AppColors.greyTextColor,
          fontWeight: FontWeight.w300,
        ),
        lessStyle: AppStyles.style14.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
        moreStyle: AppStyles.style14.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

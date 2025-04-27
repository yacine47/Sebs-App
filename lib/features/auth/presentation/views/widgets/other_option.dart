import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/widgets/app_styles.dart';

class OtherOption extends StatelessWidget {
  const OtherOption({super.key, required this.text, required this.buttonText, required this.onTap});
  final String text;
  final String buttonText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
            text: '$text  ',
            style: Styles.style14.copyWith(
              color: AppColors.blackTextColor,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: ' $buttonText',
                recognizer: TapGestureRecognizer()..onTap = onTap,
                style: Styles.style14.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            ]),
      ),
    );
  }
}

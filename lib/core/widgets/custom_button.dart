import 'package:flutter/material.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/widgets/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.title, this.isLoadingState = false});
  final void Function()? onPressed;
  final String title;
  final bool isLoadingState;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(555),
        border: Border.all(color: Colors.transparent),
        boxShadow: const [
          // BoxShadow(
          //   color: const Color(0xff00CDBD).withOpacity(.2),
          //   offset: const Offset(6, 6),
          //   blurRadius: 20,
          // )
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
        child: isLoadingState == false
            ? Text(
                title,
                style: AppStyles.style16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Please Wait...',
                    style: AppStyles.style16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

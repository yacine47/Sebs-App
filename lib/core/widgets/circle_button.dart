import 'package:flutter/material.dart';
import 'package:sebs_app/core/utils/colors.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  const CircleButton({required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.primaryLightColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}

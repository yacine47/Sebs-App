import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sebs_app/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      toolbarHeight: 0,
      elevation: 0,
      forceMaterialTransparency: true,
    );
  }
}

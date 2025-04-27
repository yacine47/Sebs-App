import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sebs_app/core/utils/app_assets.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.logo,
      width: width,
    );
  }
}

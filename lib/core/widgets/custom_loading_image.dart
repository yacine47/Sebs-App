import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingImage extends StatelessWidget {
  const CustomLoadingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sebs_app/core/widgets/custom_loading_image.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.boxFit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  });
  final String imageUrl;
  final BoxFit boxFit;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: boxFit,
        width: double.infinity,
        height: double.infinity,
        // scale: 0.1,
        // width: (MediaQuery.of(context).size.width - 30) / 3 - (7.34 * 2),
        errorWidget: (context, url, error) => const CustomLoadingImage(),
        placeholder: (context, url) => const CustomLoadingImage(),
      ),
    );
  }
}

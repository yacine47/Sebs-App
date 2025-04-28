import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/widgets/custom_cached_network_image.dart';

class ImageCoverCard extends StatelessWidget {
  const ImageCoverCard({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 280,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Hero(
          transitionOnUserGestures: true,
          tag: eventModel.image!,
          child: Container(
            width: double.infinity,
            height: 310,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: CustomCachedNetworkImage(
              borderRadius: BorderRadius.circular(16),
              imageUrl: eventModel.image!,
            ),
          ),
        ),
        Positioned(
          right: 22,
          top: 22,
          child: Container(
            height: 65,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('MMM').format(eventModel.date!),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  DateFormat('dd').format(eventModel.date!),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/widgets/custom_cached_network_image.dart';
import 'package:sebs_app/core/widgets/custom_rating_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardEventThisMonth extends StatelessWidget {
  final EventModel eventModel;
  final VoidCallback onTap;
  final bool isLoading;
  const CardEventThisMonth({
    required this.eventModel,
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 90,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.whiteColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                transitionOnUserGestures: true,
                tag: eventModel.image!,
                child: SizedBox(
                  width: 60,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CustomCachedNetworkImage(
                      imageUrl: eventModel.image!,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventModel.title!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.place_outlined, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        eventModel.location!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.greyTextColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (!isLoading)
                    CustomRatingBar(
                      itemSize: 16,
                      rating: eventModel.averageRating!.toDouble(),
                    ),
                  // const Expanded(
                  //   child: StackParticipant(
                  //     width: 25,
                  //     height: 25,
                  //     fontSize: 12,
                  //     positionText: 95,
                  //   ),
                  // )
                ],
              ),
              const Spacer(),
              Container(
                height: 50,
                width: 35,
                decoration: BoxDecoration(
                  color: AppColors.primaryLightColor,
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
            ],
          ),
        ),
      ),
    );
  }
}

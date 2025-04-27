import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/widgets/custom_cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardPopularEvent extends StatelessWidget {
  final EventModel eventModel;
  final VoidCallback onTap;
  final bool isLoading;
  const CardPopularEvent({
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
          width: 250,
          height: 270,
          margin: const EdgeInsets.only(left: 8, right: 8),
          child: Stack(
            children: [
              _buildCardImage(),
              _buildCardDesc(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardImage() => Container(
        width: 250,
        height: 250,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              CustomCachedNetworkImage(
                imageUrl: eventModel.image!,
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 50,
                  width: 35,
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
          ),
        ),
      );

  Positioned _buildCardDesc() => Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventModel.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.place_outlined,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            eventModel.location!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.greyTextColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Container(
              //   width: 30,
              //   height: 30,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     color: AppColors.primaryLightColor,
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: const Icon(
              //     Icons.place_outlined,
              //     size: 18,
              //   ),
              // )
            ],
          ),
        ),
      );
}

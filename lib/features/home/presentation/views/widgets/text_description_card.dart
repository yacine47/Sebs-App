import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/widgets/custom_rating_bar.dart';
import 'package:sebs_app/core/widgets/custom_read_more.dart';

class TextDescriptionCard extends StatelessWidget {
  const TextDescriptionCard({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventModel.title!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        eventModel.location!,
                        style: const TextStyle(color: AppColors.greyTextColor),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                width: 65,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "\$${eventModel.price}",
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              CustomRatingBar(
                itemSize: 24,
                rating: eventModel.averageRating!.toDouble(),
              ),
              const SizedBox(width: 8),
              Text(
                eventModel.averageRating!.toDouble().toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          // const SizedBox(height: 16),
          // const StackParticipant(
          //   fontSize: 14,
          //   width: 30,
          //   height: 30,
          //   positionText: 100,
          // ),
          const SizedBox(height: 24),
          const Text(
            "Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),

          CustomReadMore(
            text: eventModel.description!,
            isLoading: false,
          ),

          const SizedBox(height: 64),
        ],
      ),
    );
  }
}

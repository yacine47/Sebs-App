import 'package:flutter/material.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/models/event_model.dart';

class CardPopularEvent extends StatelessWidget {
  final EventModel eventModel;

  const CardPopularEvent({required this.eventModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 270,
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: Stack(
        children: [
          _buildCardImage(),
          _buildCardDesc(),
        ],
      ),
    );
  }

  Container _buildCardImage() => Container(
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
              Image.network(
                eventModel.image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
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
                        eventModel.date.toString(),
                      ),
                      Text(
                        eventModel.date.toString(),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventModel.title!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        eventModel.location!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.greyTextColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.place_outlined,
                  size: 18,
                ),
              )
            ],
          ),
        ),
      );
}

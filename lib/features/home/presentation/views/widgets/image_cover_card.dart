import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/utils/colors.dart';

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
        Container(
          width: double.infinity,
          height: 310,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                eventModel.image,
              ),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  eventModel.date.split(" ")[0],
                ),
                Text(
                  eventModel.date.split(" ")[1],
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

import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/utils/app_colors.dart';

class CustomImageCoverTicket extends StatelessWidget {
  const CustomImageCoverTicket({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.network(
              eventModel.image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ],
    );
  }
}

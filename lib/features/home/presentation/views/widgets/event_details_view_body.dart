import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/app_bar_details_view.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/bottom_bar_details_view.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/image_cover_card.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/text_description_card.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                children: [
                  const AppBarDetailsView(),
                  const SizedBox(height: 24),
                  ImageCoverCard(eventModel: eventModel),
                  const SizedBox(height: 16),
                  TextDescriptionCard(eventModel: eventModel),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBarDetailsView(eventModel: eventModel),
        )
      ],
    );
  }
}

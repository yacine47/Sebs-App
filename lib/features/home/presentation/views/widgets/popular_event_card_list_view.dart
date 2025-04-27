import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/widgets/card_popular_event.dart';
import 'package:sebs_app/features/home/presentation/views/event_details_view.dart';

class PopularEventCardListView extends StatelessWidget {
  const PopularEventCardListView({super.key, required this.events, required this.isLoading});
  final List<EventModel> events;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 270,
      // padding: const EdgeInsets.only(left: 16),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (context, index) => CardPopularEvent(
          isLoading: isLoading,
          onTap: () => GoRouter.of(context).push(
            extra: events[index],
            EventDetailsView.path,
          ),
          eventModel: events[index],
        ),
      ),
    );
  }
}

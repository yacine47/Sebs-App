import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/widgets/card_popular_event.dart';
import 'package:sebs_app/features/home/presentation/views/event_details_view.dart';

class PopularEventCardListView extends StatelessWidget {
  const PopularEventCardListView({super.key, required this.events});
  final List<EventModel> events;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      padding: const EdgeInsets.only(left: 16),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => GoRouter.of(context).push(
            extra: events[index].toJson(),
            EventDetailsView.path,
          ),
          child: CardPopularEvent(eventModel: events[index]),
        ),
      ),
    );
  }
}

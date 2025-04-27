import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/utils/named_routes.dart';
import 'package:sebs_app/core/widgets/card_popular_event.dart';

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
          onTap: () => Navigator.pushNamed(
            arguments: events[index].toJson(),
            context,
            NamedRoutes.detailScreen,
          ),
          child: CardPopularEvent(eventModel: events[index]),
        ),
      ),
    );
  }
}

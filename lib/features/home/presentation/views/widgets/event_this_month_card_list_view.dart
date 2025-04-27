import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/utils/named_routes.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/card_event_this_month.dart';

class EventThisMonthCardListView extends StatelessWidget {
  const EventThisMonthCardListView({super.key, required this.events});
  final List<EventModel> events;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        shrinkWrap: true,

        physics: const NeverScrollableScrollPhysics(),
        itemCount: events.length,
        // reverse: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(arguments: events[index].toJson(), context, NamedRoutes.detailScreen),
          child: CardEventThisMonth(eventModel: events[index]),
        ),
      ),
    );
  }
}

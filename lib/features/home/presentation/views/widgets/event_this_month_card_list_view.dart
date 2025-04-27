import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/features/home/presentation/views/event_details_view.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/card_event_this_month.dart';

class EventThisMonthCardListView extends StatelessWidget {
  const EventThisMonthCardListView({super.key, required this.events, required this.isLoading});
  final List<EventModel> events;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        shrinkWrap: true,

        physics: const NeverScrollableScrollPhysics(),
        itemCount: events.length,
        // reverse: true,
        itemBuilder: (context, index) => CardEventThisMonth(
          isLoading: isLoading,
          eventModel: events[index],
          onTap: () => GoRouter.of(context).push(extra: events[index], EventDetailsView.path),
        ),
      ),
    );
  }
}

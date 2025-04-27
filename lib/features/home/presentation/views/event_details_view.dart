import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/widgets/custom_app_bar.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/event_details_view_body.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key, required this.eventData});
  static const String path = '/EventDetailsView';
  final Map<String, dynamic> eventData;
  @override
  Widget build(BuildContext context) {
    final EventModel eventModel = EventModel.fromJson(eventData);
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size(0, 0), child: CustomAppBar()),
      body: EventDetailsViewBody(eventModel: eventModel),
    );
  }
}

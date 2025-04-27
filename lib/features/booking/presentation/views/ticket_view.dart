import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/widgets/custom_app_bar.dart';
import 'package:sebs_app/features/booking/presentation/views/widgets/ticket_view_body.dart';

class TicketView extends StatelessWidget {
  const TicketView({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;
  static const String path = '/TicketView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size(0, 0), child: CustomAppBar()),
      body: SafeArea(
        child: TicketViewBody(eventModel: eventModel),
      ),
    );
  }
}

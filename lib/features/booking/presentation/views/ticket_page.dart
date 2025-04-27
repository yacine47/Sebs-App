import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/widgets/custom_app_bar.dart';
import 'package:sebs_app/features/booking/presentation/views/widgets/app_bar_ticket_view.dart';

import 'package:sebs_app/features/booking/presentation/views/widgets/ticket_details_card.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> eventData = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final EventModel eventModel = EventModel.fromJson(eventData);
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size(0, 0), child: CustomAppBar()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              AppBarTicketView(),
              const SizedBox(height: 30),
              TicketDetailsCard(eventModel: eventModel),
            ],
          ),
        ),
      ),
    );
  }
}

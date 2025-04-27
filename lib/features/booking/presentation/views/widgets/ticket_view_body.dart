import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/features/booking/presentation/views/widgets/app_bar_ticket_view.dart';
import 'package:sebs_app/features/booking/presentation/views/widgets/ticket_details_card.dart';

class TicketViewBody extends StatelessWidget {
  const TicketViewBody({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        children: [
          const AppBarTicketView(),
          const SizedBox(height: 30),
          TicketDetailsCard(eventModel: eventModel),
        ],
      ),
    );
  }
}

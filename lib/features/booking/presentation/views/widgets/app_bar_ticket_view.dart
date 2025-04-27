import 'package:flutter/material.dart';
import 'package:sebs_app/core/widgets/circle_button.dart';

class AppBarTicketView extends StatelessWidget {
  const AppBarTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.pop(context),
        ),
        const Text(
          "My Ticket",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 42),
      ],
    );
  }
}

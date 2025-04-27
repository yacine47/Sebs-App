import 'package:flutter/material.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/features/booking/presentation/views/widgets/custom_clipper_ticket.dart';
import 'package:sebs_app/features/booking/presentation/views/widgets/custom_dashed_line.dart';
import 'package:sebs_app/features/booking/presentation/views/widgets/custom_image_cover_ticket.dart';
import 'package:sebs_app/features/booking/presentation/views/widgets/title_value_card.dart';

class TicketDetailsCard extends StatelessWidget {
  const TicketDetailsCard({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipperTicket(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            CustomImageCoverTicket(eventModel: eventModel),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventModel.title!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  CustomPaint(
                    painter: CustomDashedLinePainter(),
                    child: const SizedBox(
                      height: 1,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleValueCard(title: "Name", value: "Muhammad Ridhoi"),
                      TitleValueCard(title: "Date", value: "${eventModel.date} 2022"),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleValueCard(title: "Date", value: "${eventModel.date} 2022"),
                      const TitleValueCard(title: "Seat", value: "UNOJI B12"),
                    ],
                  ),
                  const SizedBox(height: 32),
                  CustomPaint(
                    painter: CustomDashedLinePainter(),
                    child: const SizedBox(
                      height: 1,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    child: Image.asset(
                      "assets/images/barcode.png",
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

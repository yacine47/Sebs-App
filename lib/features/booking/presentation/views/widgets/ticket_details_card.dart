import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sebs_app/core/functions/time_format.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/widgets/app_styles.dart';
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
                    style: AppStyles.style18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
                  _buildRowTitleValueCard(
                    title01: 'Name',
                    title02: 'Date',
                    value01: 'Muhammad Ridhoi',
                    value02: DateFormat('dd MMMM yyyy').format(eventModel.date!),
                  ),
                  const SizedBox(height: 12),
                  _buildRowTitleValueCard(
                    title01: 'Time',
                    title02: 'Seat',
                    value01: '${timeFormat(eventModel.startTime!)} - ${timeFormat(eventModel.endTime!)}',
                    value02: 'UNOJI B12',
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

  Row _buildRowTitleValueCard({
    required String title01,
    required String title02,
    required String value01,
    required String value02,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleValueCard(title: title01, value: value01),
        TitleValueCard(title: title02, value: value02),
      ],
    );
  }
}

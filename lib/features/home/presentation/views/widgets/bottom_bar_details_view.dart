import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/utils/app_colors.dart';
import 'package:sebs_app/core/widgets/app_styles.dart';
import 'package:sebs_app/features/booking/presentation/views/ticket_view.dart';

class BottomBarDetailsView extends StatelessWidget {
  const BottomBarDetailsView({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 34, right: 34, top: 16, bottom: MediaQuery.of(context).padding.bottom),
        decoration: const BoxDecoration(color: AppColors.whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Price",
                  style: TextStyle(fontSize: 12, color: AppColors.greyTextColor),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "\$${eventModel.price}",
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      "/Person",
                      style: TextStyle(fontSize: 12, color: AppColors.greyTextColor),
                    )
                  ],
                )
              ],
            ),
            _buildGetTicketButton(
              context: context,
              isLoading: true,
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildGetTicketButton({required BuildContext context, required bool isLoading}) {
    return ElevatedButton(
      onPressed: () => GoRouter.of(context).push(
        TicketView.path,
        extra: eventModel,
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), maximumSize: const Size(200, 150)),
      child: isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Please Wait...',
                  style: AppStyles.style16.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          : const Text(
              "Get a Ticket",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';

class HeaderHomeView extends StatelessWidget {
  const HeaderHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi Yacine",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              // Row(children: [
              //   Icon(
              //     Icons.place_outlined,
              //     size: 16,
              //   ),
              //   const SizedBox(width: 4),
              //   const Text(
              //     "Jakarta, Indonesia",
              //     style: TextStyle(
              //       fontSize: 12,
              //       color: AppColors.greyTextColor,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ]),
            ],
          ),
          // Container(
          //   width: 48,
          //   height: 48,
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: NetworkImage(
          //         "https://images.unsplash.com/photo-1609010697446-11f2155278f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGUlMjBwaG90b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

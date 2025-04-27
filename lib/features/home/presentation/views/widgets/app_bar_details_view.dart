import 'package:flutter/material.dart';
import 'package:sebs_app/core/widgets/circle_button.dart';

class AppBarDetailsView extends StatelessWidget {
  const AppBarDetailsView({super.key});

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
          "Detail",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        CircleButton(
          icon: Icons.favorite_outline_outlined,
          onTap: () {},
        )
      ],
    );
  }
}

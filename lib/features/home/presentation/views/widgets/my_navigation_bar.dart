import 'package:flutter/material.dart';
import 'package:sebs_app/core/utils/colors.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 60,
      elevation: 0,
      animationDuration: const Duration(seconds: 3),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      backgroundColor: AppColors.whiteColor,
      destinations: [
        NavigationDestination(
          icon: Icon(
            Icons.place_outlined,
            size: 24,
          ),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(
            Icons.place_outlined,
            size: 24,
          ),
          label: "Ticket",
        ),
        NavigationDestination(
          icon: Icon(
            Icons.place_outlined,
            size: 24,
          ),
          label: "Event",
        ),
        NavigationDestination(
          icon: Icon(
            Icons.place_outlined,
            size: 24,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}

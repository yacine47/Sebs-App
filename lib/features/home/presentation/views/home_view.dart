import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sebs_app/core/widgets/custom_app_bar.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String path = '/HomeView';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size(0, 0), child: CustomAppBar()),
      // bottomNavigationBar: const ClipRRect(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(16),
      //     topRight: Radius.circular(16),
      //   ),
      //   child: MyNavigationBar(),
      // ),
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sebs_app/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String path = '/SplashView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SplashViewBody(),
      ),
    );
  }
}

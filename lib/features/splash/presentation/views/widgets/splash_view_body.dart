import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sebs_app/core/utils/app_assets.dart';
import 'package:sebs_app/features/auth/presentation/views/widgets/custom_logo.dart';
import 'package:sebs_app/features/home/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  late String initView;
  @override
  void initState() {
    super.initState();
    // _navigateToInitialView();
    Future.delayed(Duration(seconds: 1), () {
      // initAuthState();

      GoRouter.of(context).go(HomeView.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomLogo(
        width: MediaQuery.sizeOf(context).width * .8,
      ),
    );
  }
}

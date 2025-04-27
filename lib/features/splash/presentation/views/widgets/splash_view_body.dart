import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sebs_app/core/services/secure_storage_service.dart';
import 'package:sebs_app/core/utils/service_locator.dart';
import 'package:sebs_app/features/auth/presentation/views/login_view.dart';
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
    _navigateToInitialView();
    Future.delayed(Duration(seconds: 1), () {
      initAuthState();

      GoRouter.of(context).go(initView);
    });
  }

  Future<void> _navigateToInitialView() async {
    initView = await initialLocation();

    if (!mounted) return;
  }

  void initAuthState() {
    if (initView == HomeView.path) {
      // BlocProvider.value(value: getIt.get<AuthCubit>()..refresh(true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomLogo(
        width: MediaQuery.sizeOf(context).width * .8,
      ),
    );
  }

  Future<String> initialLocation() async {
    SecureStorageService? secureStorageService = getIt.get<SecureStorageService>();
    String? token = await secureStorageService.getToken();
    print(token);
    return token == null ? LoginView.path : HomeView.path;
  }
}

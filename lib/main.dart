import 'package:flutter/material.dart';
import 'package:sebs_app/core/utils/app_router.dart';
import 'package:sebs_app/core/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}

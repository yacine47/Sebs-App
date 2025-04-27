import 'package:flutter/material.dart';
import 'package:sebs_app/core/utils/theme.dart';
import 'package:sebs_app/core/utils/named_routes.dart';
import 'package:sebs_app/features/booking/presentation/views/ticket_page.dart';
import 'package:sebs_app/features/home/presentation/views/detail_page.dart';
import 'package:sebs_app/features/home/presentation/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case NamedRoutes.homeScreen:
            return MaterialPageRoute(builder: (context) => const HomePage());
          case NamedRoutes.detailScreen:
            return MaterialPageRoute(
              builder: (_) => const DetailPage(),
              settings: settings,
            );
          case NamedRoutes.ticketScreen:
            return MaterialPageRoute(
              builder: (context) => const TicketPage(),
              settings: settings,
            );
          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
    );
  }
}

import 'package:go_router/go_router.dart';
import 'package:sebs_app/features/booking/presentation/views/ticket_view.dart';
import 'package:sebs_app/features/home/presentation/views/event_details_view.dart';
import 'package:sebs_app/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: HomeView.path,
    routes: [
      GoRoute(
        path: HomeView.path,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: EventDetailsView.path,
        builder: (context, state) => EventDetailsView(
          eventData: state.extra as Map<String, dynamic>,
        ),
      ),
      GoRoute(
        path: TicketView.path,
        builder: (context, state) => TicketView(
          eventData: state.extra as Map<String, dynamic>,
        ),
      ),
    ],
  );
}

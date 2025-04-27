import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/utils/service_locator.dart';
import 'package:sebs_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:sebs_app/features/auth/presentation/view_models/login/login_cubit.dart';
import 'package:sebs_app/features/auth/presentation/view_models/sign_up/sign_up_cubit.dart';
import 'package:sebs_app/features/auth/presentation/views/login_view.dart';
import 'package:sebs_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:sebs_app/features/booking/presentation/views/ticket_view.dart';
import 'package:sebs_app/features/home/presentation/view_models/get_last_month_event/get_last_month_event_cubit.dart';
import 'package:sebs_app/features/home/presentation/view_models/get_popular_event/get_popular_event_cubit.dart';
import 'package:sebs_app/features/home/presentation/views/event_details_view.dart';
import 'package:sebs_app/features/home/presentation/views/home_view.dart';
import 'package:sebs_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: SplashView.path,
    routes: [
      GoRoute(
        path: SplashView.path,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.path,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: getIt.get<GetLastMonthEventCubit>()..getLastMonthEvent()),
            BlocProvider.value(value: getIt.get<GetPopularEventCubit>()..getPopularEvent()),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: LoginView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: SignUpView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(getIt.get<AuthRepoImpl>()),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: EventDetailsView.path,
        builder: (context, state) => EventDetailsView(
          eventModel: state.extra as EventModel,
        ),
      ),
      GoRoute(
        path: TicketView.path,
        builder: (context, state) => TicketView(
          eventModel: state.extra as EventModel,
        ),
      ),
    ],
  );
}

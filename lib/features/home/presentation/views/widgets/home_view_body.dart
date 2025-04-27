import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebs_app/core/widgets/custom_title.dart';
import 'package:sebs_app/features/home/presentation/view_models/event/event_cubit.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/event_this_month_card_list_view.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/header_home_view.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/popular_event_card_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 24),
      child: BlocProvider(
        create: (_) => EventCubit()..loadEventData(),
        child: Column(
          children: [
            const HeaderHomeView(),
            // const SizedBox(height: 24),
            // _buildSearch(),
            const SizedBox(height: 24),
            const CustomTitle(
              title: "Popular Event",
            ),
            const SizedBox(height: 16),
            BlocBuilder<EventCubit, EventState>(
              builder: (context, state) {
                if (state is EventError) {
                  return Center(child: Text(state.message));
                } else if (state is EventLoaded) {
                  return PopularEventCardListView(events: state.events);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const SizedBox(height: 24),
            const CustomTitle(
              title: "Event This Month",
            ),

            const SizedBox(height: 16),
            BlocBuilder<EventCubit, EventState>(
              builder: (context, state) {
                if (state is EventError) {
                  return Center(child: Text(state.message));
                } else if (state is EventLoaded) {
                  return EventThisMonthCardListView(events: state.events);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

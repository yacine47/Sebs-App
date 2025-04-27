import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/widgets/custom_title.dart';
import 'package:sebs_app/features/home/presentation/view_models/get_last_month_event/get_last_month_event_cubit.dart';
import 'package:sebs_app/features/home/presentation/view_models/get_popular_event/get_popular_event_cubit.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/event_this_month_card_list_view.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/header_home_view.dart';
import 'package:sebs_app/features/home/presentation/views/widgets/popular_event_card_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 24),
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
          BlocBuilder<GetPopularEventCubit, GetPopularEventState>(
            builder: (context, state) {
              return PopularEventCardListView(
                isLoading: state is GetPopularEventLoading,
                events: state is GetPopularEventSuccess
                    ? state.events
                    : List<EventModel>.filled(
                        5,
                        EventModel.fakeEventModel,
                      ),
              );
            },
          ),
          const SizedBox(height: 24),
          const CustomTitle(
            title: "Event This Month",
          ),

          const SizedBox(height: 16),
          BlocBuilder<GetLastMonthEventCubit, GetLastMonthEventState>(
            builder: (context, state) {
              return EventThisMonthCardListView(
                isLoading: state is GetLastMonthEventLoading,
                events: state is GetLastMonthEventSuccess
                    ? state.events
                    : List<EventModel>.filled(
                        5,
                        EventModel.fakeEventModel,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}

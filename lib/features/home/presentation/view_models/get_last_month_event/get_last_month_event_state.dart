part of 'get_last_month_event_cubit.dart';

@immutable
abstract class GetLastMonthEventState {}

class GetLastMonthEventInitial extends GetLastMonthEventState {}

class GetLastMonthEventLoading extends GetLastMonthEventState {}

class GetLastMonthEventSuccess extends GetLastMonthEventState {
  final List<EventModel> events;

  GetLastMonthEventSuccess(
    this.events,
  );
}

class GetLastMonthEventFailure extends GetLastMonthEventState {
  final String errMessage;

  GetLastMonthEventFailure(this.errMessage);
}

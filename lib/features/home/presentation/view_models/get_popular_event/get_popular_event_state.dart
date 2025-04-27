part of 'get_popular_event_cubit.dart';

@immutable
abstract class GetPopularEventState {}

class GetPopularEventInitial extends GetPopularEventState {}

class GetPopularEventLoading extends GetPopularEventState {}

class GetPopularEventSuccess extends GetPopularEventState {
  final List<EventModel> events;
  GetPopularEventSuccess(
    this.events,
  );
}

class GetPopularEventFailure extends GetPopularEventState {
  final String errMessage;
  GetPopularEventFailure(this.errMessage);
}

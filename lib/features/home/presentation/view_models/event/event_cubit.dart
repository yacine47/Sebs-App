import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebs_app/core/models/event_model.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());

  void loadEventData() async {
    emit(EventLoading());
    try {
      var data = await EventModel.getJson();
      List<dynamic> jsonResult = json.decode(data);
      List<EventModel> events = jsonResult.map((e) => EventModel.fromJson(e)).toList();
      emit(EventLoaded(events: events));
    } catch (e) {
      emit(EventError(message: 'Terjadi kesalahan saat memuat data'));
    }
  }
}

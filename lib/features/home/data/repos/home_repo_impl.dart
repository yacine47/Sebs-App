import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sebs_app/core/errs/failure.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/core/services/api_service.dart';

import 'package:sebs_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<EventModel>>> fetchDataPopularEvents() async {
    try {
      final Map<String, dynamic> response = await apiService.get(
        endPoint: 'popular-events',
      );
      final List<EventModel> events = [];
      final List<dynamic> data = response['popular_events']['data'];
      for (var evnet in data) {
        events.add(EventModel.fromJson(evnet));
      }

      return right(events);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventModel>>> fetchDataLastMonth() async {
    try {
      final Map<String, dynamic> response = await apiService.get(
        endPoint: 'last-month-events',
      );
      final List<EventModel> events = [];
      final List<dynamic> data = response['last_month_events']['data'];

      for (var evnet in data) {
        events.add(EventModel.fromJson(evnet));
      }

      return right(events);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }

      return left(ServiceFailure(e.toString()));
    }
  }
}


// iyac2077@gmail.com 
// rafinz629
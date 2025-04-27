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
      Map<String, dynamic> response = await apiService.get(
        endPoint: 'events',
      );
      List<EventModel> events = [];

      for (var evnet in response['data']) {
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
      Map<String, dynamic> response = await apiService.get(
        endPoint: 'events',
      );
      List<EventModel> events = [];

      for (var evnet in response['data']) {
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
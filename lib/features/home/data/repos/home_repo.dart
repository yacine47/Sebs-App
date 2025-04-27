import 'package:dartz/dartz.dart';
import 'package:sebs_app/core/errs/failure.dart';
import 'package:sebs_app/core/models/event_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<EventModel>>> fetchDataPopularEvents();
  Future<Either<Failure, List<EventModel>>> fetchDataLastMonth();
}

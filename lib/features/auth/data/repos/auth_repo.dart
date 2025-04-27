import 'package:dartz/dartz.dart';
import 'package:sebs_app/core/errs/failure.dart';
import 'package:sebs_app/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> register(UserModel user);
  Future<Either<Failure, String>> login({required String email, required String password});
}

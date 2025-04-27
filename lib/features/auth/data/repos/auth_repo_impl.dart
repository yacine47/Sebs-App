import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:sebs_app/core/errs/failure.dart';
import 'package:sebs_app/core/services/api_service.dart';
import 'package:sebs_app/features/auth/data/models/user_model.dart';
import 'package:sebs_app/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> login({required String email, required String password}) async {
    try {
      final Map<String, dynamic> response = await apiService.post(
        endPoint: 'login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return right(response['token']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> register(UserModel user) async {
    try {
      final Map<String, dynamic> response = await apiService.post(
        endPoint: 'register',
        data: user.toJson(),
      );

      return right(response['token']);
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
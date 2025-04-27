import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sebs_app/core/services/api_service.dart';
import 'package:sebs_app/core/services/secure_storage_service.dart';
import 'package:sebs_app/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  //apis
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  //repos
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));

  //services
  getIt.registerSingleton<SecureStorageService>(SecureStorageService());
}

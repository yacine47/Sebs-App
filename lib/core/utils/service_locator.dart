import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sebs_app/core/services/api_service.dart';
import 'package:sebs_app/core/services/secure_storage_service.dart';
import 'package:sebs_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:sebs_app/features/home/data/repos/home_repo_impl.dart';
import 'package:sebs_app/features/home/presentation/view_models/get_last_month_event/get_last_month_event_cubit.dart';
import 'package:sebs_app/features/home/presentation/view_models/get_popular_event/get_popular_event_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  //apis
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  //repos
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  //cubits
  getIt.registerSingleton<GetLastMonthEventCubit>(GetLastMonthEventCubit(getIt.get<HomeRepoImpl>()));
  getIt.registerSingleton<GetPopularEventCubit>(GetPopularEventCubit(getIt.get<HomeRepoImpl>()));

  //services
  getIt.registerSingleton<SecureStorageService>(SecureStorageService());
}

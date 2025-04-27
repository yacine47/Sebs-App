import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sebs_app/core/services/secure_storage_service.dart';
import 'package:sebs_app/core/utils/service_locator.dart';
import 'package:sebs_app/features/auth/data/models/user_model.dart';
import 'package:sebs_app/features/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  UserModel userModel = UserModel();
  Future<void> login() async {
    emit(LoginLoading());

    final result = await authRepo.login(
      email: userModel.email!,
      password: userModel.password!,
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.error)),
      (token) {
        final SecureStorageService secureStorageService = getIt.get<SecureStorageService>();
        secureStorageService.saveToken(token);

        emit(LoginSuccess());
      },
    );
  }
}

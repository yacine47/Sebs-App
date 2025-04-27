import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sebs_app/core/services/secure_storage_service.dart';
import 'package:sebs_app/core/utils/service_locator.dart';
import 'package:sebs_app/features/auth/data/models/user_model.dart';
import 'package:sebs_app/features/auth/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  UserModel userModel = UserModel();

  Future<void> signUp() async {
    emit(SignUpLoading());

    final result = await authRepo.register(userModel);

    result.fold(
      (failure) => emit(SignUpFailure(failure.error)),
      (token) {
        final SecureStorageService secureStorageService = getIt.get<SecureStorageService>();
        secureStorageService.saveToken(token);

        emit(SignUpSuccess());
      },
    );
  }
}

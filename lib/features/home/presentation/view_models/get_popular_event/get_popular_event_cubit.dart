import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/features/home/data/repos/home_repo.dart';

part 'get_popular_event_state.dart';

class GetPopularEventCubit extends Cubit<GetPopularEventState> {
  GetPopularEventCubit(this.homeRepo) : super(GetPopularEventInitial());

  final HomeRepo homeRepo;
  Future<void> getPopularEvent() async {
    emit(GetPopularEventLoading());

    final result = await homeRepo.fetchDataPopularEvents();

    result.fold(
      (failure) => emit(GetPopularEventFailure(failure.error)),
      (events) => emit(GetPopularEventSuccess(events)),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sebs_app/core/models/event_model.dart';
import 'package:sebs_app/features/home/data/repos/home_repo.dart';

part 'get_last_month_event_state.dart';

class GetLastMonthEventCubit extends Cubit<GetLastMonthEventState> {
  GetLastMonthEventCubit(this.homeRepo) : super(GetLastMonthEventInitial());

  final HomeRepo homeRepo;
  Future<void> getLastMonthEvent() async {
    emit(GetLastMonthEventLoading());

    final result = await homeRepo.fetchDataLastMonth();

    result.fold(
      (failure) => emit(GetLastMonthEventFailure(failure.error)),
      (events) => emit(GetLastMonthEventSuccess(events)),
    );
  }
}

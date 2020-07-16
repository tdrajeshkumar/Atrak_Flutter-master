import 'package:atrak/src/home/attendance/leaves/leaves.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_leaves_status_entity.dart';
import 'package:bloc/bloc.dart';

class LeavesBloc extends Bloc<LeavesEvent, LeavesState> {
  final ApiRepository _repository;

  LeavesBloc(this._repository);

  void getLeavesStatus() {
    dispatch(GetLeavesStatus());
  }

  @override
  LeavesState get initialState => LeavesState.initial();

  @override
  Stream<LeavesState> mapEventToState(
      LeavesState state, LeavesEvent event) async* {
    if (event is GetLeavesStatus) {
      yield LeavesState.loading();
      List<EmployeeLeavesStatusEntity> leavesStatus =
          await _repository.getUserLeavesStatus();

      try {
        yield LeavesState.leavesStatusLoaded(leavesStatus);
      } catch (error) {
        yield LeavesState.showError("error");
      }
    }
  }
}

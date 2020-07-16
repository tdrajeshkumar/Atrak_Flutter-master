import 'package:atrak/src/home/attendance/shift_change/shift_change.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_shift_change_request_status_entity.dart';
import 'package:bloc/bloc.dart';

class ShiftChangeBloc extends Bloc<ShiftChangeEvent, ShiftChangeState> {
  final ApiRepository _repository;

  ShiftChangeBloc(this._repository);

  void getShiftChangeRequests() {
    dispatch(GetShiftChangeRequests());
  }

  @override
  ShiftChangeState get initialState => ShiftChangeState.initial();

  @override
  Stream<ShiftChangeState> mapEventToState(
      ShiftChangeState currentState, ShiftChangeEvent event) async* {
    if (event is GetShiftChangeRequests) {
      yield ShiftChangeState.loading();
      List<EmployeeShiftChangeRequestStatusEntity> requestStatus =
          await _repository.getUserShiftChangeRequest();

      try {
        yield ShiftChangeState.requestStatusLoaded(requestStatus);
      } catch (error) {
        yield ShiftChangeState.showError("error");
      }
    }
  }
}

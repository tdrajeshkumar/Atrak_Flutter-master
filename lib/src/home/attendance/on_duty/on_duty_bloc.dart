import 'package:atrak/src/home/attendance/on_duty/on_duty.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_on_duty_status_entity.dart';
import 'package:bloc/bloc.dart';

class OnDutyBloc extends Bloc<OnDutyEvent, OnDutyState> {
  final ApiRepository _repository;

  OnDutyBloc(this._repository);

  void getOnDutyStatus() {
    dispatch(GetOnDutyStatus());
  }

  @override
  OnDutyState get initialState => OnDutyState.initial();

  @override
  Stream<OnDutyState> mapEventToState(
      OnDutyState state, OnDutyEvent event) async* {
    if (event is GetOnDutyStatus) {
      yield OnDutyState.loading();
      List<EmployeeOnDutyStatusEntity> onDutyStatus =
          await _repository.getEmployeeOnDutyStatus();

      try {
        yield OnDutyState.onDutyStatusLoaded(onDutyStatus);
      } catch (error) {
        yield OnDutyState.showError("error");
      }
    }
  }
}

import 'package:atrak/src/home/attendance/comp_off/comp_off.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_comp_off_status_entity.dart';
import 'package:bloc/bloc.dart';

class CompOffBloc extends Bloc<CompOffEvent, CompOffState> {
  final ApiRepository _repository;

  CompOffBloc(this._repository);

  void getOnDutyStatus() {
    dispatch(GetCompOffStatus());
  }

  @override
  CompOffState get initialState => CompOffState.initial();

  @override
  Stream<CompOffState> mapEventToState(
      CompOffState state, CompOffEvent event) async* {
    if (event is GetCompOffStatus) {
      yield CompOffState.loading();
      List<EmployeeCompOffStatusEntity> compOffStatus =
          await _repository.getEmployeeCompOffStatus();
      try {
        yield CompOffState.compOffStatusLoaded(compOffStatus);
      } catch (error) {
        yield CompOffState.showError(error.toString());
      }
    }
  }
}

import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:bloc/bloc.dart';

class TeamShiftChangeBloc
    extends Bloc<TeamShiftChangeEvent, TeamShiftChangeState> {
  final ApiRepository _repository;

  TeamShiftChangeBloc(this._repository);

  void showShiftChangeRequestScreen() {
    dispatch(ShowShiftChangeRequest());
  }

  void showMessage(String msg) {
    dispatch(ShowMessage(message: msg));
  }

  void showShiftChangeDetailsScreen(EmployeeTeamLeavesEntity leave) {
    dispatch(ShowShiftChangeDetails(leave: leave));
  }

  @override
  TeamShiftChangeState get initialState => TeamShiftChangeState.initial();

  @override
  Stream<TeamShiftChangeState> mapEventToState(
      TeamShiftChangeState state, TeamShiftChangeEvent event) async* {
    if (event is ShowShiftChangeRequest) {
      yield TeamShiftChangeState.showShiftChangeRequestScreen();
    }

    if (event is ShowShiftChangeDetails) {
      yield TeamShiftChangeState.loading();
      try {
        yield TeamShiftChangeState.showShiftChangeDetailsScreen(event.leave);
      } catch (err) {
        yield TeamShiftChangeState.showError(err.toString());
      }
    }

    if (event is ShowMessage) {
      yield TeamShiftChangeState.showStatusMessage(event.message);
    }
  }
}

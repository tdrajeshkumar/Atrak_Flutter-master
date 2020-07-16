import 'package:atrak/src/home/attendance/my_approvals/leaves/team_leaves.dart';
import 'package:atrak/src/home/attendance/my_approvals/leaves/team_leaves_event.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:bloc/bloc.dart';

class TeamLeavesBloc extends Bloc<TeamLeavesEvent, TeamLeavesState> {
  final ApiRepository _repository;

  TeamLeavesBloc(this._repository);

  void showLeavesRequestScreen() {
    dispatch(ShowLeavesRequest());
  }

  void showMessage(String msg) {
    dispatch(ShowMessage(message: msg));
  }

  void showLeavesDetailsScreen(EmployeeTeamLeavesEntity leave) {
    dispatch(ShowLeavesDetails(leave: leave));
  }

  @override
  TeamLeavesState get initialState => TeamLeavesState.initial();

  @override
  Stream<TeamLeavesState> mapEventToState(
      TeamLeavesState state, TeamLeavesEvent event) async* {
    if (event is ShowLeavesRequest) {
      yield TeamLeavesState.showLeavesRequestScreen();
    }

    if (event is ShowLeavesDetails) {
      yield TeamLeavesState.loading();
      print('printing leave');
      print(event.leave);
      try {
        yield TeamLeavesState.showLeavesDetailsScreen(event.leave);
      } catch (err) {
        yield TeamLeavesState.showError(err.toString());
      }
    }

    if (event is ShowMessage) {
      yield TeamLeavesState.showStatusMessage(event.message);
    }
  }
}

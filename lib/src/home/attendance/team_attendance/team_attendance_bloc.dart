import 'package:atrak/src/home/attendance/team_attendance/team_attendance.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:bloc/bloc.dart';

class TeamAttendanceBloc
    extends Bloc<TeamAttendanceEvent, TeamAttendanceState> {
  final ApiRepository _repository;

  TeamAttendanceBloc(this._repository);

  void showDashboardScreen() {
    dispatch(ShowDashboard());
  }

  void showMessage(String msg) {
    dispatch(ShowMessage(message: msg));
  }

  void showDailyAttendanceScreen() {
    dispatch(ShowDailyAttendance());
  }

  @override
  TeamAttendanceState get initialState => TeamAttendanceState.initial();

  @override
  Stream<TeamAttendanceState> mapEventToState(
      TeamAttendanceState state, TeamAttendanceEvent event) async* {
    if (event is ShowDashboard) {
      yield TeamAttendanceState.showDashboardScreen();
    }

    if (event is ShowDailyAttendance) {
      yield TeamAttendanceState.showDailyAttendanceScreen();
    }

    if (event is ShowMessage) {
      yield TeamAttendanceState.showStatusMessage(event.message);
    }
  }
}

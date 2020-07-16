import 'package:atrak/src/home/attendance/team_attendance/dashboard/team_attendance_dashboard.dart';
import 'package:atrak/src/home/attendance/team_attendance/dashboard/team_attendance_dashboard_event.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_team_attendance_entity.dart';
import 'package:bloc/bloc.dart';

class TeamAttendanceDashboardBloc
    extends Bloc<TeamAttendanceDashboardEvent, TeamAttendanceDashboardState> {
  final ApiRepository _repository;

  TeamAttendanceDashboardBloc(this._repository);

  void getTeamAttendance() {
    dispatch(GetTeamAttendance());
  }

  @override
  TeamAttendanceDashboardState get initialState =>
      TeamAttendanceDashboardState.initial();

  @override
  Stream<TeamAttendanceDashboardState> mapEventToState(
      TeamAttendanceDashboardState currentState,
      TeamAttendanceDashboardEvent event) async* {
    if (event is GetTeamAttendance) {
      yield TeamAttendanceDashboardState.loading();
      EmployeeTeamAttendanceEntity requestStatus =
          await _repository.getTeamAttendance();

      try {
        yield TeamAttendanceDashboardState.teamAttendanceLoaded(requestStatus);
      } catch (error) {
        yield TeamAttendanceDashboardState.showError("error");
      }
    }
  }
}

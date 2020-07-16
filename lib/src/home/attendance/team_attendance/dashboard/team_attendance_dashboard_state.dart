import 'package:atrak/src/repository/data/entities/employee_shift_change_request_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_team_attendance_entity.dart';

class TeamAttendanceDashboardState {
  final bool isLoading;
  final String error;
  final EmployeeTeamAttendanceEntity teamAttendance;

  const TeamAttendanceDashboardState(
      {this.isLoading, this.error, this.teamAttendance});

  factory TeamAttendanceDashboardState.initial() {
    return TeamAttendanceDashboardState(
        isLoading: false, error: null, teamAttendance: null);
  }

  factory TeamAttendanceDashboardState.loading() {
    return TeamAttendanceDashboardState(
        isLoading: true, error: null, teamAttendance: null);
  }

  factory TeamAttendanceDashboardState.showError(String msg) {
    return TeamAttendanceDashboardState(
        isLoading: false, error: msg, teamAttendance: null);
  }

  factory TeamAttendanceDashboardState.teamAttendanceLoaded(
      EmployeeTeamAttendanceEntity teamAttendance) {
    return TeamAttendanceDashboardState(
        isLoading: false, error: null, teamAttendance: teamAttendance);
  }

  TeamAttendanceDashboardState copyWith(
      {bool isLoading,
      String error,
      EmployeeShiftChangeRequestStatusEntity leavesStatus}) {
    return TeamAttendanceDashboardState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        teamAttendance: teamAttendance ?? this.teamAttendance);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is TeamAttendanceDashboardState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      'TeamAttendanceDashboardState {isLoading: $isLoading, error: $error,teamAttendance: $teamAttendance}';
}

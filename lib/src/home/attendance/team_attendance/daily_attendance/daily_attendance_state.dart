import 'package:atrak/src/repository/data/entities/employee_shift_change_request_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_team_daily_attendance_entity.dart';

class TeamDailyAttendanceState {
  final bool isLoading;
  final String error;
  final DateTime selectedDate;
  final List<TeamDailyAttendanceEntity> selectedDateList;
  final List<TeamDailyAttendanceEntity> teamDailyAttendance;

  const TeamDailyAttendanceState(
      {this.isLoading,
      this.error,
      this.selectedDate,
      this.teamDailyAttendance,
      this.selectedDateList});

  factory TeamDailyAttendanceState.initial() {
    return TeamDailyAttendanceState(
        isLoading: false,
        error: null,
        selectedDate: DateTime.now(),
        teamDailyAttendance: null,
        selectedDateList: []);
  }

  factory TeamDailyAttendanceState.loading() {
    return TeamDailyAttendanceState(
        isLoading: true,
        error: null,
        selectedDate: DateTime.now(),
        teamDailyAttendance: null,
        selectedDateList: []);
  }

  factory TeamDailyAttendanceState.showError(String msg) {
    return TeamDailyAttendanceState(
        isLoading: false,
        error: msg,
        selectedDate: DateTime.now(),
        teamDailyAttendance: null,
        selectedDateList: []);
  }

  factory TeamDailyAttendanceState.teamDailyAttendanceLoaded(
      List<TeamDailyAttendanceEntity> teamDailyAttendance) {
    return TeamDailyAttendanceState(
        isLoading: false,
        error: null,
        selectedDate: DateTime.now(),
        teamDailyAttendance: teamDailyAttendance,
        selectedDateList: []);
  }

  TeamDailyAttendanceState copyWith(
      {bool isLoading,
      String error,
      DateTime selectedDate,
      List<TeamDailyAttendanceEntity> selectedDateList,
      EmployeeShiftChangeRequestStatusEntity leavesStatus}) {
    return TeamDailyAttendanceState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        selectedDate: selectedDate ?? this.selectedDate,
        selectedDateList: selectedDateList ?? this.selectedDateList,
        teamDailyAttendance: teamDailyAttendance ?? this.teamDailyAttendance);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is TeamDailyAttendanceState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      'TeamDailyAttendanceState {isLoading: $isLoading, error: $error,selectedDate:$selectedDate,teamDailyAttendance: $teamDailyAttendance,selectedDateList:$selectedDateList}';
}

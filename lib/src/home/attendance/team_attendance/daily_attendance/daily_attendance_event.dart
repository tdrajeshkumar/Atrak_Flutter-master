import 'package:atrak/src/repository/data/entities/employee_team_daily_attendance_entity.dart';
import 'package:meta/meta.dart';

abstract class TeamDailyAttendanceEvent {}

class LoadTeamDailyAttendanceEvent extends TeamDailyAttendanceEvent {}

class UpdateSelectedDate extends TeamDailyAttendanceEvent {
  final List<TeamDailyAttendanceEntity> selectedDateList;
  final DateTime selectedDate;
  UpdateSelectedDate(
      {@required this.selectedDateList, @required this.selectedDate});
}

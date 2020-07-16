import 'package:meta/meta.dart';

abstract class TeamAttendanceEvent {}

class ShowDashboard extends TeamAttendanceEvent {}

class ShowDailyAttendance extends TeamAttendanceEvent {}

class ShowMessage extends TeamAttendanceEvent {
  final String message;

  ShowMessage({@required this.message});
}

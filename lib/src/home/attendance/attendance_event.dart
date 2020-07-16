abstract class AttendanceEvent {}

class ShowDashboard extends AttendanceEvent {}

class ShowMyAttendance extends AttendanceEvent {}

class ShowHolidayList extends AttendanceEvent {}

class ShowLeaves extends AttendanceEvent {}

class ShowShiftChange extends AttendanceEvent {}

class ShowPermissionScreen extends AttendanceEvent {}

class ShowOnDuty extends AttendanceEvent {}

class ShowCompOff extends AttendanceEvent {}

class ShowManualPunch extends AttendanceEvent {}

class ShowTeamAttendance extends AttendanceEvent {}

class ShowMyApprovals extends AttendanceEvent {}

class ShowProfile extends AttendanceEvent {}

class ShowStatusMessage extends AttendanceEvent {
  final String statusMessage;
  ShowStatusMessage({this.statusMessage});
}

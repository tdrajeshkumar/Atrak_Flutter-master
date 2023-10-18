// import 'package:atrak/src/home/attendance/attendance.dart';
// import 'package:bloc/bloc.dart';

import 'home/attendance/attendance.dart';
import 'package:bloc/bloc.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  void showDashboard() {
    dispatch(ShowDashboard());
  }

  void showMyAttendance() {
    dispatch(ShowMyAttendance());
  }

  void showHolidayList() {
    dispatch(ShowHolidayList());
  }

  void showLeaves() {
    dispatch(ShowLeaves());
  }

  void showOnDuty() {
    dispatch(ShowOnDuty());
  }

  void showMessage(String message) {
    dispatch(ShowStatusMessage(statusMessage: message));
  }

  void showShiftChange() {
    dispatch(ShowShiftChange());
  }

  void showPermission() {
    dispatch(ShowPermissionScreen());
  }

  void showCompOff() {
    dispatch(ShowCompOff());
  }

  void showManualPunch() {
    dispatch(ShowManualPunch());
  }

  void showTeamAttendance() {
    dispatch(ShowTeamAttendance());
  }

  void showMyApprovals() {
    dispatch(ShowMyApprovals());
  }

  void showProfile() {
    dispatch(ShowProfile());
  }

  @override
  get initialState => AttendanceState.initial();

  @override
  Stream<AttendanceState> mapEventToState(
      AttendanceState state, AttendanceEvent event) async* {
    if (event is ShowDashboard) {
      yield AttendanceState.dashboardScreen();
    }

    if (event is ShowMyAttendance) {
      yield AttendanceState.myAttendanceScreen();
    }

    if (event is ShowHolidayList) {
      yield AttendanceState.holidayListScreen();
    }

    if (event is ShowLeaves) {
      yield AttendanceState.leavesScreen();
    }

    if (event is ShowShiftChange) {
      yield AttendanceState.shiftChange();
    }

    if (event is ShowPermissionScreen) {
      yield AttendanceState.permissionScreen();
    }

    if (event is ShowOnDuty) {
      yield AttendanceState.onDutyScreen();
    }

    if (event is ShowCompOff) {
      yield AttendanceState.compOffScreen();
    }

    if (event is ShowManualPunch) {
      yield AttendanceState.manualPunchScreen();
    }

    if (event is ShowTeamAttendance) {
      yield AttendanceState.teamAttendanceScreen();
    }

    if (event is ShowMyApprovals) {
      yield AttendanceState.myApprovalsScreen();
    }

    if (event is ShowProfile) {
      yield AttendanceState.profileScreen();
    }

    if (event is ShowStatusMessage) {
      yield AttendanceState.showStatusMessage(event.statusMessage);
    }
  }
}

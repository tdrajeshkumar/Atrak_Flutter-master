class AttendanceState {
  final bool showDashboardScreen;
  final bool showMyAttendanceScreen;
  final bool showHolidayListScreen;
  final bool showLeavesScreen;
  final bool showShiftChangeScreen;
  final bool showPermissionScreen;
  final bool showOnDutyScreen;
  final bool showCompOffScreen;
  final bool showTeamAttendanceScreen;
  final bool showManualPunchScreen;
  final bool showMyApprovalsScreen;
  final bool showProfileScreen;
  final String statusMessage;

  const AttendanceState(
      {this.showMyAttendanceScreen,
      this.showDashboardScreen,
      this.showHolidayListScreen,
      this.showLeavesScreen,
      this.showShiftChangeScreen,
      this.showPermissionScreen,
      this.showOnDutyScreen,
      this.showCompOffScreen,
      this.showManualPunchScreen,
      this.showTeamAttendanceScreen,
      this.showMyApprovalsScreen,
      this.showProfileScreen,
      this.statusMessage});

  AttendanceState copyWith(
          {bool showDashboard,
          bool showMyAttendance,
          bool showHolidayList,
          bool showLeaves,
          bool showShiftChange,
          bool showOnDutyScreen,
          bool showPermissionScreen,
          bool showCompOffScreen,
          bool showTeamAttendanceScreen,
          bool showManualPunchScreen,
          bool showMyApprovalsScreen,
          bool showProfileScreen,
          String statusMessage}) =>
      AttendanceState(
          showDashboardScreen: showDashboard ?? this.showDashboardScreen,
          showMyAttendanceScreen:
              showMyAttendance ?? this.showMyAttendanceScreen,
          showHolidayListScreen: showHolidayList ?? this.showHolidayListScreen,
          showLeavesScreen: showLeaves ?? this.showLeavesScreen,
          showShiftChangeScreen: showShiftChange ?? this.showShiftChangeScreen,
          showPermissionScreen:
              showPermissionScreen ?? this.showPermissionScreen,
          showOnDutyScreen: showOnDutyScreen ?? this.showOnDutyScreen,
          showCompOffScreen: showCompOffScreen ?? this.showCompOffScreen,
          showTeamAttendanceScreen:
              showTeamAttendanceScreen ?? this.showTeamAttendanceScreen,
          showManualPunchScreen:
              showManualPunchScreen ?? this.showManualPunchScreen,
          showMyApprovalsScreen:
              showMyApprovalsScreen ?? this.showMyApprovalsScreen,
          showProfileScreen: showProfileScreen ?? this.showProfileScreen,
          statusMessage: statusMessage ?? this.statusMessage);

  factory AttendanceState.initial() => AttendanceState(
      showDashboardScreen: true,
      showMyAttendanceScreen: false,
      showHolidayListScreen: false,
      showShiftChangeScreen: false,
      showPermissionScreen: false,
      showCompOffScreen: false,
      showManualPunchScreen: false,
      showOnDutyScreen: false,
      showTeamAttendanceScreen: false,
      showMyApprovalsScreen: false,
      showProfileScreen: false,
      showLeavesScreen: false);

  factory AttendanceState.dashboardScreen() => AttendanceState.initial();

  factory AttendanceState.myAttendanceScreen() => AttendanceState.initial()
      .copyWith(showDashboard: false, showMyAttendance: true);

  factory AttendanceState.holidayListScreen() => AttendanceState.initial()
      .copyWith(showDashboard: false, showHolidayList: true);

  factory AttendanceState.leavesScreen() => AttendanceState.initial()
      .copyWith(showDashboard: false, showLeaves: true);

  factory AttendanceState.showStatusMessage(String statusMessage) =>
      AttendanceState.initial().copyWith(statusMessage: statusMessage);

  factory AttendanceState.shiftChange() => AttendanceState.initial()
      .copyWith(showDashboard: false, showShiftChange: true);

  factory AttendanceState.permissionScreen() => AttendanceState.initial()
      .copyWith(showDashboard: false, showPermissionScreen: true);

  factory AttendanceState.onDutyScreen() => AttendanceState.initial()
      .copyWith(showDashboard: false, showOnDutyScreen: true);

  factory AttendanceState.compOffScreen() => AttendanceState.initial()
      .copyWith(showDashboard: false, showCompOffScreen: true);

  factory AttendanceState.manualPunchScreen() => AttendanceState.initial()
      .copyWith(showDashboard: false, showManualPunchScreen: true);

  factory AttendanceState.teamAttendanceScreen() => AttendanceState.initial()
      .copyWith(showDashboard: false, showTeamAttendanceScreen: true);

  factory AttendanceState.myApprovalsScreen() => AttendanceState.initial()
      .copyWith(showDashboard: false, showMyApprovalsScreen: true);

  factory AttendanceState.profileScreen() => AttendanceState.initial()
      .copyWith(showDashboard: false, showProfileScreen: true);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendanceState &&
          runtimeType == other.runtimeType &&
          showDashboardScreen == other.showDashboardScreen &&
          showMyAttendanceScreen == other.showMyAttendanceScreen &&
          showHolidayListScreen == other.showHolidayListScreen &&
          showLeavesScreen == other.showLeavesScreen &&
          showShiftChangeScreen == other.showShiftChangeScreen &&
          showPermissionScreen == other.showPermissionScreen &&
          showOnDutyScreen == other.showOnDutyScreen &&
          showCompOffScreen == other.showCompOffScreen &&
          showManualPunchScreen == other.showManualPunchScreen &&
          showTeamAttendanceScreen == other.showTeamAttendanceScreen &&
          showMyApprovalsScreen == other.showMyApprovalsScreen &&
          showProfileScreen == other.showProfileScreen &&
          statusMessage == other.statusMessage;

  @override
  int get hashCode =>
      showDashboardScreen.hashCode ^
      showMyAttendanceScreen.hashCode ^
      showHolidayListScreen.hashCode ^
      showLeavesScreen.hashCode ^
      showShiftChangeScreen.hashCode ^
      showPermissionScreen.hashCode ^
      showOnDutyScreen.hashCode ^
      showCompOffScreen.hashCode ^
      showManualPunchScreen.hashCode ^
      showTeamAttendanceScreen.hashCode ^
      showMyApprovalsScreen.hashCode ^
      showProfileScreen.hashCode ^
      statusMessage.hashCode;

  @override
  String toString() =>
      'AttendanceState { showDashBoardScreen: $showDashboardScreen,showProfileScreen:$showProfileScreen, showManualPunchScreen: $showManualPunchScreen, showCompOffScreen:$showCompOffScreen, showMyAttendanceScreen: $showMyAttendanceScreen, showHolidayListScreen: $showHolidayListScreen, showShiftChangeScreen: $showShiftChangeScreen, showPermissionScreen: $showPermissionScreen, showOnDutyScreen: $showOnDutyScreen, showMyApprovalsScreen: $showMyApprovalsScreen, statusMessage: $statusMessage}';
}

class TeamAttendanceState {
  final bool isLoading;
  final bool showDashboard;
  final bool showDailyAttendance;
  final String message;
  final String error;

  const TeamAttendanceState(
      {this.isLoading,
      this.showDashboard,
      this.showDailyAttendance,
      this.message,
      this.error});

  factory TeamAttendanceState.initial() {
    return TeamAttendanceState(
        isLoading: false,
        showDashboard: true,
        showDailyAttendance: false,
        message: '',
        error: null);
  }

  factory TeamAttendanceState.loading() {
    return TeamAttendanceState.initial().copyWith(isLoading: true);
  }

  factory TeamAttendanceState.showError(String msg) {
    return TeamAttendanceState.initial().copyWith(error: msg);
  }

  factory TeamAttendanceState.showDashboardScreen() {
    return TeamAttendanceState.initial().copyWith(showDashboard: true);
  }

  factory TeamAttendanceState.showDailyAttendanceScreen() {
    return TeamAttendanceState.initial()
        .copyWith(showDashboard: false, showDailyAttendance: true);
  }

  factory TeamAttendanceState.showStatusMessage(String msg) {
    return TeamAttendanceState.initial().copyWith(message: msg);
  }

  TeamAttendanceState copyWith(
      {bool isLoading,
      bool showDashboard,
      bool showDailyAttendance,
      String message,
      String error}) {
    return TeamAttendanceState(
        isLoading: isLoading ?? this.isLoading,
        showDashboard: showDashboard ?? this.showDashboard,
        showDailyAttendance: showDailyAttendance ?? this.showDailyAttendance,
        message: message ?? this.message,
        error: error ?? this.error);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is TeamAttendanceState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          showDashboard == other.showDashboard &&
          showDailyAttendance == other.showDailyAttendance &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      showDashboard.hashCode ^
      showDailyAttendance.hashCode ^
      error.hashCode;

  @override
  String toString() =>
      'TeamAttendanceState {isLoading: $isLoading, showLeavesRequest: $showDashboard,showDailyAttendance:$showDailyAttendance error: $error}';
}

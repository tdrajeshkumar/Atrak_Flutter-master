class HomeState {
  final bool showHomeScreen;
  final bool showAttendanceScreen;

  const HomeState({this.showHomeScreen, this.showAttendanceScreen});

  HomeState copyWith({bool showHomeScreen, bool showAttendanceScreen}) =>
      HomeState(
          showHomeScreen: showHomeScreen ?? this.showHomeScreen,
          showAttendanceScreen:
              showAttendanceScreen ?? this.showAttendanceScreen);

  factory HomeState.initial() =>
      HomeState(showHomeScreen: true, showAttendanceScreen: false);

  factory HomeState.homeScreen() => HomeState.initial();

  factory HomeState.attendanceScreen() => HomeState.initial()
      .copyWith(showHomeScreen: false, showAttendanceScreen: true);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeState &&
          runtimeType == other.runtimeType &&
          showHomeScreen == other.showHomeScreen &&
          showAttendanceScreen == other.showAttendanceScreen;

  @override
  int get hashCode => showHomeScreen.hashCode ^ showAttendanceScreen.hashCode;

  @override
  String toString() =>
      'HomeState { showHomeScreen: $showHomeScreen,showAttendanceScreen:$showAttendanceScreen}';
}

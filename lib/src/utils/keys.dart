import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AtrakKeys {
  ///Splash Screen
  static final splashScreen = const Key('__SplashScreen__');

  ///Login Screen
  static final loginScreen = const Key('__loginScreen__');
  static final loginKey = const Key('__loginKey__');
  static final resetKey = const Key('__resetKey__');

  /// My Attendance
  static final myAttendanceScreen = const Key('__myAttendanceScreen__');

  /// Leaves Screen keys
  static final leavesScreen = const Key('__leavesScreen__');

  /// Approval Leaves Screen keys
  static final approvalLeavesScreen = const Key('__approvalLeavesScreen__');

  /// Approval Leaves Screen keys
  static final approvalLeavesScreenScaffold =
      GlobalKey<ScaffoldState>(debugLabel: '__approvalLeavesScreenScaffold__');

  static final fromDateFieldKey =
      GlobalKey<FormFieldState>(debugLabel: '__leavesFromDate__');
  static final toDateFieldKey =
      GlobalKey<FormFieldState>(debugLabel: '__leavesToDate__');

  static final leavesTabBar = const PageStorageKey<String>('__leavesTabBar__');
  static final leavesTabView =
      const PageStorageKey<String>('__leavesTabBarView__');

  /// Shift Change Screen
  static final shiftChangeTabBar =
      const PageStorageKey<String>('__shiftChangeTabBar__');
  static final shiftChangeTabBarView =
      const PageStorageKey<String>('__shiftChangeTabBarView__');

  /// Permission Screen
  static final permissionTabView =
      const PageStorageKey<String>('__permissionView__');
}

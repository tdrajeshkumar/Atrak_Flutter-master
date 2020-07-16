import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/comp_off/comp_off_screen.dart';
import 'package:atrak/src/home/attendance/dashboard/dashboard.dart';
import 'package:atrak/src/home/attendance/holiday_list/holiday_list.dart';
import 'package:atrak/src/home/attendance/leaves/leaves.dart';
import 'package:atrak/src/home/attendance/manual_punch/manual_punch_screen.dart';
import 'package:atrak/src/home/attendance/my_approvals/my_approvals.dart';
import 'package:atrak/src/home/attendance/my_attendance/my_attendance.dart';
import 'package:atrak/src/home/attendance/on_duty/on_duty_screen.dart';
import 'package:atrak/src/home/attendance/permission/permission.dart';
import 'package:atrak/src/home/attendance/profile/profile_screen.dart';
import 'package:atrak/src/home/attendance/shift_change/shift_change.dart';
import 'package:atrak/src/home/attendance/team_attendance/team_attendance_screen.dart';
import 'package:atrak/src/home/home_bloc.dart';
import 'package:atrak/src/widgets/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final HomeBloc _bloc;

  AttendanceScreen(this._bloc);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final AttendanceBloc _attendanceBloc = AttendanceBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceEvent, AttendanceState>(
      bloc: _attendanceBloc,
      builder: (context, attendanceState) {
        if (_showStatusMessage(attendanceState)) {
          _onWidgetDidBuild(() {
            widget._scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text(attendanceState.statusMessage)),
            );
            _attendanceBloc.showDashboard();
          });
        }

        List<Widget> _widgets = [];

        if (attendanceState.showDashboardScreen) {
          _widgets.add(DashboardScreen(
              widget._scaffoldKey, _attendanceBloc, widget._bloc));
        }
        if (attendanceState.showMyAttendanceScreen) {
          _widgets.add(MyAttendanceScreen(_attendanceBloc));
        }

        if (attendanceState.showHolidayListScreen) {
          _widgets.add(HolidayListScreen(_attendanceBloc));
        }

        if (attendanceState.showLeavesScreen) {
          _widgets.add(LeavesScreen(_attendanceBloc));
        }

        if (attendanceState.showShiftChangeScreen) {
          _widgets.add(ShiftChangeScreen(_attendanceBloc));
        }

        if (attendanceState.showPermissionScreen) {
          _widgets.add(PermissionScreen(_attendanceBloc));
        }

        if (attendanceState.showOnDutyScreen) {
          _widgets.add(OnDutyScreen(_attendanceBloc));
        }

        if (attendanceState.showCompOffScreen) {
          _widgets.add(CompOffScreen(_attendanceBloc));
        }

        if (attendanceState.showManualPunchScreen) {
          _widgets.add(ManualPunchScreen(_attendanceBloc));
        }

        if (attendanceState.showTeamAttendanceScreen) {
          _widgets.add(TeamAttendanceScreen(_attendanceBloc));
        }
        if (attendanceState.showMyApprovalsScreen) {
          _widgets.add(MyApprovalsScreen(_attendanceBloc));
        }

        if (attendanceState.showProfileScreen) {
          _widgets.add(ProfileScreen(_attendanceBloc));
        }

        return PageTransition(
          child: Stack(
            children: _widgets,
          ),
        );
      },
    );
  }

  bool _showStatusMessage(AttendanceState state) =>
      state.statusMessage != null && state.statusMessage.isNotEmpty;

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _attendanceBloc.dispose();
  }
}

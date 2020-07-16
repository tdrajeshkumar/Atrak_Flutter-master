import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/team_attendance/daily_attendance/daily_attendance_screen.dart';
import 'package:atrak/src/home/attendance/team_attendance/dashboard/team_attendance_dashboard_screen.dart';
import 'package:atrak/src/home/attendance/team_attendance/team_attendance.dart';
import 'package:atrak/src/home/attendance/team_attendance/team_attendance_bloc.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/widgets/loading_spinner.dart';
import 'package:atrak/src/widgets/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamAttendanceScreen extends StatefulWidget {
  final AttendanceBloc attendanceBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TeamAttendanceScreen(this.attendanceBloc, {Key key}) : super(key: key);

  @override
  _TeamAttendanceScreenState createState() => _TeamAttendanceScreenState();
}

class _TeamAttendanceScreenState extends State<TeamAttendanceScreen>
    with SingleTickerProviderStateMixin {
  TeamAttendanceBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = TeamAttendanceBloc(Injector.of(context).repository);
    return BlocBuilder<TeamAttendanceEvent, TeamAttendanceState>(
      bloc: _bloc,
      builder: (context, teamAttendanceState) {
        if (_showStatusMessage(teamAttendanceState)) {
          _onWidgetDidBuild(() {
            widget._scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text(teamAttendanceState.message)),
            );
            _bloc.showDashboardScreen();
          });
        }

        List<Widget> _widgets = [];

        if (teamAttendanceState.showDashboard) {
          _widgets.add(TeamAttendanceDashboardScreen(
              widget.attendanceBloc.showDashboard, _bloc));
        }

        if (teamAttendanceState.showDailyAttendance) {
          _widgets.add(DailyAttendanceScreen(_bloc.showDashboardScreen));
        }

        if (teamAttendanceState.isLoading) {
          _widgets.add(LoadingSpinner());
        }
        return PageTransition(child: Stack(children: _widgets));
      },
    );
  }

  bool _showStatusMessage(TeamAttendanceState state) =>
      state.message != null && state.message.isNotEmpty;

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}

import 'package:atrak/src/home/attendance/team_attendance/dashboard/team_attendance_dashboard.dart';
import 'package:atrak/src/home/attendance/team_attendance/dashboard/team_attendance_dashboard_bloc.dart';
import 'package:atrak/src/home/attendance/team_attendance/dashboard/widgets/item_team_attendance_summery_card.dart';
import 'package:atrak/src/home/attendance/team_attendance/team_attendance_bloc.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TeamAttendanceDashboardScreen extends StatefulWidget {
  final Function showDashboard;
  final TeamAttendanceBloc teamBloc;

  const TeamAttendanceDashboardScreen(this.showDashboard, this.teamBloc,
      {Key key})
      : super(key: key);

  @override
  _TeamAttendanceDashboardScreenState createState() =>
      _TeamAttendanceDashboardScreenState();
}

class _TeamAttendanceDashboardScreenState
    extends State<TeamAttendanceDashboardScreen> {
  TeamAttendanceDashboardBloc _bloc;
  final double padding = 7.0;

  @override
  Widget build(BuildContext context) {
    _bloc = TeamAttendanceDashboardBloc(Injector.of(context).repository);
    _bloc.getTeamAttendance();

    return BlocBuilder<TeamAttendanceDashboardEvent,
        TeamAttendanceDashboardState>(
      bloc: _bloc,
      builder: (context, teamAttendanceState) {
        return Scaffold(
          appBar: AttendanceAppBar(
              AtrakLocalizations.of(context).teamAttendance,
              widget.showDashboard),
          body: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Timer(
                  timerColor: AtrakTheme.darkGreyColor,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: AttendanceBody(
                    title: AtrakLocalizations.of(context).leaveBalance,
                    isTitlePadding: true,
                    isBodyPadding: false,
                    child: teamAttendanceState.teamAttendance == null
                        ? CircularProgressIndicator()
                        : Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: ListView(
                              // scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                GridView.count(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.25,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: padding),
                                      child: TeamAttendanceSummeryCard(
                                        leaveType:
                                            AtrakLocalizations.of(context)
                                                .totalPresent,
                                        bigString:
                                            '${teamAttendanceState.teamAttendance.totalPresent}',
                                        smallString:
                                            '/${teamAttendanceState.teamAttendance.totalDays}',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: padding),
                                      child: TeamAttendanceSummeryCard(
                                        leaveType:
                                            AtrakLocalizations.of(context)
                                                .totalAbsent,
                                        bigString:
                                            '${teamAttendanceState.teamAttendance.totalAbsent}',
                                        smallString:
                                            '/${teamAttendanceState.teamAttendance.totalDays}',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: padding, top: padding),
                                      child: TeamAttendanceSummeryCard(
                                        leaveType:
                                            AtrakLocalizations.of(context)
                                                .avgLateComeTime,
                                        bigString:
                                            '${DateFormat('hh:mm').format(teamAttendanceState.teamAttendance.avgLateTime)}',
                                        smallString:
                                            '${DateFormat('aa').format(teamAttendanceState.teamAttendance.avgLateTime)}',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: padding, top: padding),
                                      child: TeamAttendanceSummeryCard(
                                        leaveType:
                                            AtrakLocalizations.of(context)
                                                .avgLateComeTime,
                                        bigString:
                                            '${DateFormat('hh:mm').format(teamAttendanceState.teamAttendance.avgLateTime)}',
                                        smallString:
                                            '${DateFormat('aa').format(teamAttendanceState.teamAttendance.avgLateTime)}',
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    widget.teamBloc.showDailyAttendanceScreen();
                                  },
                                  child: Card(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 30.0,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(7.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                colors: [
                                                  AtrakTheme.gradientStartColor,
                                                  AtrakTheme.gradientEndColor,
                                                ],
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.calendar_today,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            AtrakLocalizations.of(context)
                                                .dailyAttendance,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline
                                                .copyWith(
                                                  color:
                                                      AtrakTheme.darkGreyColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

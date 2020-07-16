import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/dashboard/dashboard.dart';
import 'package:atrak/src/home/attendance/dashboard/widgets/item_requests_dashboard.dart';
import 'package:atrak/src/home/attendance/dashboard/widgets/navigation_drawer.dart';
import 'package:atrak/src/home/attendance/dashboard/widgets/punching_dashboard.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_item_leave_balance.dart';
import 'package:atrak/src/authentication/authentication.dart';
import 'package:atrak/src/home/home_bloc.dart';
import 'package:atrak/src/widgets/geo_location.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/utils/utils.dart';
import 'package:atrak/src/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  final AttendanceBloc _attendanceBloc;
  final HomeBloc homeBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  DashboardScreen(this._scaffoldKey, this._attendanceBloc, this.homeBloc);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardBloc _dashboardBloc;
  final double leftPadding = 25.0;
  final double rightPadding = 25.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _dashboardBloc = DashboardBloc(repository: Injector.of(context).repository);
    _dashboardBloc.getEmployeeDetails();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            AtrakTheme.gradientStartColor,
            AtrakTheme.gradientEndColor
          ])),
      child: Scaffold(
        key: widget._scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: GeoLocation(),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (data) {
                print(data);
                if (data == 'goToHome') {
                  widget.homeBloc.showHome();
                }
              },
              itemBuilder: (BuildContext context) {
                List<PopupMenuItem<String>> pop = [
                  PopupMenuItem<String>(
                    value: "goToHome",
                    child: Text('Go to Home'),
                  ),
                ];
                return pop;
              },
            ),
          ],
        ),
        drawer: NavigationDrawer(
            attendanceBloc: widget._attendanceBloc,
            authBloc: BlocProvider.of<AuthenticationBloc>(context),
            bloc: _dashboardBloc),
        body: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Timer(),
              SizedBox(height: 10.0),
              Expanded(
                child: AttendanceBody(
                  title: AtrakLocalizations.of(context).leaveBalance,
                  isTitlePadding: true,
                  isBodyPadding: false,
                  child: Container(
                    color: AtrakTheme.backgroundColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                SizedBox(
                                  width: leftPadding,
                                ),
                                AttendanceItemLeaveBalance(
                                  leaveType: "Casual Leave",
                                  balanceLeave: 3,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                AttendanceItemLeaveBalance(
                                  leaveType: "Sick Leave",
                                  balanceLeave: 2,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                AttendanceItemLeaveBalance(
                                  leaveType: "Paid Leave",
                                  balanceLeave: 5,
                                ),
                                SizedBox(
                                  width: rightPadding,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 120,
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              SizedBox(width: leftPadding),
                              ItemRequestsDashboard(
                                action: "Leaves",
                                image: UrlPaths.leavesImage,
                              ),
                              SizedBox(width: 10.0),
                              ItemRequestsDashboard(
                                action: "Shift Change",
                                image: UrlPaths.shiftChangeImage,
                              ),
                              SizedBox(width: 10.0),
                              ItemRequestsDashboard(
                                action: "Permission",
                                image: UrlPaths.permissionImage,
                              ),
                              SizedBox(width: rightPadding),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: PunchingDashboard(),
                        ),
                        /*Expanded(
                                child: PunchingDashboard(
                                ))*/
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_dashboardBloc != null) {
      _dashboardBloc.dispose();
    }
    super.dispose();
  }
}

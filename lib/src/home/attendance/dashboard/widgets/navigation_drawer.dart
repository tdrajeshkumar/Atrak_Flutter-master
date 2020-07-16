import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/dashboard/dashboard.dart';
import 'package:atrak/src/home/attendance/dashboard/widgets/item_navigation_drawer.dart';
import 'package:atrak/src/authentication/authentication_bloc.dart';
import 'package:atrak/src/localization.dart';

import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/utils/url_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationDrawer extends StatelessWidget {
  final AuthenticationBloc authBloc;
  final DashboardBloc bloc;
  final AttendanceBloc attendanceBloc;

  NavigationDrawer({this.authBloc, this.bloc, this.attendanceBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardEvent, DashboardState>(
        bloc: bloc,
        builder: (context, dashboardState) {
          return Drawer(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    AtrakTheme.gradientStartColor,
                    AtrakTheme.gradientEndColor
                  ])),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: AtrakTheme.greyColor,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  AtrakLocalizations.of(context).logoText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .display3
                                      .copyWith(
                                          color: AtrakTheme.greyColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .headline
                                              .fontSize),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                elevation: 4,
                                clipBehavior: Clip.antiAlias,
                                shape: CircleBorder(
                                    side: BorderSide(
                                  color: AtrakTheme.gradientStartColor,
                                  width: 1,
                                )),
                                child: Image.asset(
                                  UrlPaths.profilePhoto,
                                  width: 75.0,
                                  height: 75.0,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 194.0,
                                  child: Text(
                                    dashboardState.employee != null
                                        ? dashboardState.employee.userFullName
                                        : "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .display3
                                        .copyWith(
                                            color: AtrakTheme.iconColor,
                                            fontSize: 21.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  "staff id: ${dashboardState.employee != null ? dashboardState.employee.staffId.substring(0, 10) : 0000}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: AtrakTheme.iconColor,
                                      fontSize: 18.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListView(
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.dashboardImage,
                                title: "Dashboard",
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              attendanceBloc.showMyAttendance();
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.myAttendanceImage,
                                title: "My Attendance"),
                          ),
                          InkWell(
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.holidayImage,
                                title: "Holiday list"),
                            onTap: () {
                              Navigator.pop(context);
                              attendanceBloc.showHolidayList();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                                height: 1.0, color: AtrakTheme.dividerColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            child: Text("Request",
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        fontSize: 16,
                                        color: AtrakTheme.greyColor)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              attendanceBloc.showLeaves();
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.leavesImage,
                                title: "Leaves"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              attendanceBloc.showShiftChange();
                            },
                            child: ItemNavigationDrawer(
                              imageUrl: UrlPaths.shiftChangeImage,
                              title: "Shift change",
                              width: 30,
                              height: 30,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              attendanceBloc.showPermission();
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.permissionImage,
                                title: "Permission"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              attendanceBloc.showOnDuty();
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.onDutyImage,
                                title: "On Duty"),
                          ),
                          ItemNavigationDrawer(
                              imageUrl: UrlPaths.overtimeImage,
                              title: "Over Time"),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              attendanceBloc.showCompOff();
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.leavesImage,
                                title: "Comp Off Req"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              attendanceBloc.showManualPunch();
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.manualPunchImage,
                                title: "Manual Punch"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 25.0,
                            ),
                            child: Container(
                                height: 1.0, color: AtrakTheme.dividerColor),
                          ),
                          dashboardState.employee != null &&
                                  dashboardState.employee.userRole != "User"
                              ? Column(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        attendanceBloc.showTeamAttendance();
                                      },
                                      child: ItemNavigationDrawer(
                                        imageUrl: UrlPaths.teamAttendanceImage,
                                        title: "Team Attendance",
                                        width: 30.0,
                                        height: 30.0,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        attendanceBloc.showMyApprovals();
                                      },
                                      child: ItemNavigationDrawer(
                                          imageUrl: UrlPaths.myApprovalsImage,
                                          title: "My Approvals"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 25.0,
                                      ),
                                      child: Container(
                                          height: 1.0,
                                          color: AtrakTheme.dividerColor),
                                    ),
                                  ],
                                )
                              : Container(),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              attendanceBloc.showProfile();
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.profileImage,
                                title: "My Profile"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              authBloc.onLogout();
                              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context))=>LoginScreen());
/*
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginScreen()));*/
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.logoutImage,
                                title: "Logout"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

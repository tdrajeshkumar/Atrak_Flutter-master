import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/permission/pages/page_permission.dart';
import 'package:atrak/src/home/attendance/permission/pages/page_permission_status.dart';
import 'package:atrak/src/home/attendance/permission/permission.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionScreen extends StatefulWidget {
  final AttendanceBloc attendanceBloc;

  const PermissionScreen(this.attendanceBloc, {Key key}) : super(key: key);

  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen>
    with SingleTickerProviderStateMixin {
  PermissionBloc _bloc;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = PermissionBloc(Injector.of(context).repository);
    _bloc.getPermissionStatus();
    return BlocBuilder<PermissionEvent, PermissionState>(
        bloc: _bloc,
        builder: (context, shiftChangeState) {
          return Scaffold(
            appBar: AttendanceAppBar(AtrakLocalizations.of(context).permission,
                widget.attendanceBloc.showDashboard),
            body: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  TabBar(
                    labelStyle: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontSize: 16),
                    labelColor: AtrakTheme.darkGreyColor,
                    indicatorWeight: 3.0,
                    indicatorColor: AtrakTheme.textIndicatorColor,
                    tabs: [
                      Tab(
                          text:
                              AtrakLocalizations.of(context).permissionRequest),
                      Tab(text: AtrakLocalizations.of(context).requestStatus),
                    ],
                    controller: _tabController,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        AttendanceBody(
                          child: PagePermissionRequest(
                              showMessage: widget.attendanceBloc.showMessage),
                          isCard: true,
                          isBodyPadding: true,
                          title:
                              AtrakLocalizations.of(context).askForPermission,
                        ),
                        AttendanceBody(
                          child: PagePermissionStatus(
                              _bloc.currentState.permissionStatus),
                          title: AtrakLocalizations.of(context).requestStatus,
                          isBodyPadding: true,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

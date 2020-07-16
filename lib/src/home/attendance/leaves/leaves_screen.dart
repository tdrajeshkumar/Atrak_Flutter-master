import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/leaves/leaves.dart';
import 'package:atrak/src/home/attendance/leaves/pages/page_leaves.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeavesScreen extends StatefulWidget {
  final AttendanceBloc attendanceBloc;

  const LeavesScreen(this.attendanceBloc, {Key key}) : super(key: key);

  @override
  _LeavesScreenState createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen>
    with SingleTickerProviderStateMixin {
  LeavesBloc _bloc;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = LeavesBloc(Injector.of(context).repository);
    _bloc.getLeavesStatus();
    return BlocBuilder<LeavesEvent, LeavesState>(
      key: AtrakKeys.leavesScreen,
      bloc: _bloc,
      builder: (context, leavesState) {
        return Scaffold(
          appBar: AttendanceAppBar(AtrakLocalizations.of(context).leaves,
              widget.attendanceBloc.showDashboard),
          body: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TabBar(
                  key: AtrakKeys.leavesTabBar,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontSize: 16),
                  labelColor: AtrakTheme.darkGreyColor,
                  indicatorWeight: 3.0,
                  indicatorColor: AtrakTheme.textIndicatorColor,
                  tabs: [
                    Tab(
                        key: AtrakKeys.leavesTabBar,
                        text: AtrakLocalizations.of(context).balance),
                    Tab(
                        key: AtrakKeys.leavesTabBar,
                        text: AtrakLocalizations.of(context).request),
                    Tab(
                        key: AtrakKeys.leavesTabBar,
                        text: AtrakLocalizations.of(context).status),
                  ],
                  controller: _tabController,
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      AttendanceBody(
                        child: PageLeavesBalance(),
                        isBodyPadding: true,
                      ),
                      AttendanceBody(
                          isCard: true,
                          isBodyPadding: true,
                          title:
                              AtrakLocalizations.of(context).leaveApplication,
                          child: PageLeavesRequest(
                              showMessage: widget.attendanceBloc.showMessage)),
                      AttendanceBody(
                          title: AtrakLocalizations.of(context).leaveStatus,
                          isBodyPadding: true,
                          child: PageLeavesStatus(
                              _bloc.currentState.leavesStatus)),
                    ],
                    controller: _tabController,
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
    _tabController.dispose();
    _bloc.dispose();
    super.dispose();
  }
}

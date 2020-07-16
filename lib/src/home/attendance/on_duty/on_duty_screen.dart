import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/on_duty/on_duty.dart';
import 'package:atrak/src/home/attendance/on_duty/on_duty_bloc.dart';
import 'package:atrak/src/home/attendance/on_duty/pages/page_on_duty.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnDutyScreen extends StatefulWidget {
  final AttendanceBloc attendanceBloc;

  const OnDutyScreen(this.attendanceBloc, {Key key}) : super(key: key);

  @override
  _OnDutyScreenState createState() => _OnDutyScreenState();
}

class _OnDutyScreenState extends State<OnDutyScreen>
    with SingleTickerProviderStateMixin {
  OnDutyBloc _bloc;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = OnDutyBloc(Injector.of(context).repository);
    _bloc.getOnDutyStatus();
    return BlocBuilder<OnDutyEvent, OnDutyState>(
      bloc: _bloc,
      builder: (context, shiftChangeState) {
        return Scaffold(
          appBar: AttendanceAppBar(AtrakLocalizations.of(context).od,
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
                    Tab(text: AtrakLocalizations.of(context).odRequest),
                    Tab(text: AtrakLocalizations.of(context).requestStatus),
                  ],
                  controller: _tabController,
                ),
                Expanded(
                  child: TabBarView(
                    key: AtrakKeys.permissionTabView,
                    controller: _tabController,
                    children: <Widget>[
                      AttendanceBody(
                        child: PageOnDutyRequest(
                            showMessage: widget.attendanceBloc.showMessage),
                        isCard: true,
                        isBodyPadding: true,
                        title: AtrakLocalizations.of(context).askForOd,
                      ),
                      AttendanceBody(
                        child:
                            PageOnDutyStatus(_bloc.currentState.onDutyStatus),
                        title: AtrakLocalizations.of(context).requestStatus,
                        isBodyPadding: true,
                      ),
                    ],
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
    _bloc.dispose();
    _tabController.dispose();
    super.dispose();
  }
}

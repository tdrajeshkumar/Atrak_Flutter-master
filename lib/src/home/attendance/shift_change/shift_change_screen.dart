import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/shift_change/pages/page_shift_change.dart';
import 'package:atrak/src/home/attendance/shift_change/shift_change.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShiftChangeScreen extends StatefulWidget {
  final AttendanceBloc attendanceBloc;

  const ShiftChangeScreen(this.attendanceBloc, {Key key}) : super(key: key);

  @override
  _ShiftChangeScreenState createState() => _ShiftChangeScreenState();
}

class _ShiftChangeScreenState extends State<ShiftChangeScreen>
    with SingleTickerProviderStateMixin {
  ShiftChangeBloc _bloc;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = ShiftChangeBloc(Injector.of(context).repository);
    _bloc.getShiftChangeRequests();
    return BlocBuilder<ShiftChangeEvent, ShiftChangeState>(
        bloc: _bloc,
        builder: (context, shiftChangeState) {
          return Scaffold(
            appBar: AttendanceAppBar(AtrakLocalizations.of(context).shiftChange,
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
                      Tab(text: AtrakLocalizations.of(context).shiftRequest),
                      Tab(text: AtrakLocalizations.of(context).requestStatus),
                    ],
                    controller: _tabController,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        AttendanceBody(
                          child: PageShiftChangeRequest(
                              showMessage: widget.attendanceBloc.showMessage),
                          isCard: true,
                          isBodyPadding: true,
                          title: AtrakLocalizations.of(context)
                              .shiftChangeApplication,
                        ),
                        AttendanceBody(
                          child: PageShiftChangeRequestStatus(
                              _bloc.currentState.requestStatus),
                          title:
                              AtrakLocalizations.of(context).shiftChangeStatus,
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

import 'package:atrak/src/home/attendance/my_approvals/leaves/leaves_request_screen/pages/page_past_requests.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_bloc.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/pages/page_active_team_shift_change_requests.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/team_shift_change_request_bloc.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/team_shift_change_requests.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/widgets/item_team_shift_change_approve_widget.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/keys.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamShiftChangeRequestScreen extends StatefulWidget {
  final Function showMyApprovalsMenu;
  final TeamShiftChangeBloc approvalBloc;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const TeamShiftChangeRequestScreen(
      {Key key, this.showMyApprovalsMenu, this.approvalBloc, this.scaffoldKey})
      : super(key: key);
  @override
  _TeamShiftChangeRequestScreenState createState() =>
      _TeamShiftChangeRequestScreenState();
}

class _TeamShiftChangeRequestScreenState
    extends State<TeamShiftChangeRequestScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TeamShiftChangeRequestBloc _bloc;

  @override
  void initState() {
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  Future<bool> _onWillPop() {
    widget.showMyApprovalsMenu();
    return Future<bool>.value(false);
  }

  @override
  Widget build(BuildContext context) {
    _bloc = TeamShiftChangeRequestBloc(Injector.of(context).repository);
    _bloc.getApprovalLeaves();
    return BlocBuilder<TeamShiftChangeRequestEvent,
        TeamShiftChangeRequestState>(
      bloc: _bloc,
      builder: (context, approvalLeavesState) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            key: widget.scaffoldKey,
            appBar: AttendanceAppBar(AtrakLocalizations.of(context).shiftChange,
                widget.showMyApprovalsMenu),
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
                      Tab(text: AtrakLocalizations.of(context).activeRequest),
                      Tab(text: AtrakLocalizations.of(context).pastRequest),
                    ],
                    controller: _tabController,
                  ),
                  Expanded(
                    child: TabBarView(
                      key: AtrakKeys.approvalLeavesScreen,
                      children: <Widget>[
                        AttendanceBody(
                          title: AtrakLocalizations.of(context).activeRequest,
                          child: PageActiveTeamShiftChangeRequests(
                            leaveBloc: _bloc,
                            approvalBloc: widget.approvalBloc,
                          ),
                        ),
                        AttendanceBody(
                          title: AtrakLocalizations.of(context).pastRequest,
                          child: PagePastRequests(
                              approvalLeavesState.pastRequests),
                        ),
                      ],
                      controller: _tabController,
                    ),
                  ),
                  ItemTeamShiftChangeApproveWidget(
                    bloc: _bloc,
                    refresher: refreshState,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  refreshState() {
    setState(() {});
  }
}

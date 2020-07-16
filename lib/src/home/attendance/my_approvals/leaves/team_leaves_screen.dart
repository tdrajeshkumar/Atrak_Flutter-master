import 'package:atrak/src/home/attendance/my_approvals/leaves/leave_details_screen/leave_details_screen.dart';
import 'package:atrak/src/home/attendance/my_approvals/leaves/leaves_request_screen/leaves_requests_screen.dart';
import 'package:atrak/src/home/attendance/my_approvals/leaves/team_leaves.dart';
import 'package:atrak/src/home/attendance/my_approvals/leaves/team_leaves_bloc.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/widgets/loading_spinner.dart';
import 'package:atrak/src/widgets/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamLeaves extends StatefulWidget {
  final Function showMyApprovalsMenu;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TeamLeaves(this.showMyApprovalsMenu, {Key key}) : super(key: key);

  @override
  _TeamLeavesState createState() => _TeamLeavesState();
}

class _TeamLeavesState extends State<TeamLeaves>
    with SingleTickerProviderStateMixin {
  TeamLeavesBloc _bloc;

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
    _bloc = TeamLeavesBloc(Injector.of(context).repository);
    return BlocBuilder<TeamLeavesEvent, TeamLeavesState>(
      bloc: _bloc,
      builder: (context, approvalLeavesState) {
        if (_showStatusMessage(approvalLeavesState)) {
          _onWidgetDidBuild(() {
            widget._scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text(approvalLeavesState.message)),
            );
            _bloc.showLeavesRequestScreen();
          });
        }

        List<Widget> _widgets = [];

        if (approvalLeavesState.showLeavesRequest) {
          _widgets.add(LeavesRequestScreen(
              showMyApprovalsMenu: widget.showMyApprovalsMenu,
              approvalBloc: _bloc,
              scaffoldKey: widget._scaffoldKey));
        }

        if (approvalLeavesState.showLeavesDetails) {
          _widgets.add(LeaveDetailScreen(
              bloc: _bloc, leave: approvalLeavesState.selectedLeaveDetail));
        }

        if (approvalLeavesState.isLoading) {
          _widgets.add(LoadingSpinner());
        }
        return PageTransition(child: Stack(children: _widgets));
      },
    );
  }

  bool _showStatusMessage(TeamLeavesState state) =>
      state.message != null && state.message.isNotEmpty;

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}

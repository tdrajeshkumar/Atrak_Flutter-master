import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_bloc.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_details/team_shift_change_request_details.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/team_shift_change_request_screen.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/widgets/loading_spinner.dart';
import 'package:atrak/src/widgets/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamShiftChange extends StatefulWidget {
  final Function showMyApprovalsMenu;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TeamShiftChange(this.showMyApprovalsMenu, {Key key}) : super(key: key);

  @override
  _TeamShiftChangeState createState() => _TeamShiftChangeState();
}

class _TeamShiftChangeState extends State<TeamShiftChange>
    with SingleTickerProviderStateMixin {
  TeamShiftChangeBloc _bloc;

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
    _bloc = TeamShiftChangeBloc(Injector.of(context).repository);
    return BlocBuilder<TeamShiftChangeEvent, TeamShiftChangeState>(
      bloc: _bloc,
      builder: (context, approvalShiftChangeState) {
        if (_showStatusMessage(approvalShiftChangeState)) {
          _onWidgetDidBuild(() {
            widget._scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text(approvalShiftChangeState.message)),
            );
            _bloc.showShiftChangeRequestScreen();
          });
        }

        List<Widget> _widgets = [];

        if (approvalShiftChangeState.showShiftChangeRequest) {
          _widgets.add(TeamShiftChangeRequestScreen(
              showMyApprovalsMenu: widget.showMyApprovalsMenu,
              approvalBloc: _bloc,
              scaffoldKey: widget._scaffoldKey));
        }

        if (approvalShiftChangeState.showShiftChangeDetails) {
          _widgets.add(TeamShiftChangeDetailScreen(
              bloc: _bloc,
              leave: approvalShiftChangeState.selectedRequestsDetail));
        }

        if (approvalShiftChangeState.isLoading) {
          _widgets.add(LoadingSpinner());
        }
        return PageTransition(child: Stack(children: _widgets));
      },
    );
  }

  bool _showStatusMessage(TeamShiftChangeState state) =>
      state.message != null && state.message.isNotEmpty;

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}

import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_bloc.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/team_shift_change_request_bloc.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/widgets/item_team_shift_change_request_card.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:flutter/material.dart';

class PageActiveTeamShiftChangeRequests extends StatelessWidget {
  final TeamShiftChangeRequestBloc leaveBloc;
  final TeamShiftChangeBloc approvalBloc;

  PageActiveTeamShiftChangeRequests({this.leaveBloc, this.approvalBloc});

  @override
  Widget build(BuildContext context) {
    List<EmployeeTeamLeavesEntity> activeRequests =
        leaveBloc.currentState.activeRequests;
    List<Widget> list = [];

    list.addAll(
      activeRequests.map(
        (entity) => ItemTeamShiftChangeCard(
            userStatus: entity,
            leaveBloc: leaveBloc,
            approvalBloc: approvalBloc),
      ),
    );

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 20.0),
      children: list,
    );
  }
}

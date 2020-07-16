import 'package:atrak/src/home/attendance/my_approvals/leaves/leaves_request_screen/widgets/item_approval_leaves_card.dart';
import 'package:atrak/src/home/attendance/my_approvals/leaves/team_leaves_bloc.dart';
import 'package:atrak/src/home/attendance/my_approvals/leaves/leaves_request_screen/leaves_request_bloc.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:flutter/material.dart';

class PageActiveRequests extends StatelessWidget {
  final LeavesRequestBloc leaveBloc;
  final TeamLeavesBloc approvalBloc;

  PageActiveRequests({this.leaveBloc, this.approvalBloc});

  @override
  Widget build(BuildContext context) {
    List<EmployeeTeamLeavesEntity> activeRequests =
        leaveBloc.currentState.activeRequests;
    List<Widget> list = [];

    list.addAll(
      activeRequests.map(
        (entity) => ItemTeamLeavesCard(
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

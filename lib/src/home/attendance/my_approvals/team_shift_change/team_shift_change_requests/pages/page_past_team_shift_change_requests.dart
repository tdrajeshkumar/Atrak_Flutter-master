import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/widgets/item_team_shift_change_request_card.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:flutter/material.dart';

class PagePastTeamShiftChangeRequests extends StatelessWidget {
  final List<EmployeeTeamLeavesEntity> pastRequests;

  PagePastTeamShiftChangeRequests(this.pastRequests);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    list.addAll(
      pastRequests.map(
        (entity) => ItemTeamShiftChangeCard(
              userStatus: entity,
              isPastRequest: true,
            ),
      ),
    );

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 20.0),
      children: list,
    );
  }
}

import 'package:atrak/src/home/attendance/my_approvals/leaves/leaves_request_screen/widgets/item_approval_leaves_card.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:flutter/material.dart';

class PagePastRequests extends StatelessWidget {
  final List<EmployeeTeamLeavesEntity> pastRequests;

  PagePastRequests(this.pastRequests);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    list.addAll(
      pastRequests.map(
        (entity) => ItemTeamLeavesCard(
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

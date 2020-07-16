import 'package:atrak/src/home/attendance/leaves/widgets/item_leave_status.dart';
import 'package:atrak/src/repository/data/entities/employee_leaves_status_entity.dart';
import 'package:flutter/material.dart';

class PageLeavesStatus extends StatelessWidget {
  final List<EmployeeLeavesStatusEntity> leavesStatus;

  PageLeavesStatus(this.leavesStatus);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    list.addAll(
        leavesStatus.map((entity) => ItemLeaveStatus(userStatus: entity)));

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 20.0),
      children: list,
    );
  }
}

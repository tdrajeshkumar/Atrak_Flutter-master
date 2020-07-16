import 'package:atrak/src/home/attendance/on_duty/widgets/item_on_duty_status.dart';
import 'package:atrak/src/repository/data/entities/employee_on_duty_status_entity.dart';
import 'package:flutter/material.dart';

class PageOnDutyStatus extends StatelessWidget {
  final List<EmployeeOnDutyStatusEntity> onDutyStatus;

  PageOnDutyStatus(this.onDutyStatus);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    list.addAll(
        onDutyStatus.map((entity) => ItemOnDutyStatus(userStatus: entity)));

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 20.0),
      children: list,
    );
  }
}

import 'package:atrak/src/home/attendance/comp_off/widgets/item_comp_off_status.dart';
import 'package:atrak/src/repository/data/entities/employee_comp_off_status_entity.dart';
import 'package:flutter/material.dart';

class PageCompOffStatus extends StatelessWidget {
  final List<EmployeeCompOffStatusEntity> compOffStatus;

  PageCompOffStatus(this.compOffStatus);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    list.addAll(
        compOffStatus.map((entity) => ItemCompOffStatus(userStatus: entity)));

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 20.0),
      children: list,
    );
  }
}

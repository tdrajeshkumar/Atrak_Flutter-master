import 'package:atrak/src/home/attendance/shift_change/widgets/item_shift_change_status.dart';
import 'package:atrak/src/repository/data/entities/employee_shift_change_request_status_entity.dart';
import 'package:flutter/material.dart';

class PageShiftChangeRequestStatus extends StatelessWidget {
  final List<EmployeeShiftChangeRequestStatusEntity> requestStatus;

  PageShiftChangeRequestStatus(this.requestStatus);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    list.addAll(requestStatus.map((entity) => ItemShiftChangeStatus(
          userStatus: entity,
        )));

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 20.0),
      children: list,
    );
  }
}

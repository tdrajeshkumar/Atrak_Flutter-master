import 'package:atrak/src/home/attendance/permission/widgets/item_permission_status.dart';
import 'package:atrak/src/repository/data/entities/employee_permission_status_entity.dart';
import 'package:flutter/material.dart';

class PagePermissionStatus extends StatelessWidget {
  final List<EmployeePermissionStatusEntity> permissionStatus;

  PagePermissionStatus(this.permissionStatus);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    list.addAll(permissionStatus
        .map((entity) => ItemPermissionStatus(userStatus: entity)));

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 20.0),
      children: list,
    );
  }
}

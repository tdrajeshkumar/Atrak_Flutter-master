import 'package:atrak/src/home/attendance/widgets/attendance_item_leave_balance.dart';
import 'package:flutter/material.dart';

class PageLeavesBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.only(top: 15),
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        children: <Widget>[
          GridTile(
              child: AttendanceItemLeaveBalance(
                  leaveType: "Casual Leave", balanceLeave: 3)),
          GridTile(
              child: AttendanceItemLeaveBalance(
                  leaveType: "Sick Leave", balanceLeave: 2)),
          GridTile(
              child: AttendanceItemLeaveBalance(
                  leaveType: "Paid Leave", balanceLeave: 5)),
          GridTile(
              child: AttendanceItemLeaveBalance(
                  leaveType: "Vacation Leave", balanceLeave: 7)),
        ],
      ),
    );
  }
}

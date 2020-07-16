import 'package:atrak/src/home/attendance/my_approvals/leaves/team_leaves_bloc.dart';
import 'package:atrak/src/home/attendance/my_approvals/leaves/leaves_request_screen/leaves_request_bloc.dart';
import 'package:atrak/src/home/attendance/my_approvals/widgets/item_request_leave_card.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:flutter/material.dart';

class ItemTeamLeavesCard extends StatefulWidget {
  final EmployeeTeamLeavesEntity userStatus;
  final bool isPastRequest;
  final LeavesRequestBloc leaveBloc;
  final TeamLeavesBloc approvalBloc;

  ItemTeamLeavesCard(
      {@required this.userStatus,
      this.isPastRequest = false,
      this.leaveBloc,
      this.approvalBloc});

  @override
  State<StatefulWidget> createState() => ItemTeamLeavesCardState();
}

class ItemTeamLeavesCardState extends State<ItemTeamLeavesCard> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.approvalBloc.showLeavesDetailsScreen(widget.userStatus);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          widget.isPastRequest
              ? Container()
              : Checkbox(
                  value: checkboxValue,
                  onChanged: _onChange,
                  activeColor: Colors.red,
                ),
          Expanded(
            child: Padding(
              padding: widget.isPastRequest
                  ? EdgeInsets.all(10.0)
                  : EdgeInsets.only(right: 10.0, bottom: 10.0),
              child: ItemRequestLeaveCardWidget(
                leave: widget.userStatus,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onChange(bool value) {
    setState(() {
      checkboxValue = value;
    });
    if (value) {
      widget.leaveBloc.addSelectedRequests(widget.userStatus);
    } else {
      widget.leaveBloc.removeSelectedRequests(widget.userStatus);
    }
  }
}

import 'package:atrak/src/home/attendance/my_approvals/leaves/team_leaves_bloc.dart';
import 'package:atrak/src/home/attendance/my_approvals/widgets/item_request_profile_details.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveDetailScreen extends StatefulWidget {
  final TeamLeavesBloc bloc;
  final EmployeeTeamLeavesEntity leave;

  const LeaveDetailScreen({Key key, this.bloc, this.leave}) : super(key: key);
  @override
  _LeaveDetailScreenState createState() => _LeaveDetailScreenState();
}

class _LeaveDetailScreenState extends State<LeaveDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onWillPop() {
    widget.bloc.showLeavesRequestScreen();
    return Future<bool>.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AttendanceAppBar(AtrakLocalizations.of(context).leaveDetails,
            widget.bloc.showLeavesRequestScreen),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RequestProfileDetailsWidget(
              imageUrl: widget.leave.imgUrl,
              name: widget.leave.staffName,
              id: widget.leave.staffId,
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 15.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AtrakLocalizations.of(context).leaveType,
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .copyWith(
                                        fontFamily: 'Work Sans',
                                        color: AtrakTheme.greyColor),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Text(
                                AtrakLocalizations.of(context).dateFrom,
                                style:
                                    Theme.of(context).textTheme.body2.copyWith(
                                          fontFamily: 'Work Sans',
                                          color: AtrakTheme.greyColor,
                                        ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Text(
                                AtrakLocalizations.of(context).dateTo,
                                style:
                                    Theme.of(context).textTheme.body2.copyWith(
                                          fontFamily: 'Work Sans',
                                          color: AtrakTheme.greyColor,
                                        ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Text(
                                AtrakLocalizations.of(context).totalDays,
                                style:
                                    Theme.of(context).textTheme.body2.copyWith(
                                          fontFamily: 'Work Sans',
                                          color: AtrakTheme.greyColor,
                                        ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Text(
                                AtrakLocalizations.of(context).reason,
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .copyWith(
                                        fontFamily: 'Work Sans',
                                        color: AtrakTheme.greyColor),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.leave.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(
                                          fontFamily: 'Work Sans',
                                          color: AtrakTheme.darkGreyColor,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Text(
                                    DateFormat("MM-dd-yyyy")
                                        .format(widget.leave.fromDate),
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(
                                            fontFamily: 'Work Sans',
                                            color: AtrakTheme.darkGreyColor),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Text(
                                    DateFormat("MM-dd-yyyy")
                                        .format(widget.leave.toDate),
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(
                                          fontFamily: 'Work Sans',
                                          color: AtrakTheme.darkGreyColor,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Text(
                                    widget.leave.totalDays,
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(
                                            fontFamily: 'Work Sans',
                                            color: AtrakTheme.darkGreyColor),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Text(
                                    widget.leave.reason,
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(
                                            fontFamily: 'Work Sans',
                                            color: AtrakTheme.darkGreyColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            color: Color(0xFFBABABA),
                            child: Text(
                              AtrakLocalizations.of(context).cancel,
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              widget.bloc.showLeavesRequestScreen();
                            },
                          ),
                          RaisedButton(
                            color: Color(0xFF39B54A),
                            child: Text(
                              AtrakLocalizations.of(context).approve,
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              widget.bloc.showLeavesRequestScreen();
                              widget.bloc.showMessage(
                                  AtrakLocalizations.of(context)
                                      .approvedSuccessfully);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

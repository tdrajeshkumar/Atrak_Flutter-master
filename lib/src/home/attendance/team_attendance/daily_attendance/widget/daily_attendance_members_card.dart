import 'package:atrak/src/home/attendance/team_attendance/daily_attendance/daily_attendance.dart';
import 'package:atrak/src/home/attendance/team_attendance/daily_attendance/daily_attendance_bloc.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EmployeeAttendanceMembersListWidget extends StatelessWidget {
  final TeamDailyAttendanceBloc bloc;

  EmployeeAttendanceMembersListWidget({this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamDailyAttendanceEvent, TeamDailyAttendanceState>(
      bloc: bloc,
      builder: (context, dailyAttendanceState) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              '${DateFormat("dd-MMM-yyyy").format(dailyAttendanceState.selectedDate)}',
              style: TextStyle(color: AtrakTheme.darkGreyColor),
            ),
          ),
          Expanded(
            child: dailyAttendanceState.selectedDateList.length != 0
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: dailyAttendanceState.selectedDateList.length,
                    itemBuilder: (context, index) {
                      print(index);
                      return Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        dailyAttendanceState
                                            .selectedDateList[index].img),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${dailyAttendanceState.selectedDateList[index].name}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .body1
                                              .copyWith(
                                                fontFamily: 'Work Sans',
                                                fontWeight: FontWeight.w600,
                                                color: AtrakTheme.darkGreyColor,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Text(
                                          '${dailyAttendanceState.selectedDateList[index].designation}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .body2
                                              .copyWith(
                                                fontFamily: 'Work Sans',
                                                color: AtrakTheme.greyColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'In time',
                                          style: Theme.of(context)
                                              .textTheme
                                              .body2
                                              .copyWith(
                                                fontFamily: 'Work Sans',
                                                color: AtrakTheme.greyColor,
                                              ),
                                        ),
                                        Text(
                                          '${DateFormat("hh:mm aaa").format(dailyAttendanceState.selectedDateList[index].inTime)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .body1
                                              .copyWith(
                                                fontFamily: 'Work Sans',
                                                fontWeight: FontWeight.w400,
                                                color: AtrakTheme.darkGreyColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 20.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                                  color:
                                                      AtrakTheme.dividerColor,
                                                  width: 1.0),
                                              right: BorderSide(
                                                  color:
                                                      AtrakTheme.dividerColor,
                                                  width: 1.0))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Out time',
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(
                                                  fontFamily: 'Work Sans',
                                                  color: AtrakTheme.greyColor,
                                                ),
                                          ),
                                          Text(
                                            '${DateFormat("hh:mm aaa").format(dailyAttendanceState.selectedDateList[index].outTime)}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1
                                                .copyWith(
                                                  fontFamily: 'Work Sans',
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AtrakTheme.darkGreyColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Duration',
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(
                                                  fontFamily: 'Work Sans',
                                                  color: AtrakTheme.greyColor,
                                                ),
                                          ),
                                          Text(
                                            '${dailyAttendanceState.selectedDateList[index].workedHours} hrs',
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1
                                                .copyWith(
                                                  fontFamily: 'Work Sans',
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AtrakTheme.darkGreyColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text('No Data Avail baby'),
                  ),
          ),
        ]);
      },
    );
  }
}

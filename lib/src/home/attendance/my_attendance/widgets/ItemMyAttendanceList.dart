import 'package:atrak/src/repository/data/entities/my_attendance_entity.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemMyAttendanceList extends StatelessWidget {
  final MyAttendanceEntity attendance;

  final DateFormat _dateFormat = DateFormat("dd\nMMM");
  final DateFormat _timeFormat = DateFormat("\nhh: mm a");

  ItemMyAttendanceList(this.attendance);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: AtrakTheme.greyColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      _dateFormat.format(attendance.date),
                      style: Theme.of(context).textTheme.headline,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                attendance.status == "Present"
                    ? Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "In time",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle
                                            .copyWith(
                                                fontSize: 14.0,
                                                color: AtrakTheme.greyColor),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: _timeFormat
                                                  .format(attendance.inTime),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500))
                                        ]),
                                  )),
                            ),
                            Container(
                              width: 1.0,
                              height: 50.0,
                              color: AtrakTheme.dividerColor,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: RichText(
                                  text: TextSpan(
                                      text: "Out time",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle
                                          .copyWith(
                                              fontSize: 14.0,
                                              color: AtrakTheme.greyColor),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: _timeFormat
                                                .format(attendance.outTime),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500))
                                      ]),
                                ),
                              ),
                            ),
                            Container(
                              width: 1.0,
                              height: 50.0,
                              color: AtrakTheme.dividerColor,
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Duration",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle
                                            .copyWith(
                                                fontSize: 14.0,
                                                color: AtrakTheme.greyColor),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  "\n${attendance.workedHours} hrs",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500))
                                        ]),
                                  )),
                            )
                          ],
                        ),
                      )
                    : Expanded(
                        child: Text(
                          attendance.status,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.title.copyWith(
                              color: attendance.status == "Holiday"
                                  ? Colors.greenAccent
                                  : Colors.red),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
                    text: TextSpan(
                        text: "In time",
                        style: Theme.of(context).textTheme.subtitle.copyWith(
                            fontSize: 14.0, color: AtrakTheme.greyColor),
                        children: <TextSpan>[
                          TextSpan(
                              text: _timeFormat.format(attendance.inTime),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle
                                  .copyWith(fontWeight: FontWeight.w500))
                        ]),
                  )),
            ),
            Container(
              width: 1.0,
              height: 50.0,
              color: AtrakTheme.dividerColor,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: RichText(
                  text: TextSpan(
                      text: "Out time",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(fontSize: 14.0, color: AtrakTheme.greyColor),
                      children: <TextSpan>[
                        TextSpan(
                            text: _timeFormat.format(attendance.outTime),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(fontWeight: FontWeight.w500))
                      ]),
                ),
              ),
            ),
            Container(
              width: 1.0,
              height: 50.0,
              color: AtrakTheme.dividerColor,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: RichText(
                    text: TextSpan(
                        text: "Duration",
                        style: Theme.of(context).textTheme.subtitle.copyWith(
                            fontSize: 14.0, color: AtrakTheme.greyColor),
                        children: <TextSpan>[
                          TextSpan(
                              text: "\n${attendance.workedHours} hrs",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle
                                  .copyWith(fontWeight: FontWeight.w500))
                        ]),
                  )),
            )


*/

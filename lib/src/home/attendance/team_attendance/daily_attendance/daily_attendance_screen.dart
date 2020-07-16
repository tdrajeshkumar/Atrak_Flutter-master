import 'package:atrak/src/home/attendance/team_attendance/daily_attendance/widget/daily_attendance_calendar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/localization.dart';
import 'package:flutter/material.dart';

class DailyAttendanceScreen extends StatefulWidget {
  final Function showDashboard;

  const DailyAttendanceScreen(this.showDashboard, {Key key}) : super(key: key);

  @override
  _DailyAttendanceScreenState createState() => _DailyAttendanceScreenState();
}

class _DailyAttendanceScreenState extends State<DailyAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AttendanceAppBar(
          AtrakLocalizations.of(context).dailyAttendance, widget.showDashboard),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 345.0,
                  child: DailyAttendanceCalendar(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

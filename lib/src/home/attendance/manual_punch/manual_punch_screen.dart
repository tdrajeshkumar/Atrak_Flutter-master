import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/manual_punch/widget/manual_punch_form.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ManualPunchScreen extends StatefulWidget {
  final AttendanceBloc attendanceBloc;

  const ManualPunchScreen(this.attendanceBloc, {Key key}) : super(key: key);

  @override
  _ManualPunchScreenState createState() => _ManualPunchScreenState();
}

class _ManualPunchScreenState extends State<ManualPunchScreen> {
  final double leftPadding = 25.0;
  final double rightPadding = 25.0;

  DateFormat monthFormat = new DateFormat("MMMM");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AttendanceAppBar(AtrakLocalizations.of(context).manualPunch,
          widget.attendanceBloc.showDashboard),
      body: Stack(
        children: <Widget>[
          AttendanceBody(
            child:
                ManualPunchForm(showMessage: widget.attendanceBloc.showMessage),
            isCard: true,
            isBodyPadding: true,
            title: AtrakLocalizations.of(context).manualPunch,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

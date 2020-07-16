import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:flutter/material.dart';

class PunchRegularizationScreen extends StatefulWidget {
  final Function showMyApprovalsMenu;

  const PunchRegularizationScreen(this.showMyApprovalsMenu, {Key key})
      : super(key: key);

  @override
  _PunchRegularizationScreenState createState() =>
      _PunchRegularizationScreenState();
}

class _PunchRegularizationScreenState extends State<PunchRegularizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AttendanceAppBar(
            "Punch Regularization", widget.showMyApprovalsMenu),
        body: Stack(
          children: <Widget>[
            AttendanceBody(
              child: Container(
                color: Colors.red,
              ),
              isCard: false,
              isBodyPadding: true,
              title: "Punch Regularization",
            ),
          ],
        ));
  }
}

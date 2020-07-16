import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/my_attendance/my_attendance.dart';
import 'package:atrak/src/home/attendance/my_attendance/widgets/ItemMyAttendanceList.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/utils/utils.dart';
import 'package:atrak/src/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/widgets/atrak_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _ITEM_HEIGHT = 100.0;

class MyAttendanceScreen extends StatefulWidget {
  final AttendanceBloc attendanceBloc;

  MyAttendanceScreen(this.attendanceBloc, {Key key}) : super(key: key);

  @override
  _MyAttendanceScreenState createState() => _MyAttendanceScreenState();
}

class _MyAttendanceScreenState extends State<MyAttendanceScreen> {
  MyAttendanceBloc _bloc;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
  }

  void _scrollToPosition(int index) {
    _scrollController.animateTo(
      index * _ITEM_HEIGHT,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    _bloc = MyAttendanceBloc(Injector.of(context).repository);
    _bloc.loadMyAttendance();

    return BlocBuilder<MyAttendanceEvent, MyAttendanceState>(
      bloc: _bloc,
      builder: (context, myAttendanceState) {
        return Scaffold(
            key: AtrakKeys.myAttendanceScreen,
            appBar: AttendanceAppBar(
                AtrakLocalizations.of(context).myAttendance,
                widget.attendanceBloc.showDashboard),
            body: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 345.0,
                      child: AtrakCalendar(
                        attendaceList: myAttendanceState.attendaceList,
                        scrollTo: _scrollToPosition,
                      ),
                    ),
                    Expanded(
                      child: AttendanceBody(
                        title:
                            AtrakLocalizations.of(context).inAndOutTimeSummary,
                        isTitlePadding: true,
                        isBodyPadding: true,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          controller: _scrollController,
                          itemCount: myAttendanceState.attendaceList.length,
                          itemBuilder: (context, index) {
                            return ItemMyAttendanceList(
                                myAttendanceState.attendaceList[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                myAttendanceState.isLoading ? LoadingSpinner() : Container(),
              ],
            ));
      },
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

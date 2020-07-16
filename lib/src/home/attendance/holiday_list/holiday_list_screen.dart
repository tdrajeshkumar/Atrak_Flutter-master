import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/holiday_list/holiday_list.dart';
import 'package:atrak/src/home/attendance/holiday_list/widgets/item_holiday_day.dart';
import 'package:atrak/src/home/attendance/holiday_list/widgets/item_holiday_month_day.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HolidayListScreen extends StatefulWidget {
  final AttendanceBloc attendanceBloc;

  const HolidayListScreen(this.attendanceBloc, {Key key}) : super(key: key);

  @override
  _HolidayListScreenState createState() => _HolidayListScreenState();
}

class _HolidayListScreenState extends State<HolidayListScreen> {
  HolidayListBloc _bloc;

  final double leftPadding = 25.0;
  final double rightPadding = 25.0;

  DateFormat monthFormat = new DateFormat("MMMM");

  @override
  Widget build(BuildContext context) {
    _bloc = HolidayListBloc(Injector.of(context).repository);
    _bloc.getHolidayList();
    return BlocBuilder<HolidayListEvent, HolidayListState>(
      bloc: _bloc,
      builder: (context, holidayState) {
        final List<Widget> holidayWidgetList = <Widget>[];

        if (holidayState.holidayList != null) {
          String currentMonth = "";
          holidayWidgetList.addAll(holidayState.holidayList.map((holiday) {
            if (currentMonth != monthFormat.format(holiday.date)) {
              currentMonth = monthFormat.format(holiday.date);
              return ItemHolidayMonthAndDay(
                  month: currentMonth, holiday: holiday);
            } else {
              return ItemHolidayDay(holiday: holiday);
            }
          }).toList());
        }
        return Scaffold(
          appBar: AttendanceAppBar(AtrakLocalizations.of(context).holidayList,
              widget.attendanceBloc.showDashboard),
          body: Stack(
            children: <Widget>[
              AttendanceBody(
                title: AtrakLocalizations.of(context).holidays(2018),
                isTitlePadding: true,
                isBodyPadding: true,
                isCard: true,
                child: ListView(
                  shrinkWrap: true,
                  children: holidayWidgetList,
                ),
              ),
              holidayState.isLoading ? LoadingSpinner() : Container()
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

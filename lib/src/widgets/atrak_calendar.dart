import 'package:atrak/src/repository/data/entities/my_attendance_entity.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:date_utils/date_utils.dart';
import 'package:atrak/src/utils/url_paths.dart';
import 'package:atrak/src/utils/theme.dart';
import 'dart:math' as math;

class AtrakCalendar extends StatefulWidget {
  final String locale;
  final List<Text> weekDayNames =
      Utils.weekdays.map((day) => Text(day.substring(0, 1))).toList();
  final List<MyAttendanceEntity> attendaceList;
  final double padding = 20.0;

  final Color activeColor;
  final Color inActiveColor;

  final Function(int) scrollTo;

  AtrakCalendar(
      {this.locale = "en",
      this.activeColor,
      this.inActiveColor,
      this.attendaceList,
      this.scrollTo});

  @override
  _AtrakCalendarState createState() => _AtrakCalendarState();
}

class _AtrakCalendarState extends State<AtrakCalendar> {
  Color activeColor, inActiveColor;

  PageController _controller;
  List<DateTime> _months = List(3);
  List<List<DateTime>> _daysInMonths = List(3);

  DateTime _today;

  // DateFormat _localeDate;

  @override
  void initState() {
    super.initState();
    DateTime currentDate = DateTime.now();
    _today = DateTime(currentDate.year, currentDate.month, currentDate.day);

    activeColor = widget.activeColor ?? AtrakTheme.darkGreyColor;
    inActiveColor = widget.inActiveColor ?? Colors.white;

    _months[0] = DateTime(_today.year, _today.month - 2, 1);
    _months[1] = DateTime(_today.year, _today.month - 1, 1);
    _months[2] = DateTime(_today.year, _today.month, 1);

    _daysInMonths[0] = Utils.daysInRange(
            _months[0].subtract(Duration(days: _months[0].weekday)),
            _months[0].add(Duration(days: 42 - _months[0].weekday)))
        .toList();
    _daysInMonths[1] = Utils.daysInRange(
            _months[1].subtract(Duration(days: _months[1].weekday)),
            _months[1].add(Duration(days: 42 - _months[1].weekday)))
        .toList();
    _daysInMonths[2] = Utils.daysInRange(
            _months[2].subtract(Duration(days: _months[2].weekday)),
            _months[2].add(Duration(days: 42 - _months[2].weekday)))
        .toList();

    /// setup pageController
    _controller = PageController(
      initialPage: 3,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.zero,
              child: PageView.builder(
                  itemCount: _months.length,
                  onPageChanged: (changedMonthIndex) {},
                  physics: NeverScrollableScrollPhysics(),
                  pageSnapping: true,
                  controller: _controller,
                  itemBuilder: (context, monthIndex) => Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: widget.padding),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Opacity(
                                    opacity: monthIndex == 0 ? 0.0 : 1.0,
                                    child: InkWell(
                                      onTap: monthIndex != 0
                                          ? () => _controller.animateToPage(
                                              monthIndex - 1,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.easeIn)
                                          : null,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          UrlPaths.calendarLeftArrow,
                                          scale: 1.8,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${DateFormat(DateFormat.MONTH).format(_months[monthIndex])} ${DateFormat(DateFormat.YEAR).format(_months[monthIndex])}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .copyWith(fontSize: 30.0),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: monthIndex == _months.length - 1
                                        ? 0.0
                                        : 1.0,
                                    child: InkWell(
                                      onTap: monthIndex != _months.length - 1
                                          ? () => _controller.animateToPage(
                                              monthIndex + 1,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.easeIn)
                                          : null,
                                      child: Transform.rotate(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            UrlPaths.calendarLeftArrow,
                                            scale: 1.8,
                                          ),
                                        ),

                                        /// 1 Degree * PI/180 = 0.0174 Radian
                                        angle: 180 * math.pi / 180,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: widget.padding),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: widget.weekDayNames),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Divider(),
                          GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 7,
                            shrinkWrap: true,
                            childAspectRatio: 1.55,
                            padding: EdgeInsets.zero,
                            children: List.generate(
                                _daysInMonths[monthIndex].length, (dayIndex) {
                              final currentMonth = _daysInMonths[monthIndex]
                                              [dayIndex]
                                          .month ==
                                      _months[monthIndex].month &&
                                  _daysInMonths[monthIndex][dayIndex].year ==
                                      _months[monthIndex].year;

                              final bool isToday = _today ==
                                      _daysInMonths[monthIndex][dayIndex] &&
                                  currentMonth;
                              final Color dayColor =
                                  currentMonth ? activeColor : inActiveColor;

                              final MyAttendanceEntity attendanceEntity =
                                  currentMonth &&
                                          widget.attendaceList.isNotEmpty
                                      ? widget.attendaceList.firstWhere(
                                          (attendance) {
                                          final date = DateTime(
                                              attendance.date.year,
                                              attendance.date.month,
                                              attendance.date.day);
                                          return date.compareTo(
                                                  _daysInMonths[monthIndex]
                                                      [dayIndex]) ==
                                              0;
                                        }, orElse: () => null)
                                      : null;

                              final bool isPresent =
                                  attendanceEntity?.status == "Present";
                              final bool isHoliday =
                                  attendanceEntity?.status == "Holiday";
                              final bool isLeave =
                                  attendanceEntity?.status == "Leave";

                              final Color indicatorColor = isPresent
                                  ? AtrakTheme.textIndicatorColor
                                  : isHoliday
                                      ? Colors.greenAccent
                                      : isLeave ? Colors.red : null;
                              return Container(
                                padding: EdgeInsets.zero,
                                child: InkWell(
                                  onTap: currentMonth
                                      ? () {
                                    print("$attendanceEntity");
                                    int index =  attendanceEntity != null ? widget.attendaceList.indexWhere((attendance){return attendance ==attendanceEntity;},) : -1;

                                    if(index >=0 && widget.scrollTo != null){
                                      widget.scrollTo(index);
                                    }

                                  }
                                      : null,
                                  child: Column(
                                    children: <Widget>[
                                      isToday
                                          ? TodayWidget(_daysInMonths[monthIndex]
                                                  [dayIndex]
                                              .day)
                                          : Container(
                                              child: Text(
                                                "${_daysInMonths[monthIndex][dayIndex].day}",
                                                style:
                                                    TextStyle(color: dayColor),
                                              ),
                                            ),
                                      currentMonth
                                          ? Container(
                                              width: 5,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: indicatorColor,
                                                  shape: BoxShape.circle))
                                          : Container()
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: widget.padding),
                                Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red)),
                                SizedBox(width: 5.0),
                                Text("Leave"),
                                SizedBox(width: 30.0),
                                Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.greenAccent)),
                                SizedBox(width: 5.0),
                                Text("Holiday"),
                                SizedBox(width: 30.0),
                                Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AtrakTheme.textIndicatorColor)),
                                SizedBox(width: 5.0),
                                Text("Present")
                              ],
                            ),
                          ),
                        ],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class TodayWidget extends StatelessWidget {
  final int today;

  TodayWidget(this.today);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            AtrakTheme.gradientStartColor,
            AtrakTheme.gradientEndColor
          ])),
      child: Text("$today", style: TextStyle(color: Colors.white)),
    );
  }
}

/* class MarkerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 10,
            height: 10,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          ),
          SizedBox(
            width: 5.0,
          ),
          Text("Leave"),
          SizedBox(
            width: 30.0,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.greenAccent),
          ),
          SizedBox(
            width: 5.0,
          ),
          Text("Holiday"),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AtrakTheme.textIndicatorColor),
          ),
          SizedBox(
            width: 5.0,
          ),
          Text("Present")
        ],
      ),
    );
  }
} */

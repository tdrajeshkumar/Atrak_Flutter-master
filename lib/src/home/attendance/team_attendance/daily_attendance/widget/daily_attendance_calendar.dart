import 'package:atrak/src/home/attendance/team_attendance/daily_attendance/daily_attendance.dart';
import 'package:atrak/src/home/attendance/team_attendance/daily_attendance/daily_attendance_bloc.dart';
import 'package:atrak/src/home/attendance/team_attendance/daily_attendance/widget/daily_attendance_members_card.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/repository/data/entities/employee_team_daily_attendance_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:date_utils/date_utils.dart';
import 'package:atrak/src/utils/url_paths.dart';
import 'package:atrak/src/utils/theme.dart';
import 'dart:math' as math;

class DailyAttendanceCalendar extends StatefulWidget {
  final String locale;
  final List<Text> weekDayNames =
      Utils.weekdays.map((day) => Text(day.substring(0, 1))).toList();
  final List<TeamDailyAttendanceEntity> attendaceList;
  final double padding = 20.0;

  final Color activeColor;
  final Color inActiveColor;

  final Function scrollTo;

  DailyAttendanceCalendar(
      {this.locale = "en",
      this.activeColor,
      this.inActiveColor,
      this.attendaceList,
      this.scrollTo});

  @override
  _DailyAttendanceCalendarState createState() =>
      _DailyAttendanceCalendarState();
}

class _DailyAttendanceCalendarState extends State<DailyAttendanceCalendar> {
  Color activeColor, inActiveColor;
  TeamDailyAttendanceBloc _bloc;
  PageController _controller;
  List<DateTime> _months = List(3);
  List<List<DateTime>> _daysInMonths = List(3);

  DateTime _today;

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
    _bloc = TeamDailyAttendanceBloc(Injector.of(context).repository);
    _bloc.loadDailyAttendance();
    return BlocBuilder<TeamDailyAttendanceEvent, TeamDailyAttendanceState>(
      bloc: _bloc,
      builder: (context, dailyAttendanceState) {
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

                                final List<TeamDailyAttendanceEntity>
                                    attendanceEntity = currentMonth &&
                                            dailyAttendanceState
                                                .teamDailyAttendance.isNotEmpty
                                        ? dailyAttendanceState
                                            .teamDailyAttendance
                                            .where((attendance) {
                                            final date = DateTime(
                                                attendance.date.year,
                                                attendance.date.month,
                                                attendance.date.day);
                                            return date.compareTo(
                                                    _daysInMonths[monthIndex]
                                                        [dayIndex]) ==
                                                0;
                                          }).toList()
                                        : null;
                                return Container(
                                  padding: EdgeInsets.zero,
                                  child: InkWell(
                                    onTap: currentMonth
                                        ? () {
                                            // print(_daysInMonths[monthIndex]
                                            //     [dayIndex]);
                                            // print('cur month');
                                            _bloc.updateSelectedDate(
                                                attendanceEntity,
                                                _daysInMonths[monthIndex]
                                                    [dayIndex]);
                                            // print('attendance');
                                            // print("${attendanceEntity.length}");
                                          }
                                        : null,
                                    child: Column(
                                      children: <Widget>[
                                        isToday
                                            ? TodayWidget(
                                                _daysInMonths[monthIndex]
                                                        [dayIndex]
                                                    .day)
                                            : Container(
                                                child: Text(
                                                  "${_daysInMonths[monthIndex][dayIndex].day}",
                                                  style: TextStyle(
                                                      color: dayColor),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                            Expanded(
                              child: AttendanceBody(
                                title: AtrakLocalizations.of(context)
                                    .inAndOutTimeSummary,
                                isTitlePadding: true,
                                isBodyPadding: false,
                                child: EmployeeAttendanceMembersListWidget(
                                  // selectedDate:
                                  bloc: _bloc,
                                ),
                              ),
                            ),
                          ],
                        ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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

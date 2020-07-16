import 'package:intl/intl.dart';

class EmployeeOnDutyStatusEntity {
  final String title;
  final String date;
  final String fromToTime;
  final String totalHours;
  final String status;

  EmployeeOnDutyStatusEntity(
      {this.title, this.date, this.fromToTime, this.totalHours, this.status});

  static DateFormat _dateFormat = DateFormat("dd-MMM-yyyy hh:mm aaa");
  static DateFormat _monthDayYearFormat = DateFormat("MMM dd yyyy");
  static DateFormat _timeFormat = DateFormat("hh:mm aaa");

  static EmployeeOnDutyStatusEntity fromJson(Map<String, Object> json) {
    return EmployeeOnDutyStatusEntity(
      title: json["title"] as String,
      date:
          "${_monthDayYearFormat.format(_dateFormat.parse(json['from_date']))}",
      fromToTime:
          "${_timeFormat.format(_dateFormat.parse(json['from_date']))} - ${_timeFormat.format(_dateFormat.parse(json['to_date']))}",
      totalHours: json['total'] as String,
      status: json['status'] as String,
    );
  }

  @override
  String toString() =>
      'UserOnDutyStatusEntity { type: $title, status: $status, fromToDate: $fromToTime, date: $date }, total: $totalHours';
}

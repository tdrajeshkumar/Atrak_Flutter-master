import 'package:intl/intl.dart';

class EmployeeLeavesStatusEntity {
  final String title;
  final String fromToDate;
  final String totalDays;
  final String status;

  EmployeeLeavesStatusEntity(
      {this.title, this.fromToDate, this.totalDays, this.status});

  static DateFormat _dateFormat = DateFormat("dd-MMM-yyyy");
  static DateFormat _monthDayFormat = DateFormat("MMM dd - ");
  static DateFormat _monthDayYearFormat = DateFormat("MMM dd yyyy");

  static EmployeeLeavesStatusEntity fromJson(Map<String, Object> json) {
    return EmployeeLeavesStatusEntity(
      title: json["title"] as String,
      fromToDate:
          "${_monthDayFormat.format(_dateFormat.parse(json['from_date']))}${_monthDayYearFormat.format(_dateFormat.parse(json['to_date']))}",
      //   _dateFormat.parse(json['from_date']),
      // toDate: _dateFormat.parse(json['to_date']),
      totalDays: json['total'] as String,
      status: json['status'] as String,
    );
  }

  @override
  String toString() =>
      'UserLeavesStatusEntity { type: $title, status: $status, fromToDate: $fromToDate }, total: $totalDays';
}

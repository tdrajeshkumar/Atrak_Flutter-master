import 'package:intl/intl.dart';

class EmployeeCompOffStatusEntity {
  final String title;
  final String date;
  final String status;

  EmployeeCompOffStatusEntity({this.title, this.date, this.status});

  static DateFormat _dateFormat = DateFormat("dd-MMM-yyyy");
  static DateFormat _monthDayYearFormat = DateFormat("MMM dd yyyy");

  static EmployeeCompOffStatusEntity fromJson(Map<String, Object> json) {
    return EmployeeCompOffStatusEntity(
      title: json["title"] as String,
      date:
          "${_monthDayYearFormat.format(_dateFormat.parse(json['from_date']))}",
      status: json['status'] as String,
    );
  }

  @override
  String toString() =>
      'UserCompOffStatusEntity { type: $title, status: $status, date: $date }';
}

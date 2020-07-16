import 'package:intl/intl.dart';

class EmployeeTeamAttendanceEntity {
  final int totalDays;
  final int totalPresent;
  final int totalAbsent;
  final DateTime avgLateTime;

  EmployeeTeamAttendanceEntity(
      {this.totalDays, this.totalPresent, this.totalAbsent, this.avgLateTime});

  static DateFormat _dateFormat = DateFormat("dd-MMM-yyyy hh:mm aa");

  static EmployeeTeamAttendanceEntity fromJson(Map<String, Object> json) {
    print(_dateFormat.parse(json["avgLateTime"]));
    return EmployeeTeamAttendanceEntity(
      totalDays: json["totalDays"] as int,
      avgLateTime: _dateFormat.parse(json["avgLateTime"]),
      totalPresent: json['totalPresent'] as int,
      totalAbsent: json['totalAbsent'] as int,
    );
  }

  @override
  String toString() =>
      'UserTeamAttendanceEntity { totalDays: $totalDays, totalPresent: $totalPresent, totalAbsent: $totalAbsent , avgLateTime: $avgLateTime';
}

import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class MyAttendanceEntity {
  final DateTime date;
  final String shift;
  final DateTime inTime;
  final DateTime outTime;
  final int workedHours;
  final String status;
  final bool isWeekOff;

  MyAttendanceEntity(
      {@required this.date,
      @required this.shift,
      @required this.inTime,
      @required this.outTime,
      @required this.workedHours,
      @required this.status,
      @required this.isWeekOff});

static DateFormat _dateTimeFormat = DateFormat("dd-MMM-yyyy hh:mm aaa");

  static MyAttendanceEntity fromJson(Map<String, Object> json) {
    return MyAttendanceEntity(
        date: _dateTimeFormat.parse(json['Date'] as String),
        shift: json['Shift'] != null ? json['Shift'] as String : null,
        inTime: json['InTime'] != null ? _dateTimeFormat.parse(json['InTime'] as String): null,
        outTime: _dateTimeFormat.parse(json['OutTime'] as String),
        workedHours: json['OutTime'] != null ? json['WorkedHrs'] as int : null,
        status: json['Status'] as String,
        isWeekOff: (json['IsWeekOff'] as String) == "True");
  }

  @override
  String toString() =>
      'MyAttendanceEntity { date: $date, shift: $shift, inTime: $inTime, outTime: $outTime, workedOurs: $workedHours, status: $status, isWeekOff: $isWeekOff }';
}

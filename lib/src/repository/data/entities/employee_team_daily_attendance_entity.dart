import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class TeamDailyAttendanceEntity {
  final String name;
  final String img;
  final String designation;
  final DateTime date;
  final DateTime inTime;
  final DateTime outTime;
  final int workedHours;

  TeamDailyAttendanceEntity(
      {@required this.date,
      @required this.name,
      @required this.inTime,
      @required this.outTime,
      @required this.workedHours,
      @required this.img,
      @required this.designation});

  static DateFormat _dateFormat = DateFormat("dd-MMM-yyyy");
  static DateFormat _timeFormat = DateFormat("hh:mm aaa");

  static TeamDailyAttendanceEntity fromJson(Map<String, Object> json) {
    return TeamDailyAttendanceEntity(
        date: _dateFormat.parse(json['date'] as String),
        img: json['img'] as String,
        name: json['name'] as String,
        inTime: json['in_time'] != null
            ? _timeFormat.parse(json['in_time'] as String)
            : null,
        outTime: _timeFormat.parse(json['out_time'] as String),
        workedHours: json['worked_hrs'] as int,
        designation: json['designation'] as String);
  }

  @override
  String toString() =>
      'TeamDailyAttendanceEntity { date: $date, img:$img,name: $name, inTime: $inTime, outTime: $outTime, workedOurs: $workedHours, designation: $designation}';
}

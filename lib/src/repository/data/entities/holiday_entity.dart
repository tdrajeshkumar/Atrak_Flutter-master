import 'package:intl/intl.dart';

class HolidayEntity {
  final String name;
  final DateTime date;

  static DateFormat _dateFormat = DateFormat("dd-MMM-yyyy");

  HolidayEntity({this.name, this.date});

  static getDateObject(String date) {
    return _dateFormat.parse(date);
  }

  static HolidayEntity fromJson(Map<String, Object> json) {
    return HolidayEntity(
      name: json["Name"] as String,
      date: getDateObject(json['Date']),
    );
  }

  Map<String, Object> toJson() {
    return {
      "Name": name,
      "Date": _dateFormat.format(date),
    };
  }

  @override
  String toString() {
    return 'HolidayEntity{name: $name, Date: ${_dateFormat.format(date)}}';
  }
}

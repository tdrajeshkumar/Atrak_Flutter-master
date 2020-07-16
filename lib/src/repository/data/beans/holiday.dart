import 'dart:async';

import 'package:intl/intl.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';

part 'holiday.jorm.dart';

class Holiday {
  Holiday();

  static DateFormat format = new DateFormat("yyyy-MM-d");

  @PrimaryKey(auto: true)
  int id;
  @Column(isNullable: false)
  String name;
  @Column(isNullable: false)
  DateTime date;

  Holiday.make(this.id, this.name, this.date);

  static Holiday fromJson(Map<String, Object> json) {
    return Holiday.make(
        null, json["Name"] as String, getDateObject(json["Date"]));
  }

  static getDateObject(String date) {
    return format.parse(date);
  }

  @override
  String toString() => 'Holiday {name: $name, Date: ${format.format(date)}}';

}

@GenBean()
class HolidayBean extends Bean<Holiday> with _HolidayBean{
  HolidayBean(Adapter adapter): super(adapter);

  final String tableName = "holidays";

}


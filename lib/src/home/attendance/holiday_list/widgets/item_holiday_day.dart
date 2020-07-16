import 'package:atrak/src/repository/data/beans/beans.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
class ItemHolidayDay extends StatelessWidget {

  final Holiday holiday;
   final DateFormat dayFormat = DateFormat("EEE dd");

  ItemHolidayDay({Key key, this.holiday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            holiday.name,
            style:
            TextStyle(color: AtrakTheme.darkGreyColor, fontSize: 18.0),
          ),
          Text(
            dayFormat.format(holiday.date),
            style:
            TextStyle(color: AtrakTheme.darkGreyColor, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

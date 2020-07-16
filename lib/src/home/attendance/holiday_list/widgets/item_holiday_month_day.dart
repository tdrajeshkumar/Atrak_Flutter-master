import 'package:atrak/src/home/attendance/holiday_list/widgets/item_holiday_day.dart';
import 'package:atrak/src/repository/data/beans/beans.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';

class ItemHolidayMonthAndDay extends StatelessWidget {
  final String month;
  final Holiday holiday;

  const ItemHolidayMonthAndDay({Key key, this.month, this.holiday})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            month,
            style: TextStyle(
              color: AtrakTheme.greyColor,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(
            color: AtrakTheme.dividerColor,
          ),
          ItemHolidayDay(
            holiday: holiday,
          )
        ],
      ),
    );
  }
}

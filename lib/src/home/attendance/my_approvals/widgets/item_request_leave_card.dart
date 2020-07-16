import 'package:atrak/src/localization.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/utils/url_paths.dart';
import 'package:flutter/material.dart';

class ItemRequestLeaveCardWidget extends StatelessWidget {
  final EmployeeTeamLeavesEntity leave;

  const ItemRequestLeaveCardWidget({Key key, this.leave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(leave.imgUrl),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${leave.staffName}',
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w600,
                              color: AtrakTheme.darkGreyColor,
                            ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'Staff ID ${leave.staffId}',
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontFamily: 'Work Sans',
                              color: AtrakTheme.greyColor,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: leave.status == "Pending"
                        ? Colors.orange
                        : leave.status == "Approved"
                            ? Colors.green
                            : Colors.red,
                  ),
                  child: Text(leave.status,
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontSize: 12, color: Colors.white),
                      textAlign: TextAlign.right),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FittedBox(
                  child: Text(leave.title,
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 20.0),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      UrlPaths.calendarImage,
                      scale: 1.5,
                      color: AtrakTheme.greyColor,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(leave.fromToDate,
                          style: Theme.of(context).textTheme.subtitle.copyWith(
                              color: AtrakTheme.greyColor,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                      '${AtrakLocalizations.of(context).totalDays} :${leave.totalDays}',
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                          color: AtrakTheme.greyColor,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

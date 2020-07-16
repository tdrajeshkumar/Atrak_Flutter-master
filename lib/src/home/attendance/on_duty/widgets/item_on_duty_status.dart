import 'package:atrak/src/localization.dart';
import 'package:atrak/src/repository/data/entities/employee_on_duty_status_entity.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ItemOnDutyStatus extends StatelessWidget {
  final EmployeeOnDutyStatusEntity userStatus;

  ItemOnDutyStatus({@required this.userStatus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        elevation: 2.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FittedBox(
                    child: Text(userStatus.title,
                        style: Theme.of(context).textTheme.subtitle.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 20.0),
                        textAlign: TextAlign.left),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: userStatus.status == "Pending"
                          ? Colors.orange
                          : userStatus.status == "Approved"
                              ? Colors.green
                              : Colors.red,
                    ),
                    child: Text(userStatus.status,
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontSize: 12, color: Colors.white),
                        textAlign: TextAlign.right),
                  )
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      UrlPaths.calendarImage,
                      scale: 2.5,
                      color: AtrakTheme.greyColor,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    FittedBox(
                        child: Text('${userStatus.date}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(
                                    color: AtrakTheme.greyColor,
                                    fontWeight: FontWeight.w300),
                            textAlign: TextAlign.left))
                  ]),
              SizedBox(
                height: 15.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FittedBox(
                    child: Text(userStatus.fromToTime,
                        style: Theme.of(context).textTheme.subtitle.copyWith(
                            color: AtrakTheme.greyColor,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left),
                  ),
                  FittedBox(
                    child: Text(
                        '${AtrakLocalizations.of(context).totalHours} :${userStatus.totalHours}',
                        style: Theme.of(context).textTheme.subtitle.copyWith(
                            color: AtrakTheme.greyColor,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

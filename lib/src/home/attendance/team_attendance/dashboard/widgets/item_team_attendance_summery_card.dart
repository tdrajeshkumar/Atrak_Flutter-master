import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';

class TeamAttendanceSummeryCard extends StatelessWidget {
  final String leaveType;
  final String bigString;
  final String smallString;

  const TeamAttendanceSummeryCard(
      {Key key, this.leaveType, this.bigString, this.smallString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        child: Card(
          elevation: 2.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 15.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FittedBox(
                  alignment: Alignment.topLeft,
                  fit: BoxFit.fitWidth,
                  child: Text(
                    leaveType,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    alignment: Alignment.bottomLeft,
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: RichText(
                        text: TextSpan(
                          text: bigString.toString().padLeft(2, '0'),
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontSize: 110,
                              color: AtrakTheme.textIndicatorColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: "$smallString",
                              style: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .copyWith(
                                      fontSize: 23.0,
                                      color: AtrakTheme.textIndicatorColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

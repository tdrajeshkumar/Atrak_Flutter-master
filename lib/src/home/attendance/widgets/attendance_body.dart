import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';

class AttendanceBody extends StatelessWidget {
  final String title;
  final double titlePadding = 25.0;
  final double bodyPadding = 25.0;
  final bool isTitlePadding;
  final bool isBodyPadding;
  final bool isCard;
  final Widget child;

  const AttendanceBody(
      {Key key,
      this.isTitlePadding = false,
      this.isBodyPadding = false,
      this.isCard = false,
      this.title,
      @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AtrakTheme.backgroundColor,
      padding:
          isBodyPadding ? EdgeInsets.symmetric(horizontal: bodyPadding) : null,
      child: Column(
        children: <Widget>[
          title == null || title.isEmpty
              ? Container()
              : Container(
                  padding: isBodyPadding
                      ? null
                      : EdgeInsets.symmetric(horizontal: titlePadding),
                  height: 45.0,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline,
                    textAlign: TextAlign.center,
                  ),
                ),
          Expanded(
            child: Container(
                padding: isBodyPadding && isCard
                    ? EdgeInsets.symmetric(horizontal: 15.0)
                    : null,
                decoration: isCard
                    ? BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        color: Colors.white)
                    : null,
                child: child),
          )
        ],
      ),
    );
  }
}

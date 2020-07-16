import 'package:atrak/src/home/home_bloc.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';

class HomeSectionWidget extends StatelessWidget {
  final String imgUrl;
  final String title;
  final bool isWhiteCard;
  final bool isActive;
  final Function page;

  const HomeSectionWidget(
      {Key key,
      this.imgUrl,
      this.title,
      this.isWhiteCard,
      this.isActive = false,
      this.page})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (page != null) page();
      },
      child: Container(
        color: isWhiteCard ? Colors.white : Colors.transparent,
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Image.asset(
                imgUrl,
                color: isActive
                    ? AtrakTheme.textIndicatorColor
                    : AtrakTheme.greyColor,
                height: 40.0,
                width: 40.0,
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                '$title', // AtrakLocalizations.of(context).myAttendance, //"Leave balance"
                style: Theme.of(context).textTheme.title.copyWith(
                    color: AtrakTheme.greyColor, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

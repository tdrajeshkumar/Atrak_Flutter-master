import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/widgets/punch_slider.dart';
import 'package:atrak/src/widgets/spinner_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PunchingDashboard extends StatefulWidget {
  PunchingDashboard({Key key}) : super(key: key);

  @override
  _PunchingDashboardState createState() => _PunchingDashboardState();
}

class _PunchingDashboardState extends State<PunchingDashboard> {
  final double leftPadding = 25.0;
  final double rightPadding = 25.0;

  DateFormat _hourAndMin = DateFormat("hh:mm");
  DateFormat _dateFormat = DateFormat("MMM d, y");

  _PunchingDashboardState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: leftPadding),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FittedBox(
                        child: Text(
                          "Last Checkin",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AtrakTheme.greyColor),
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      SpinnerText(
                          text: '--:--',
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(
                                  fontSize: 33, color: AtrakTheme.greyColor)),
                      SpinnerText(
                          text: '',
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(
                                  fontSize: 18, color: AtrakTheme.greyColor))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20.0),
                    child:
                        Container(color: AtrakTheme.dividerColor, width: 1.0),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Last Checkout",
                        style: Theme.of(context).textTheme.display1.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AtrakTheme.greyColor),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      SpinnerText(
                          text: '--:--',
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(
                                  fontSize: 33, color: AtrakTheme.greyColor)),
                      SpinnerText(
                          text: '',
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(
                                  fontSize: 18, color: AtrakTheme.greyColor))
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 0.0, bottom: 10.0),
                color: Colors.white,
                child: PunchSlider(
                  currentState: CurrentState.checkedOut,
                  stateChanged: (state) {
                    print(state.toString());
                  },
                )),
          )
        ],
      ),
    );
  }
}

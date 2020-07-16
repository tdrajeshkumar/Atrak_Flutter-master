import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Timer extends StatefulWidget {

  final Color timerColor;

  const Timer({Key key, this.timerColor}) : super(key: key);

  @override
  _TimerState createState() => _TimerState(timerColor);
}

class _TimerState extends State<Timer> {
  var timerStream =
      Stream<DateTime>.periodic(Duration(seconds: 1), (_) => DateTime.now());

  final DateFormat _amOrPm = DateFormat("a");
  final DateFormat _hourAndMin = DateFormat("hh:mm");
  final DateFormat _dateFormat = DateFormat("EEEE d, MMM y");

  final Color timerColor;

  _TimerState._(this.timerColor);

  factory _TimerState(Color color){
    final Color timerColor = color ?? Colors.white;
    return _TimerState._(timerColor);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: timerStream,
      builder: (context, _){
        return Container(
          child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: _hourAndMin.format(DateTime.now()),
                    style: Theme.of(context).textTheme.display3.copyWith(
                        fontSize: 50, color: timerColor),
                    children: <TextSpan>[
                      TextSpan(
                        text: " ${_amOrPm.format(DateTime.now())}",
                        style:
                        Theme.of(context).textTheme.display3.copyWith(
                          fontSize: 25.0,
                          color: timerColor,
                        ),
                      )
                    ]),
              ),
              Text(
                _dateFormat.format(DateTime.now()),
                style: Theme.of(context).textTheme.display2.copyWith(
                    fontSize: 20.0,
                    color: timerColor,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

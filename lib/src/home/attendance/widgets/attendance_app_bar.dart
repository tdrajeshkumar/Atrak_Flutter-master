import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';

class AttendanceAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;
  final Function() showDashboard;

  const AttendanceAppBar(this._title, this.showDashboard, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(
        _title, // AtrakLocalizations.of(context).myAttendance, //"Leave balance"
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: AtrakTheme.backArrowColor,
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          showDashboard();
          // widget.attendanceBloc.dispatch(ShowDashboard());
        },
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

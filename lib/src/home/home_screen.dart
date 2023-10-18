// import 'package:atrak/src/home/attendance/attendance_screen.dart';
// import 'package:atrak/src/home/home.dart';
// import 'package:atrak/src/home/home_bloc.dart';
// import 'package:atrak/src/home/home_page/page_home_screen.dart';
// import 'package:atrak/src/widgets/page_transition.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/attendance/attendance_screen.dart';
import 'home/home.dart';
import 'home/home_bloc.dart';
import 'home/home_page/page_home_screen.dart';
import 'widgets/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeEvent, HomeState>(
      bloc: _bloc,
      builder: (context, homeState) {
        List<Widget> _widgets = [];

        if (homeState.showHomeScreen) {
          _widgets.add(PageHomeScreen(_bloc));
        }
        if (homeState.showAttendanceScreen) {
          _widgets.add(AttendanceScreen(_bloc));
        }

        return PageTransition(
          child: Stack(
            children: _widgets,
          ),
        );
      },
    );
  }
}

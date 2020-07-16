import 'package:atrak/src/home/attendance/attendance.dart';
import 'package:atrak/src/home/attendance/my_approvals/leaves/team_leaves_screen.dart';
import 'package:atrak/src/home/attendance/my_approvals/my_approvals.dart';
import 'package:atrak/src/home/attendance/my_approvals/my_approvals_menu/my_approvals_menu.dart';
import 'package:atrak/src/home/attendance/my_approvals/punch_regularization/PunchRegularizationScreen.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_screen.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/widgets/loading_spinner.dart';
import 'package:atrak/src/widgets/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApprovalsScreen extends StatefulWidget {
  final AttendanceBloc attendanceBloc;

  const MyApprovalsScreen(this.attendanceBloc, {Key key}) : super(key: key);

  @override
  _MyApprovalsScreenState createState() => _MyApprovalsScreenState();
}

class _MyApprovalsScreenState extends State<MyApprovalsScreen> {
  MyApprovalsBloc _bloc;

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = MyApprovalsBloc(Injector.of(context).repository);
    // _bloc.getMyApprovals();
    return BlocBuilder<MyApprovalsEvent, MyApprovalsState>(
        bloc: _bloc,
        builder: (context, myApprovalsState) {
          List<Widget> _widgets = [];

          if (myApprovalsState.showMyApprovalsMenu) {
            _widgets.add(MyApprovalsMenuScreen(
                showDashBoard: widget.attendanceBloc.showDashboard,
                myApprovalsBloc: _bloc));
          }

          if (myApprovalsState.showPunchRegularization) {
            _widgets.add(
                PunchRegularizationScreen(_bloc.showMyApprovalsMenuScreen));
          }

          if (myApprovalsState.showLeaves) {
            _widgets.add(TeamLeaves(_bloc.showMyApprovalsMenuScreen));
          }

          if (myApprovalsState.showShiftChange) {
            _widgets.add(TeamShiftChange(_bloc.showMyApprovalsMenuScreen));
          }

          if (myApprovalsState.isLoading) {
            _widgets.add(LoadingSpinner());
          }
          return PageTransition(child: Stack(children: _widgets));

          /*  return Scaffold(
            appBar: AttendanceAppBar(AtrakLocalizations.of(context).myApprovals,
                widget.attendanceBloc.showDashboard),
            body: Stack(
              children: <Widget>[
                AttendanceBody(
                    title: AtrakLocalizations.of(context).approvals,
                    isTitlePadding: true,
                    isBodyPadding: true,
                    isCard: false,
                    child: ListView.builder(
                      itemCount: myApprovalsState.myApprovals.length,
                      itemBuilder: (context, index) {
                        return ItemMyApprovalsCard(
                          myApproval: myApprovalsState.myApprovals[index],
                          bloc: _bloc,
                        );
                      },
                    )),
                myApprovalsState.showPunchRegularization
                    ? PunchRegularization(widget.attendanceBloc.showMyApprovals)
                    : Container(),
                myApprovalsState.isLoading ? LoadingSpinner() : Container()
              ],
            ),
          ); */
        });
  }
}

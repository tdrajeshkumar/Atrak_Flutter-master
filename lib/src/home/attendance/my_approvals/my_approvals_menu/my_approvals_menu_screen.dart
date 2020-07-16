import 'package:atrak/src/home/attendance/my_approvals/my_approvals.dart';
import 'package:atrak/src/home/attendance/my_approvals/my_approvals_menu/my_approvals_menu.dart';
import 'package:atrak/src/home/attendance/my_approvals/my_approvals_menu/widgets/item_my_approvals_card.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_app_bar.dart';
import 'package:atrak/src/home/attendance/widgets/attendance_body.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApprovalsMenuScreen extends StatefulWidget {
  final Function showDashBoard;
  final MyApprovalsBloc myApprovalsBloc;

  MyApprovalsMenuScreen(
      {@required this.showDashBoard, @required this.myApprovalsBloc});

  _MyApprovalsMenuScreenState createState() => _MyApprovalsMenuScreenState();
}

class _MyApprovalsMenuScreenState extends State<MyApprovalsMenuScreen> {
  MyApprovalsMenuBloc _bloc;

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = MyApprovalsMenuBloc(Injector.of(context).repository);
    _bloc.loadMyApprovalsMenu();
    return BlocBuilder<MyApprovalsMenuEvent, MyApprovalsMenuState>(
      bloc: _bloc,
      builder: (context, myApprovalsMenuState) {
        return Stack(
          children: <Widget>[
            Scaffold(
              appBar: AttendanceAppBar(
                  AtrakLocalizations.of(context).myApprovals,
                  widget.showDashBoard),
              body: AttendanceBody(
                title: AtrakLocalizations.of(context).approvals,
                isTitlePadding: true,
                isBodyPadding: true,
                isCard: false,
                child: ListView.builder(
                  itemCount: myApprovalsMenuState.myApprovals.length,
                  itemBuilder: (context, index) {
                    return ItemMyApprovalsCard(
                        myApproval: myApprovalsMenuState.myApprovals[index],
                        bloc: widget.myApprovalsBloc);
                  },
                ),
              ),
            ),
            myApprovalsMenuState.isLoading ? LoadingSpinner() : Container()
          ],
        );
      },
    );
  }
}

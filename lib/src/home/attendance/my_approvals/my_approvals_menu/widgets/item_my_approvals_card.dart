import 'package:atrak/src/home/attendance/my_approvals/my_approvals.dart';
import 'package:atrak/src/repository/data/entities/my_approval_entity.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';

class ItemMyApprovalsCard extends StatelessWidget {
  final MyApprovalEntity myApproval;
  final MyApprovalsBloc bloc;
  ItemMyApprovalsCard({@required this.myApproval, @required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        print(myApproval.title);
        if (myApproval.title == "Punch regularization") {
          print("Punch Regularization");
          if (bloc == null) {
            print("Bloc is empty....");
          } else {
            print("Bloc is not Empty");
            bloc.showPunchRegularizationScreen();
          }
          // bloc.showPunchRegularizationScreen();
          //bloc.showPunchRegularization();
        } else if (myApproval.title == "Leaves") {
          print("Leaves");
          if (bloc == null) {
            print("Bloc is empty....");
          } else {
            print("Bloc is not Empty");
            bloc.showLeavesScreen();
          }
        } else if (myApproval.title == "Shift change") {
          print("Leaves");
          if (bloc == null) {
            print("Bloc is empty....");
          } else {
            print("Bloc is not Empty");
            bloc.showShiftChangeScreen();
          }
        }
      },
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30.0,
                  height: 30.0,
                  padding: EdgeInsets.all(6.0),
                  child: this.myApproval.icon.isNotEmpty
                      ? Image.asset(this.myApproval.icon)
                      : Container(),
                ),
                Expanded(
                  child: Text(
                    '${this.myApproval.title}',
                    style: Theme.of(context).textTheme.body1.copyWith(
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w600,
                          color: AtrakTheme.darkGreyColor,
                        ),
                  ),
                ),
                this.myApproval.count != 0
                    ? CircleAvatar(
                        maxRadius: 12.0,
                        backgroundColor: Color(0xFFF7931E),
                        child: FittedBox(
                          child: Text(
                            this.myApproval.count.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    : Container(),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: AtrakTheme.darkGreyColor,
                )
              ])),
    ));
  }
}

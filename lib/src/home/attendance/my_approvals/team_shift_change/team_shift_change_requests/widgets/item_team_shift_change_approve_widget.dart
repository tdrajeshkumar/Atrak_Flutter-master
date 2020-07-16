import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/team_shift_change_request_bloc.dart';
import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/team_shift_change_requests.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTeamShiftChangeApproveWidget extends StatefulWidget {
  final TeamShiftChangeRequestBloc bloc;
  final Function refresher;

  const ItemTeamShiftChangeApproveWidget({Key key, this.bloc, this.refresher})
      : super(key: key);

  @override
  _ItemTeamShiftChangeApproveWidgetState createState() =>
      _ItemTeamShiftChangeApproveWidgetState();
}

class _ItemTeamShiftChangeApproveWidgetState
    extends State<ItemTeamShiftChangeApproveWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamShiftChangeRequestEvent,
        TeamShiftChangeRequestState>(
      bloc: widget.bloc,
      builder: (context, approvalLeavesState) {
        return approvalLeavesState.selectedRequests.length != 0
            ? Stack(
                alignment: AlignmentDirectional(10.0, 20.0),
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    color: AtrakTheme.textIndicatorColor,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              'Action for selected items(${approvalLeavesState.selectedRequests.length})',
                              style: Theme.of(context).textTheme.body2.copyWith(
                                    fontFamily: 'Work Sans',
                                    color: AtrakTheme.iconColor,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RaisedButton(
                          color: AtrakTheme.greyColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0.0),
                          child: Text(
                            'Cancel',
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontFamily: 'Work Sans',
                                  color: AtrakTheme.iconColor,
                                ),
                          ),
                          onPressed: () {
                            widget.refresher();
                            widget.bloc.cancelSelectedRequests();
                          },
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RaisedButton(
                          color: AtrakTheme.slideBarCheckInColor,
                          child: Text(
                            'Approve',
                            style: Theme.of(context).textTheme.body2.copyWith(
                                  fontFamily: 'Work Sans',
                                  color: AtrakTheme.iconColor,
                                ),
                          ),
                          onPressed: () {
                            widget.refresher();
                            widget.bloc.approveSelectedRequests();
                            _showMessage();
                          },
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Container();
      },
    );
  }

  _showMessage() {
    final snackBar = SnackBar(
      content: Text('Yay! You Approved all requests.!'),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

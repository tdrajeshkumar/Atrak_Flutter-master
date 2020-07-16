import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:meta/meta.dart';

abstract class TeamLeavesEvent {}

class ShowLeavesRequest extends TeamLeavesEvent {}

class ShowLeavesDetails extends TeamLeavesEvent {
  final EmployeeTeamLeavesEntity leave;

  ShowLeavesDetails({@required this.leave});
}

class ShowMessage extends TeamLeavesEvent {
  final String message;

  ShowMessage({@required this.message});
}

import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:meta/meta.dart';

abstract class TeamShiftChangeEvent {}

class ShowShiftChangeRequest extends TeamShiftChangeEvent {}

class ShowShiftChangeDetails extends TeamShiftChangeEvent {
  final EmployeeTeamLeavesEntity leave;

  ShowShiftChangeDetails({@required this.leave});
}

class ShowMessage extends TeamShiftChangeEvent {
  final String message;

  ShowMessage({@required this.message});
}

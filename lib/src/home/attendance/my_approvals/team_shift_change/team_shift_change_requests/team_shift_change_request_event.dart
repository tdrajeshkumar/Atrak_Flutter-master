import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:meta/meta.dart';

abstract class TeamShiftChangeRequestEvent {}

class GetAllRequests extends TeamShiftChangeRequestEvent {}

class AddSelectedRequests extends TeamShiftChangeRequestEvent {
  final EmployeeTeamLeavesEntity leave;

  AddSelectedRequests(this.leave);
}

class RemoveSelectedRequests extends TeamShiftChangeRequestEvent {
  final EmployeeTeamLeavesEntity leave;

  RemoveSelectedRequests(this.leave);
}

class ApproveSelectedRequests extends TeamShiftChangeRequestEvent {}

class CanelSelectedRequests extends TeamShiftChangeRequestEvent {}

class UpdateSelectedRequests extends TeamShiftChangeRequestEvent {
  final EmployeeTeamLeavesEntity leave;

  UpdateSelectedRequests({@required this.leave});
}

import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:meta/meta.dart';

abstract class LeavesRequestEvent {}

class GetAllRequests extends LeavesRequestEvent {}

class AddSelectedRequests extends LeavesRequestEvent {
  final EmployeeTeamLeavesEntity leave;

  AddSelectedRequests(this.leave);
}

class RemoveSelectedRequests extends LeavesRequestEvent {
  final EmployeeTeamLeavesEntity leave;

  RemoveSelectedRequests(this.leave);
}

class ApproveSelectedRequests extends LeavesRequestEvent {}

class CanelSelectedRequests extends LeavesRequestEvent {}

class UpdateSelectedRequests extends LeavesRequestEvent {
  final EmployeeTeamLeavesEntity leave;

  UpdateSelectedRequests({@required this.leave});
}

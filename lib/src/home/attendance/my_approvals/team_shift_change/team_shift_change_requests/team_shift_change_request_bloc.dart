import 'package:atrak/src/home/attendance/my_approvals/team_shift_change/team_shift_change_requests/team_shift_change_requests.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:bloc/bloc.dart';

class TeamShiftChangeRequestBloc
    extends Bloc<TeamShiftChangeRequestEvent, TeamShiftChangeRequestState> {
  final ApiRepository _repository;

  TeamShiftChangeRequestBloc(this._repository);

  void getApprovalLeaves() {
    dispatch(GetAllRequests());
  }

  void addSelectedRequests(EmployeeTeamLeavesEntity leave) {
    dispatch(AddSelectedRequests(leave));
  }

  void removeSelectedRequests(EmployeeTeamLeavesEntity leave) {
    dispatch(RemoveSelectedRequests(leave));
  }

  void approveSelectedRequests() {
    dispatch(ApproveSelectedRequests());
  }

  void cancelSelectedRequests() {
    dispatch(CanelSelectedRequests());
  }

  void updateSelectedRequests(EmployeeTeamLeavesEntity leave) {
    dispatch(UpdateSelectedRequests(leave: leave));
  }

  @override
  TeamShiftChangeRequestState get initialState =>
      TeamShiftChangeRequestState.initial();

  @override
  Stream<TeamShiftChangeRequestState> mapEventToState(
      TeamShiftChangeRequestState state,
      TeamShiftChangeRequestEvent event) async* {
    if (event is GetAllRequests) {
      yield TeamShiftChangeRequestState.loading();
      Map<String, Object> approvalLeaves =
          await _repository.getApprovalLeaves();

      try {
        yield TeamShiftChangeRequestState.approvalLeavesLoaded(
            approvalLeaves['active'], approvalLeaves['past']);
      } catch (error) {
        yield TeamShiftChangeRequestState.showError("error");
      }
    }

    if (event is UpdateSelectedRequests) {
      try {
        List<EmployeeTeamLeavesEntity> selectedList = state.selectedRequests;
        if (selectedList.contains(event.leave)) {
          selectedList.remove(event.leave);
        } else {
          selectedList.add(event.leave);
        }
        yield state.copyWith(selectedRequests: selectedList);
      } catch (error) {
        yield TeamShiftChangeRequestState.showError("error");
      }
    }

    if (event is AddSelectedRequests) {
      List<EmployeeTeamLeavesEntity> selectedList = state.selectedRequests;
      if (!selectedList.contains(event.leave)) {
        selectedList.add(event.leave);
      }
      yield state.copyWith(selectedRequests: selectedList);
    }

    if (event is RemoveSelectedRequests) {
      List<EmployeeTeamLeavesEntity> selectedList = state.selectedRequests;
      if (selectedList.contains(event.leave)) {
        selectedList.remove(event.leave);
      }
      yield state.copyWith(selectedRequests: selectedList);
    }

    if (event is ApproveSelectedRequests) {
      print('approve');
      yield state.copyWith(selectedRequests: []);
    }

    if (event is CanelSelectedRequests) {
      print('cancel');
      yield state.copyWith(selectedRequests: []);
    }
  }
}

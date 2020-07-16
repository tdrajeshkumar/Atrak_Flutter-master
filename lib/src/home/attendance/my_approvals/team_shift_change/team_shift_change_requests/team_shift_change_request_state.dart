import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';

class TeamShiftChangeRequestState {
  final bool isLoading;
  final String error;
  final List<EmployeeTeamLeavesEntity> activeRequests;
  final List<EmployeeTeamLeavesEntity> pastRequests;
  final List<EmployeeTeamLeavesEntity> selectedRequests;

  const TeamShiftChangeRequestState(
      {this.isLoading,
      this.error,
      this.activeRequests,
      this.pastRequests,
      this.selectedRequests});

  factory TeamShiftChangeRequestState.initial() {
    return TeamShiftChangeRequestState(
        isLoading: false,
        error: null,
        activeRequests: [],
        pastRequests: [],
        selectedRequests: []);
  }

  factory TeamShiftChangeRequestState.loading() {
    return TeamShiftChangeRequestState(
        isLoading: true,
        error: null,
        activeRequests: [],
        pastRequests: [],
        selectedRequests: []);
  }

  factory TeamShiftChangeRequestState.showError(String msg) {
    return TeamShiftChangeRequestState(
        isLoading: false,
        error: msg,
        activeRequests: [],
        pastRequests: [],
        selectedRequests: []);
  }

  factory TeamShiftChangeRequestState.approvalLeavesLoaded(
      List<EmployeeTeamLeavesEntity> activeRequests,
      List<EmployeeTeamLeavesEntity> pastRequests) {
    return TeamShiftChangeRequestState(
        isLoading: false,
        error: null,
        activeRequests: activeRequests,
        pastRequests: pastRequests,
        selectedRequests: []);
  }

  TeamShiftChangeRequestState copyWith(
      {bool isLoading,
      String error,
      List<EmployeeTeamLeavesEntity> activeRequests,
      List<EmployeeTeamLeavesEntity> pastRequests,
      List<EmployeeTeamLeavesEntity> selectedRequests}) {
    return TeamShiftChangeRequestState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        activeRequests: activeRequests ?? this.activeRequests,
        selectedRequests: selectedRequests ?? this.selectedRequests,
        pastRequests: pastRequests ?? this.pastRequests);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is TeamShiftChangeRequestState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error &&
          activeRequests == other.activeRequests &&
          selectedRequests == other.selectedRequests &&
          pastRequests == other.pastRequests;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      error.hashCode ^
      pastRequests.hashCode ^
      selectedRequests.hashCode ^
      activeRequests.hashCode;

  @override
  String toString() =>
      'TeamShiftChangeRequestState {isLoading: $isLoading, error: $error, activeRequests: $activeRequests, pastRequests: $pastRequests,selectedRequests$selectedRequests}';
}

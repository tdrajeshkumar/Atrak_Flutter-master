import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';

class LeavesRequestState {
  final bool isLoading;
  final String error;
  final List<EmployeeTeamLeavesEntity> activeRequests;
  final List<EmployeeTeamLeavesEntity> pastRequests;
  final List<EmployeeTeamLeavesEntity> selectedRequests;

  const LeavesRequestState(
      {this.isLoading,
      this.error,
      this.activeRequests,
      this.pastRequests,
      this.selectedRequests});

  factory LeavesRequestState.initial() {
    return LeavesRequestState(
        isLoading: false,
        error: null,
        activeRequests: [],
        pastRequests: [],
        selectedRequests: []);
  }

  factory LeavesRequestState.loading() {
    return LeavesRequestState(
        isLoading: true,
        error: null,
        activeRequests: [],
        pastRequests: [],
        selectedRequests: []);
  }

  factory LeavesRequestState.showError(String msg) {
    return LeavesRequestState(
        isLoading: false,
        error: msg,
        activeRequests: [],
        pastRequests: [],
        selectedRequests: []);
  }

  factory LeavesRequestState.approvalLeavesLoaded(
      List<EmployeeTeamLeavesEntity> activeRequests,
      List<EmployeeTeamLeavesEntity> pastRequests) {
    return LeavesRequestState(
        isLoading: false,
        error: null,
        activeRequests: activeRequests,
        pastRequests: pastRequests,
        selectedRequests: []);
  }

  LeavesRequestState copyWith(
      {bool isLoading,
      String error,
      List<EmployeeTeamLeavesEntity> activeRequests,
      List<EmployeeTeamLeavesEntity> pastRequests,
      List<EmployeeTeamLeavesEntity> selectedRequests}) {
    return LeavesRequestState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        activeRequests: activeRequests ?? this.activeRequests,
        selectedRequests: selectedRequests ?? this.selectedRequests,
        pastRequests: pastRequests ?? this.pastRequests);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is LeavesRequestState &&
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
      'LeavesRequestState {isLoading: $isLoading, error: $error, activeRequests: $activeRequests, pastRequests: $pastRequests,selectedRequests$selectedRequests}';
}

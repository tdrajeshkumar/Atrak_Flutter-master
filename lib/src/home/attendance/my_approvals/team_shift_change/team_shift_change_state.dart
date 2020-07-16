import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';

class TeamShiftChangeState {
  final bool isLoading;
  final bool showShiftChangeRequest;
  final bool showShiftChangeDetails;
  final EmployeeTeamLeavesEntity selectedRequestsDetail;
  final String message;
  final String error;

  const TeamShiftChangeState(
      {this.isLoading,
      this.showShiftChangeRequest,
      this.showShiftChangeDetails,
      this.selectedRequestsDetail,
      this.message,
      this.error});

  factory TeamShiftChangeState.initial() {
    return TeamShiftChangeState(
        isLoading: false,
        showShiftChangeRequest: true,
        showShiftChangeDetails: false,
        selectedRequestsDetail: null,
        message: '',
        error: null);
  }

  factory TeamShiftChangeState.loading() {
    return TeamShiftChangeState.initial().copyWith(isLoading: true);
  }

  factory TeamShiftChangeState.showError(String msg) {
    return TeamShiftChangeState.initial().copyWith(error: msg);
  }

  factory TeamShiftChangeState.showShiftChangeRequestScreen() {
    return TeamShiftChangeState.initial()
        .copyWith(showShiftChangeRequest: true);
  }

  factory TeamShiftChangeState.showStatusMessage(String msg) {
    return TeamShiftChangeState.initial().copyWith(message: msg);
  }

  factory TeamShiftChangeState.showShiftChangeDetailsScreen(
      EmployeeTeamLeavesEntity selectedRequestsDetail) {
    return TeamShiftChangeState.initial().copyWith(
        showShiftChangeRequest: false,
        showShiftChangeDetails: true,
        selectedRequestsDetail: selectedRequestsDetail);
  }

  TeamShiftChangeState copyWith(
      {bool isLoading,
      bool showShiftChangeRequest,
      bool showShiftChangeDetails,
      bool showShiftChange,
      String message,
      EmployeeTeamLeavesEntity selectedRequestsDetail,
      String error}) {
    return TeamShiftChangeState(
        isLoading: isLoading ?? this.isLoading,
        showShiftChangeRequest:
            showShiftChangeRequest ?? this.showShiftChangeRequest,
        showShiftChangeDetails:
            showShiftChangeDetails ?? this.showShiftChangeDetails,
        selectedRequestsDetail:
            selectedRequestsDetail ?? this.selectedRequestsDetail,
        message: message ?? this.message,
        error: error ?? this.error);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is TeamShiftChangeState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          showShiftChangeRequest == other.showShiftChangeRequest &&
          showShiftChangeDetails == other.showShiftChangeDetails &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      showShiftChangeRequest.hashCode ^
      showShiftChangeDetails.hashCode ^
      error.hashCode;

  @override
  String toString() =>
      'TeamShiftChangeState {isLoading: $isLoading, showShiftChangeRequest: $showShiftChangeRequest,showShiftChangeDetails:$showShiftChangeDetails error: $error}';
}

import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';

class TeamLeavesState {
  final bool isLoading;
  final bool showLeavesRequest;
  final bool showLeavesDetails;
  final EmployeeTeamLeavesEntity selectedLeaveDetail;
  final String message;
  final String error;

  const TeamLeavesState(
      {this.isLoading,
      this.showLeavesRequest,
      this.showLeavesDetails,
      this.selectedLeaveDetail,
      this.message,
      this.error});

  factory TeamLeavesState.initial() {
    return TeamLeavesState(
        isLoading: false,
        showLeavesRequest: true,
        showLeavesDetails: false,
        selectedLeaveDetail: null,
        message: '',
        error: null);
  }

  factory TeamLeavesState.loading() {
    return TeamLeavesState.initial().copyWith(isLoading: true);
  }

  factory TeamLeavesState.showError(String msg) {
    return TeamLeavesState.initial().copyWith(error: msg);
  }

  factory TeamLeavesState.showLeavesRequestScreen() {
    return TeamLeavesState.initial().copyWith(showLeavesRequest: true);
  }

  factory TeamLeavesState.showStatusMessage(String msg) {
    return TeamLeavesState.initial().copyWith(message: msg);
  }

  factory TeamLeavesState.showLeavesDetailsScreen(
      EmployeeTeamLeavesEntity selectedLeaveDetail) {
    return TeamLeavesState.initial().copyWith(
        showLeavesRequest: false,
        showLeavesDetails: true,
        selectedLeaveDetail: selectedLeaveDetail);
  }

  TeamLeavesState copyWith(
      {bool isLoading,
      bool showLeavesRequest,
      bool showLeavesDetails,
      bool showLeaves,
      String message,
      EmployeeTeamLeavesEntity selectedLeaveDetail,
      String error}) {
    return TeamLeavesState(
        isLoading: isLoading ?? this.isLoading,
        showLeavesRequest: showLeavesRequest ?? this.showLeavesRequest,
        showLeavesDetails: showLeavesDetails ?? this.showLeavesDetails,
        selectedLeaveDetail: selectedLeaveDetail ?? this.selectedLeaveDetail,
        message: message ?? this.message,
        error: error ?? this.error);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is TeamLeavesState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          showLeavesRequest == other.showLeavesRequest &&
          showLeavesDetails == other.showLeavesDetails &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      showLeavesRequest.hashCode ^
      showLeavesDetails.hashCode ^
      error.hashCode;

  @override
  String toString() =>
      'ApprovalLeavesState {isLoading: $isLoading, showLeavesRequest: $showLeavesRequest,showLeavesDetails:$showLeavesDetails error: $error}';
}

import 'package:atrak/src/repository/data/entities/employee_shift_change_request_status_entity.dart';

class ShiftChangeState {
  final bool isLoading;
  final String error;
  final List<EmployeeShiftChangeRequestStatusEntity> requestStatus;

  const ShiftChangeState({this.isLoading, this.error, this.requestStatus});

  factory ShiftChangeState.initial() {
    return ShiftChangeState(isLoading: false, error: null, requestStatus: []);
  }

  factory ShiftChangeState.loading() {
    return ShiftChangeState(isLoading: true, error: null, requestStatus: []);
  }

  factory ShiftChangeState.showError(String msg) {
    return ShiftChangeState(isLoading: false, error: msg, requestStatus: []);
  }

  factory ShiftChangeState.requestStatusLoaded(
      List<EmployeeShiftChangeRequestStatusEntity> requestStatus) {
    return ShiftChangeState(
        isLoading: false, error: null, requestStatus: requestStatus);
  }

  ShiftChangeState copyWith(
      {bool isLoading,
      String error,
      List<EmployeeShiftChangeRequestStatusEntity> leavesStatus}) {
    return ShiftChangeState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        requestStatus: requestStatus ?? this.requestStatus);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is ShiftChangeState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      'ShiftChangeState {isLoading: $isLoading, error: $error}';
}

import 'package:atrak/src/repository/data/entities/employee_leaves_status_entity.dart';

class LeavesState {
  final bool isLoading;
  final String error;
  final List<EmployeeLeavesStatusEntity> leavesStatus;

  const LeavesState({this.isLoading, this.error, this.leavesStatus});

  factory LeavesState.initial() {
    return LeavesState(isLoading: false, error: null, leavesStatus: []);
  }

  factory LeavesState.loading() {
    return LeavesState(isLoading: true, error: null, leavesStatus: []);
  }

  factory LeavesState.showError(String msg) {
    return LeavesState(isLoading: false, error: msg, leavesStatus: []);
  }

  factory LeavesState.leavesStatusLoaded(
      List<EmployeeLeavesStatusEntity> leavesStatus) {
    return LeavesState(
        isLoading: false, error: null, leavesStatus: leavesStatus);
  }

  LeavesState copyWith(
      {bool isLoading,
      String error,
      List<EmployeeLeavesStatusEntity> leavesStatus}) {
    return LeavesState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        leavesStatus: leavesStatus ?? this.leavesStatus);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is LeavesState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;

  @override
  String toString() => 'LeavesState {isLoading: $isLoading, error: $error}';
}

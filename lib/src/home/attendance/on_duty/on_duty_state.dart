import 'package:atrak/src/repository/data/entities/employee_on_duty_status_entity.dart';

class OnDutyState {
  final bool isLoading;
  final String error;
  final List<EmployeeOnDutyStatusEntity> onDutyStatus;

  const OnDutyState({this.isLoading, this.error, this.onDutyStatus});

  factory OnDutyState.initial() {
    return OnDutyState(isLoading: false, error: null, onDutyStatus: []);
  }

  factory OnDutyState.loading() {
    return OnDutyState(isLoading: true, error: null, onDutyStatus: []);
  }

  factory OnDutyState.showError(String msg) {
    return OnDutyState(isLoading: false, error: msg, onDutyStatus: []);
  }

  factory OnDutyState.onDutyStatusLoaded(
      List<EmployeeOnDutyStatusEntity> onDutyStatus) {
    return OnDutyState(
        isLoading: false, error: null, onDutyStatus: onDutyStatus);
  }

  OnDutyState copyWith(
      {bool isLoading,
      String error,
      List<EmployeeOnDutyStatusEntity> onDutyStatus}) {
    return OnDutyState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        onDutyStatus: onDutyStatus ?? this.onDutyStatus);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is OnDutyState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;

  @override
  String toString() => 'OnDutyState {isLoading: $isLoading, error: $error}';
}

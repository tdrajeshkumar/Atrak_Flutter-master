import 'package:atrak/src/repository/data/entities/employee_comp_off_status_entity.dart';

class CompOffState {
  final bool isLoading;
  final String error;
  final List<EmployeeCompOffStatusEntity> compOffStatus;

  const CompOffState({this.isLoading, this.error, this.compOffStatus});

  factory CompOffState.initial() {
    return CompOffState(isLoading: false, error: null, compOffStatus: []);
  }

  factory CompOffState.loading() {
    return CompOffState(isLoading: true, error: null, compOffStatus: []);
  }

  factory CompOffState.showError(String msg) {
    return CompOffState(isLoading: false, error: msg, compOffStatus: []);
  }

  factory CompOffState.compOffStatusLoaded(
      List<EmployeeCompOffStatusEntity> compOffStatus) {
    return CompOffState(
        isLoading: false, error: null, compOffStatus: compOffStatus);
  }

  CompOffState copyWith(
      {bool isLoading,
      String error,
      List<EmployeeCompOffStatusEntity> compOffStatus}) {
    return CompOffState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        compOffStatus: compOffStatus ?? this.compOffStatus);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is CompOffState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          compOffStatus == other.compOffStatus &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      'CompOffState {isLoading: $isLoading, error: $error,compOffStatus:$compOffStatus}';
}

import 'package:atrak/src/repository/data/entities/employee_permission_status_entity.dart';

class PermissionState {
  final bool isLoading;
  final String error;
  final List<EmployeePermissionStatusEntity> permissionStatus;

  const PermissionState({this.isLoading, this.error, this.permissionStatus});

  factory PermissionState.initial() {
    return PermissionState(isLoading: false, error: null, permissionStatus: []);
  }

  factory PermissionState.loading() {
    return PermissionState(isLoading: true, error: null, permissionStatus: []);
  }

  factory PermissionState.showError(String msg) {
    return PermissionState(isLoading: false, error: msg, permissionStatus: []);
  }

  factory PermissionState.permissionStatusLoaded(
      List<EmployeePermissionStatusEntity> permissionStatus) {
    return PermissionState(
        isLoading: false, error: null, permissionStatus: permissionStatus);
  }

  PermissionState copyWith(
      {bool isLoading,
      String error,
      List<EmployeePermissionStatusEntity> permissionStatus}) {
    return PermissionState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        permissionStatus: permissionStatus ?? this.permissionStatus);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is PermissionState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;

  @override
  String toString() => 'PermissionState {isLoading: $isLoading, error: $error}';
}

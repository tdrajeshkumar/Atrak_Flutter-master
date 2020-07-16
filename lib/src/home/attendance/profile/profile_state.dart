import 'package:atrak/src/repository/data/entities/employee_profile_entity.dart';

class ProfileState {
  final bool isLoading;
  final String error;
  final EmployeeProfileEntity user;

  ProfileState({this.isLoading, this.error, this.user});

  factory ProfileState.initial() {
    return ProfileState(isLoading: false, error: null, user: null);
  }

  factory ProfileState.loading() {
    return ProfileState(isLoading: true, error: null, user: null);
  }

  factory ProfileState.showError(String msg) {
    return ProfileState(isLoading: false, error: msg, user: null);
  }

  factory ProfileState.userLoaded(EmployeeProfileEntity user) {
    return ProfileState(isLoading: false, error: null, user: user);
  }

  ProfileState copyWith(
      {bool isLoading, String error, EmployeeProfileEntity user}) {
    return ProfileState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        user: user ?? this.user);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is ProfileState &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          isLoading == other.isLoading &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      'ProfileState {isLoading: $isLoading, error: $error,user:$user}';
}

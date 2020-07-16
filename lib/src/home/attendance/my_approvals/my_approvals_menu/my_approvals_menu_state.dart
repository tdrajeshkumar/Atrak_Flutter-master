import 'package:atrak/src/repository/data/entities/my_approval_entity.dart';

class MyApprovalsMenuState {
  final bool isLoading;
  final String error;
  final List<MyApprovalEntity> myApprovals;

  const MyApprovalsMenuState({this.isLoading, this.error, this.myApprovals});

  factory MyApprovalsMenuState.initial() {
    return MyApprovalsMenuState(isLoading: false, error: null, myApprovals: []);
  }

  factory MyApprovalsMenuState.onMyApprovalsMenuLoaded(
      List<MyApprovalEntity> myApprovals) {
    return MyApprovalsMenuState.initial().copyWith(myApprovals: myApprovals);
  }

  factory MyApprovalsMenuState.loading() {
    return MyApprovalsMenuState.initial().copyWith(isLoading: true);
  }

  MyApprovalsMenuState copyWith({bool isLoading, String error, List<MyApprovalEntity> myApprovals}) {
    return MyApprovalsMenuState(
        isLoading: isLoading ?? this.isLoading, error: error ?? this.error, myApprovals: myApprovals ?? this.myApprovals);
  }



  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is MyApprovalsMenuState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      'MyApprovalsMenuState {isLoading: $isLoading, error: $error}';
}

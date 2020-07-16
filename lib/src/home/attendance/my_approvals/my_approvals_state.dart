import 'package:atrak/src/repository/data/entities/my_approval_entity.dart';

class MyApprovalsState {
  final bool isLoading;
  final bool showMyApprovalsMenu;
  final bool showPunchRegularization;
  final bool showLeaves;
  final bool showShiftChange;
  final String error;

  const MyApprovalsState(
      {this.isLoading,
      this.showMyApprovalsMenu,
      this.showLeaves,
      this.showPunchRegularization,
      this.showShiftChange,
      this.error});

  factory MyApprovalsState.initial() {
    return MyApprovalsState(
        isLoading: false,
        showMyApprovalsMenu: true,
        showPunchRegularization: false,
        showLeaves: false,
        showShiftChange: false,
        error: null);
  }

  factory MyApprovalsState.loading() {
    return MyApprovalsState.initial().copyWith(isLoading: true);
  }

  factory MyApprovalsState.showError(String msg) {
    return MyApprovalsState.initial().copyWith(error: msg);
  }

  factory MyApprovalsState.showpunchRegularizationScreen() {
    return MyApprovalsState.initial().copyWith(punchRegulariztion: true);
  }

  factory MyApprovalsState.showLeavesScreen() {
    return MyApprovalsState.initial().copyWith(showLeaves: true);
  }

  factory MyApprovalsState.showShiftChangeScreen() {
    return MyApprovalsState.initial().copyWith(
      showShiftChange: true,
    );
  }

  MyApprovalsState copyWith(
      {bool isLoading,
      bool showMyApprovalsMenu,
      bool punchRegulariztion,
      bool showLeaves,
      bool showShiftChange,
      String error,
      List<MyApprovalEntity> myApprovals}) {
    return MyApprovalsState(
        isLoading: isLoading ?? this.isLoading,
        showMyApprovalsMenu: showMyApprovalsMenu ?? this.showMyApprovalsMenu,
        showPunchRegularization:
            punchRegulariztion ?? this.showPunchRegularization,
        showLeaves: showLeaves ?? this.showLeaves,
        showShiftChange: showShiftChange ?? this.showShiftChange,
        error: error ?? this.error);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is MyApprovalsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          showPunchRegularization == other.showPunchRegularization &&
          showLeaves == other.showLeaves &&
          showShiftChange == other.showShiftChange &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      showPunchRegularization.hashCode ^
      showLeaves.hashCode ^
      error.hashCode;

  @override
  String toString() =>
      'MyApprovalsState {isLoading: $isLoading, regularization: $showPunchRegularization,leaves:$showLeaves error: $error}';
}

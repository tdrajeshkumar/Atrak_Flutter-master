import 'package:atrak/src/home/attendance/my_approvals/my_approvals.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:bloc/bloc.dart';

class MyApprovalsBloc extends Bloc<MyApprovalsEvent, MyApprovalsState> {
  final ApiRepository _repository;

  MyApprovalsBloc(this._repository);

  void showMyApprovalsMenuScreen() {
    dispatch(ShowMyApprovalsMenuScreenEvent());
  }

  void showShiftChangeScreen() {
    dispatch(ShowShiftChangeScreenEvent());
  }

  void showPunchRegularizationScreen() {
    dispatch(ShowPunchRegularizationScreenEvent());
  }

  void showLeavesScreen() {
    dispatch(ShowLeavesScreenEvent());
  }

  @override
  MyApprovalsState get initialState => MyApprovalsState.initial();

  @override
  Stream<MyApprovalsState> mapEventToState(
      MyApprovalsState state, MyApprovalsEvent event) async* {
    if (event is ShowMyApprovalsMenuScreenEvent) {
      yield MyApprovalsState.initial();
    }

    if (event is ShowPunchRegularizationScreenEvent) {
      yield MyApprovalsState.showpunchRegularizationScreen();
    }

    if (event is ShowLeavesScreenEvent) {
      yield MyApprovalsState.showLeavesScreen();
    }

    if (event is ShowShiftChangeScreenEvent) {
      yield MyApprovalsState.showShiftChangeScreen();
    }
  }
}

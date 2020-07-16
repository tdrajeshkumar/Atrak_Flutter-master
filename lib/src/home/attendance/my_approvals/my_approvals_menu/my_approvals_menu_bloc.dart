import 'package:atrak/src/home/attendance/my_approvals/my_approvals_menu/my_approvals_menu.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/my_approval_entity.dart';
import 'package:bloc/bloc.dart';

class MyApprovalsMenuBloc
    extends Bloc<MyApprovalsMenuEvent, MyApprovalsMenuState> {
  final ApiRepository _repository;

  MyApprovalsMenuBloc(this._repository);

  void loadMyApprovalsMenu() {
    dispatch(LoadMyApprovalsMenusEvent());
  }

  @override
  MyApprovalsMenuState get initialState => MyApprovalsMenuState.initial();

  @override
  Stream<MyApprovalsMenuState> mapEventToState(
      MyApprovalsMenuState currentState, MyApprovalsMenuEvent event) async* {
    if (event is LoadMyApprovalsMenusEvent) {
      yield MyApprovalsMenuState.loading();
      try {
        final List<MyApprovalEntity> myApprovals =
            await _repository.getMyApprovals();
        yield MyApprovalsMenuState.onMyApprovalsMenuLoaded(myApprovals);
      } catch (error) {
        yield currentState.copyWith(isLoading: false, error: "message");
      }
    }
  }
}

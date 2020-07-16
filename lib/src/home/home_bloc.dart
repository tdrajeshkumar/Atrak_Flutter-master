import 'package:atrak/src/home/home.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  void showHome() {
    dispatch(ShowHome());
  }

  void showAttendance() {
    dispatch(ShowAttendance());
  }

  @override
  get initialState => HomeState.initial();

  @override
  Stream<HomeState> mapEventToState(HomeState state, HomeEvent event) async* {
    if (event is ShowHome) {
      yield HomeState.homeScreen();
    }

    if (event is ShowAttendance) {
      yield HomeState.attendanceScreen();
    }
  }
}

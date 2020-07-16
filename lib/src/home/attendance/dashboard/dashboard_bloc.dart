import 'package:atrak/src/home/attendance/dashboard/dashboard.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/beans/beans.dart';
import 'package:bloc/bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ApiRepository repository;

  void getEmployeeDetails() {
    dispatch(FetchEmployee());
  }

  DashboardBloc({this.repository});

  @override
  get initialState => DashboardState.initial();

  @override
  Stream<DashboardState> mapEventToState(
      DashboardState state, DashboardEvent event) async* {
    if (event is FetchEmployee) {
      final Employee employee = await repository.fetchEmployeeDetails();
      yield state.copyWith(employee: employee);
    }

    if (event is CheckIn) {
      yield state.copyWith(isCheckedIn: true);
    }

    if (event is CheckOut) {
      yield state.copyWith(isCheckedIn: false);
    }
  }
}

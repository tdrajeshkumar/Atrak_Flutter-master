import 'package:atrak/src/home/attendance/holiday_list/holiday_list.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:bloc/bloc.dart';

class HolidayListBloc extends Bloc<HolidayListEvent, HolidayListState> {
  final ApiRepository _repository;

  HolidayListBloc(this._repository);

  void getHolidayList() {
    dispatch(GetHolidayList());
  }

  @override
  HolidayListState get initialState => HolidayListState.initial();

  @override
  Stream<HolidayListState> mapEventToState(
      HolidayListState state, HolidayListEvent event) async* {
    if (event is GetHolidayList) {
      yield HolidayListState.loading();

      try {
        var list = await _repository.getHolidayList();

        yield state.copyWith(isLoading: false, holidayList: list);
      } catch (error) {
        print(error);
        print("Error occurred.");
        yield state.copyWith(isLoading: false, error: "Error");
      }
    }
  }
}

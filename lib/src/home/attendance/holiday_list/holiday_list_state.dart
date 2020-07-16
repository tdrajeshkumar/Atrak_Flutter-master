
import 'package:atrak/src/repository/data/beans/beans.dart';

class HolidayListState {
  final bool isLoading;
  final String error;
  final List<Holiday> holidayList;

  const HolidayListState({this.isLoading, this.error, this.holidayList});

  factory HolidayListState.initial() {
    return HolidayListState(isLoading: false, error: null, holidayList: null);
  }

  factory HolidayListState.loading() {
    return HolidayListState(isLoading: true, error: null, holidayList: null);
  }

  factory HolidayListState.loadHolidayList(List<Holiday> holidayList) {
    return HolidayListState(
        isLoading: false, error: null, holidayList: holidayList);
  }

  factory HolidayListState.showError(String msg) {
    return HolidayListState(isLoading: false, error: msg, holidayList: null);
  }

  HolidayListState copyWith(
      {bool isLoading, String error, List<Holiday> holidayList}) {
    return HolidayListState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        holidayList: holidayList ?? this.holidayList);
  }

  @override
  String toString() =>
      'HolidayListState { isLoading: $isLoading, error: $error, holidayList: ${holidayList.toString()} }';
}

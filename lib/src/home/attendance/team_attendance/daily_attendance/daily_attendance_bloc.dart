import 'package:atrak/src/home/attendance/team_attendance/daily_attendance/daily_attendance.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_team_daily_attendance_entity.dart';
import 'package:bloc/bloc.dart';

class TeamDailyAttendanceBloc
    extends Bloc<TeamDailyAttendanceEvent, TeamDailyAttendanceState> {
  final ApiRepository _repository;

  TeamDailyAttendanceBloc(this._repository);

  @override
  TeamDailyAttendanceState get initialState =>
      TeamDailyAttendanceState.initial();

  void loadDailyAttendance() {
    dispatch(LoadTeamDailyAttendanceEvent());
  }

  void updateSelectedDate(
      List<TeamDailyAttendanceEntity> selectedDateList, DateTime selectedDate) {
    dispatch(UpdateSelectedDate(
        selectedDateList: selectedDateList, selectedDate: selectedDate));
  }

  @override
  Stream<TeamDailyAttendanceState> mapEventToState(
      TeamDailyAttendanceState currentState,
      TeamDailyAttendanceEvent event) async* {
    if (event is LoadTeamDailyAttendanceEvent) {
      yield TeamDailyAttendanceState.loading();
      try {
        final List<TeamDailyAttendanceEntity> attendaceList =
            await _repository.getTeamDailyAttendance();
        print("MyAttendance Loaded...");
        yield TeamDailyAttendanceState.teamDailyAttendanceLoaded(attendaceList);
      } catch (error) {
        yield TeamDailyAttendanceState.initial();
        print("Error Occurred.");
        print(error);
      }
    }

    if (event is UpdateSelectedDate) {
      yield currentState.copyWith(
          selectedDateList: event.selectedDateList,
          selectedDate: event.selectedDate);
    }
  }
}

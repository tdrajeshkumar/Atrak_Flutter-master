import 'package:atrak/src/home/attendance/my_attendance/my_attendance.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/my_attendance_entity.dart';
import 'package:bloc/bloc.dart';

class MyAttendanceBloc extends Bloc<MyAttendanceEvent, MyAttendanceState> {
  final ApiRepository _repository;

  MyAttendanceBloc(this._repository);

  @override
  MyAttendanceState get initialState => MyAttendanceState.initial();

  void loadMyAttendance() {
    dispatch(LoadMyAttendanceEvent());
  }

  @override
  Stream<MyAttendanceState> mapEventToState(
      MyAttendanceState currentState, MyAttendanceEvent event) async* {
    if (event is LoadMyAttendanceEvent) {
      yield MyAttendanceState.loading();
      try {
        final List<MyAttendanceEntity> attendaceList =
            await _repository.getMyAttendance();
        print("MyAttendance Loaded...");
        yield MyAttendanceState.loadAttendance(attendaceList);
      } catch (error) {
        yield MyAttendanceState.initial();
        print("Error Occurred.");
        print(error);
      }
    }
  }
}

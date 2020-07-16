
import 'package:atrak/src/repository/data/entities/my_attendance_entity.dart';

class MyAttendanceState {
  final bool isLoading;
  final List<MyAttendanceEntity> attendaceList;

  const MyAttendanceState({this.isLoading, this.attendaceList});

  factory MyAttendanceState.initial() =>
      MyAttendanceState(isLoading: false, attendaceList: []);

  factory MyAttendanceState.loading() =>
      MyAttendanceState.initial().copyWith(isLoading: true);

  factory MyAttendanceState.loadAttendance(
          List<MyAttendanceEntity> attendanceList) =>
      MyAttendanceState.initial().copyWith(attendanceList: attendanceList);

  MyAttendanceState copyWith(
          {bool isLoading, List<MyAttendanceEntity> attendanceList}) =>
      MyAttendanceState(
          isLoading: isLoading ?? this.isLoading,
          attendaceList: attendanceList ?? this.attendaceList);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyAttendanceState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          attendaceList == other.attendaceList;

@override
int get hasCode => runtimeType.hashCode ^ isLoading.hashCode ^ attendaceList.hashCode;

@override
String toString() => 'MyAttendanceState{isLoading: $isLoading, attendanceList: ${attendaceList.toString()}}';

}

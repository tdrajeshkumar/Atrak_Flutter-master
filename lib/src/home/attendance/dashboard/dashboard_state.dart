
import 'package:atrak/src/repository/data/beans/beans.dart';

class DashboardState {
  final bool isCheckedIn;
  final Employee employee;

  const DashboardState({this.isCheckedIn, this.employee});

  factory DashboardState.initial() {
    return DashboardState(
      isCheckedIn: false,
      employee: null,
    );
  }

  DashboardState copyWith({bool isCheckedIn, Employee employee}) {
    return DashboardState(
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
      employee: employee ?? this.employee,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardState &&
          runtimeType == other.runtimeType &&
          isCheckedIn == other.isCheckedIn &&
          employee == other.employee;

  @override
  int get hashCode => isCheckedIn.hashCode ^ employee.hashCode;

  @override
  String toString() => 'DashboardState { isCheckedIn: $isCheckedIn }';
}

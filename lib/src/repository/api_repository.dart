import 'package:atrak/src/repository/data/beans/beans.dart';
import 'package:atrak/src/repository/data/entities/employee_comp_off_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_on_duty_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_permission_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_profile_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_shift_change_request_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_team_attendance_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_team_daily_attendance_entity.dart';
import 'package:atrak/src/repository/data/entities/entities.dart';
import 'package:atrak/src/repository/data/entities/employee_leaves_status_entity.dart';
import 'package:atrak/src/repository/data/entities/my_approval_entity.dart';
import 'package:atrak/src/repository/data/entities/my_attendance_entity.dart';

abstract class ApiRepository {
  Future<UserEntity> get user;

  Future<void> updateUser(UserEntity entity);

  Future<Token> getToken(String username, String password);

  Future<bool> saveToken(Token token);

  Future<Employee> getEmployeeDetails(Token token);

  Future<bool> saveEmployee(Employee employee);

  Future<Employee> fetchEmployeeDetails();

  Future<Token> fetchToken();

  Future<bool> hasToken();

  Future<void> deleteToken();

  Future<void> deleteEmployee();

  Future<List<MyAttendanceEntity>> getMyAttendance();

  Future<List<Holiday>> getHolidayList();

  Future<List<EmployeeLeavesStatusEntity>> getUserLeavesStatus();

  Future<List<EmployeeShiftChangeRequestStatusEntity>>
      getUserShiftChangeRequest();

  Future<List<EmployeePermissionStatusEntity>> getEmployeePermissionStatus();

  Future<List<EmployeeOnDutyStatusEntity>> getEmployeeOnDutyStatus();

  Future<List<EmployeeCompOffStatusEntity>> getEmployeeCompOffStatus();

  Future<List<MyApprovalEntity>> getMyApprovals();

  Future<Map<String, Object>> getApprovalLeaves();

  Future<EmployeeTeamAttendanceEntity> getTeamAttendance();

  Future<EmployeeProfileEntity> getUserProfile();

  Future<List<TeamDailyAttendanceEntity>> getTeamDailyAttendance();

  void close();
}

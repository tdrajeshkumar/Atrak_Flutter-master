import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/beans/employee.dart';
import 'package:atrak/src/repository/data/beans/holiday.dart';
import 'package:atrak/src/repository/data/beans/token.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_comp_off_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_on_duty_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_permission_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_profile_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_shift_change_request_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_team_attendance_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_team_daily_attendance_entity.dart';
import 'package:atrak/src/repository/data/entities/my_approval_entity.dart';
import 'package:atrak/src/repository/data/entities/my_attendance_entity.dart';
import 'package:atrak/src/repository/data/entities/user_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_leaves_status_entity.dart';
import 'package:atrak/src/repository/db_storage.dart';
import 'package:atrak/src/repository/web_client.dart';
import 'package:meta/meta.dart';

class ProdDataRepository implements ApiRepository {
  final WebClient _webClient;
  final DbStorage _dbStorage;

  const ProdDataRepository(
      {@required WebClient webClient, @required DbStorage dbStorage})
      : _webClient = webClient,
        _dbStorage = dbStorage;

  @override
  void close() {
    _dbStorage.close();
  }

  @override
  Future<void> deleteEmployee() {
    return _dbStorage.deleteEmployee();
  }

  @override
  Future<void> deleteToken() async {
    await _dbStorage.deleteToken();
  }

  @override
  Future<Employee> fetchEmployeeDetails() async {
    return _dbStorage.fetchEmployeeDetails();
  }

  @override
  Future<Token> fetchToken() {
    return _dbStorage.getToken();
  }

  @override
  Future<Employee> getEmployeeDetails(Token token) async {
    Employee emp = await _webClient.getEmployeeDetails(token);
    print(emp.toString());
    return emp;
  }

  @override
  Future<List<Holiday>> getHolidayList() async {
    List<Holiday> holidays = await _dbStorage.getHolidayList();

    if (holidays.isEmpty) {
      holidays =
          await _webClient.getHolidayList(location: "Chennai", year: "2018");
      if (holidays.length > 0) {
        print("Need to save the holidays into DB");
      }
    }
    return holidays;
  }

  @override
  Future<Token> getToken(String username, String password) =>
      _webClient.getToken(username, password);

  @override
  Future<bool> hasToken() async {
    return (await _dbStorage.getToken()) != null;
  }

  @override
  Future<bool> saveEmployee(Employee employee) async {
    return _dbStorage.saveEmployee(employee);
  }

  @override
  Future<bool> saveToken(Token token) {
    return _dbStorage.saveToken(token);
  }

  @override
  Future<void> updateUser(UserEntity entity) async {
    // keyValueStorage.saveUser(entity);
  }

  @override
  Future<UserEntity> get user => Future.value(UserEntity());

  @override
  Future<List<EmployeeLeavesStatusEntity>> getUserLeavesStatus() async {
    List<EmployeeLeavesStatusEntity> leavesStatus =
        await _webClient.getEmployeeLeavesStatus();
    return leavesStatus;
  }

  @override
  Future<List<EmployeeShiftChangeRequestStatusEntity>>
      getUserShiftChangeRequest() async {
    List<EmployeeShiftChangeRequestStatusEntity> requestStatus =
        await _webClient.getEmployeeShiftChangeRequest();
    return requestStatus;
  }

  @override
  Future<List<EmployeePermissionStatusEntity>>
      getEmployeePermissionStatus() async {
    List<EmployeePermissionStatusEntity> permissionStatus =
        await _webClient.getEmployeePermissionStatus();
    return permissionStatus;
  }

  @override
  Future<List<EmployeeOnDutyStatusEntity>> getEmployeeOnDutyStatus() async {
    List<EmployeeOnDutyStatusEntity> onDutyStatus =
        await _webClient.getEmployeeOnDutyStatus();
    return onDutyStatus;
  }

  @override
  Future<List<EmployeeCompOffStatusEntity>> getEmployeeCompOffStatus() async {
    List<EmployeeCompOffStatusEntity> compOffStatus =
        await _webClient.getEmployeeCompOffStatus();
    return compOffStatus;
  }

  @override
  Future<List<MyApprovalEntity>> getMyApprovals() async {
    List<MyApprovalEntity> myApprovals = await _webClient.getMyApprovals();
    return myApprovals;
  }

  @override
  Future<EmployeeTeamAttendanceEntity> getTeamAttendance() async {
    EmployeeTeamAttendanceEntity teamAttendance =
        await _webClient.getTeamAttendance();
    return teamAttendance;
  }

  @override
  Future<Map<String, List<EmployeeTeamLeavesEntity>>>
      getApprovalLeaves() async {
    Map<String, List<EmployeeTeamLeavesEntity>> approvalLeaves =
        await _webClient.getApprovalLeaves();
    return approvalLeaves;
  }

  Future<List<MyAttendanceEntity>> getMyAttendance() async {
    return await _webClient.getMyAttendance();
  }

  Future<EmployeeProfileEntity> getUserProfile() async {
    return await _webClient.getUserProfile();
  }

  Future<List<TeamDailyAttendanceEntity>> getTeamDailyAttendance() async {
    return await _webClient.getTeamDailyAttendance();
  }
}

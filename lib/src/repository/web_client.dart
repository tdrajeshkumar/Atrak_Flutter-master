import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:atrak/src/repository/api_routes.dart';
import 'package:atrak/src/repository/data/beans/beans.dart';
import 'package:atrak/src/repository/data/entities/employee_approval_leaves_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_comp_off_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_leaves_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_on_duty_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_permission_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_profile_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_shift_change_request_status_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_team_attendance_entity.dart';
import 'package:atrak/src/repository/data/entities/employee_team_daily_attendance_entity.dart';
import 'package:atrak/src/repository/data/entities/my_approval_entity.dart';
import 'package:atrak/src/utils/constants.dart';
import 'package:atrak/src/repository/data/entities/my_attendance_entity.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

class WebClient {
  Dio _dio = new Dio(Options(
      connectTimeout: 20000,
      receiveTimeout: 20000,
      contentType: ContentType.json,
      responseType: ResponseType.JSON));

  WebClient() {
    _dio.options.baseUrl = ApiRoutes.endPointURL;
    _setCookie();
  }

  Future<void> _setCookie() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    _dio.cookieJar = new PersistCookieJar(tempPath);
  }

  Future<Token> getToken(String username, String password) async {
    final Map<String, Object> data = {
      "username": username,
      "password": password,
      "grant_type": "password"
    };

    final Response response = await _dio.post(ApiRoutes.login,
        data: data,
        options: Options(
            contentType:
                ContentType.parse("application/x-www-form-urlencoded")));

    print(response.data);

    return Token.fromJson(response.data);
  }

  Future<Employee> getEmployeeDetails(Token token) async {
    final Response response = await _dio.get(ApiRoutes.userDetails,
        options: Options(headers: FormData.from(token.toJson())));
    print(response.data);
    return Employee.fromJson(token, response.data);
  }

  Future<List<Holiday>> getHolidayList(
      {@required String location, @required String year}) async {
    String path = ApiRoutes.holidayList
        .replaceFirst('{location}', location)
        .replaceFirst('{year}', year);

    final Response response = await _dio.get(path).catchError((error) {});

    var holidays = response.data["Holidays"] as List;

    return holidays.map((json) => Holiday.fromJson(json)).toList();
  }

  Future<List<EmployeeLeavesStatusEntity>> getEmployeeLeavesStatus() async {
    String leaves =
        '[{"title": "Sick leave request", "from_date":"12-Nov-2018", "to_date":"14-Nov-2018", "total":"2", "status":"Pending"},{"title": "Casual leave request", "from_date":"27-Nov-2018", "to_date":"29-Nov-2018", "total":"2", "status":"Approved"},{"title": "Casual leave request", "from_date":"02-Dec-2018", "total":"2", "to_date":"04-Dec-2018", "status":"Cancelled"}]';

    var leavesStatusList = JsonDecoder().convert(leaves) as List;
    List<EmployeeLeavesStatusEntity> list = leavesStatusList
        .map((json) => EmployeeLeavesStatusEntity.fromJson(json))
        .toList();

    return list;
  }

  Future<List<EmployeeShiftChangeRequestStatusEntity>>
      getEmployeeShiftChangeRequest() async {
    String requests =
        '[{"title": "Sick leave request", "from_date":"12-Nov-2018", "to_date":"14-Nov-2018", "total":"2", "status":"Pending"},{"title": "Casual leave request", "from_date":"27-Nov-2018", "to_date":"29-Nov-2018", "total":"2", "status":"Approved"},{"title": "Casual leave request", "from_date":"02-Dec-2018", "total":"2", "to_date":"04-Dec-2018", "status":"Cancelled"}]';

    var requestList = JsonDecoder().convert(requests) as List;
    List<EmployeeShiftChangeRequestStatusEntity> list = requestList
        .map((json) => EmployeeShiftChangeRequestStatusEntity.fromJson(json))
        .toList();

    return list;
  }

  Future<List<EmployeePermissionStatusEntity>>
      getEmployeePermissionStatus() async {
    String permissions =
        '[{"title": "Permission", "from_date":"12-Nov-2018 10:00 AM", "to_date":"12-Nov-2018 01:00 PM", "total":"03", "status":"Pending"},{"title": "Permission", "from_date":"27-Nov-2018 10:00 AM", "to_date":"27-Nov-2018 01:00 PM", "total":"3", "status":"Approved"},{"title": "Permission", "from_date":"02-Dec-2018 10:00 AM", "total":"3", "to_date":"02-Dec-2018 01:00 PM", "status":"Cancelled"}]';

    var permissionList = JsonDecoder().convert(permissions) as List;
    List<EmployeePermissionStatusEntity> list = permissionList
        .map((json) => EmployeePermissionStatusEntity.fromJson(json))
        .toList();

    return list;
  }

  Future<List<EmployeeOnDutyStatusEntity>> getEmployeeOnDutyStatus() async {
    String onDuty =
        '[{"title": "OnDuty", "from_date":"12-Nov-2018 10:00 AM", "to_date":"12-Nov-2018 01:00 PM", "total":"03", "status":"Pending"},{"title": "OnDuty", "from_date":"27-Nov-2018 10:00 AM", "to_date":"27-Nov-2018 01:00 PM", "total":"3", "status":"Approved"},{"title": "OnDuty", "from_date":"02-Dec-2018 10:00 AM", "total":"3", "to_date":"02-Dec-2018 01:00 PM", "status":"Cancelled"}]';

    var ondutyList = JsonDecoder().convert(onDuty) as List;
    List<EmployeeOnDutyStatusEntity> list = ondutyList
        .map((json) => EmployeeOnDutyStatusEntity.fromJson(json))
        .toList();

    return list;
  }

  Future<List<EmployeeCompOffStatusEntity>> getEmployeeCompOffStatus() async {
    String onDuty =
        '[{"title": "OnDuty", "from_date":"12-Nov-2018 10:00 AM", "to_date":"12-Nov-2018 01:00 PM", "status":"Pending"},{"title": "OnDuty", "from_date":"27-Nov-2018 10:00 AM", "to_date":"27-Nov-2018 01:00 PM", "status":"Approved"},{"title": "OnDuty", "from_date":"02-Dec-2018 10:00 AM", "to_date":"02-Dec-2018 01:00 PM", "status":"Cancelled"}]';

    var compOffList = JsonDecoder().convert(onDuty) as List;
    List<EmployeeCompOffStatusEntity> list = compOffList
        .map((json) => EmployeeCompOffStatusEntity.fromJson(json))
        .toList();

    return list;
  }

  Future<List<MyApprovalEntity>> getMyApprovals() async {
    String myApprovalsResp =
        '[ { "title": "Punch regularization","icon": "assets/images/manual_punch.png","active":true }, { "title": "Leaves","icon": "assets/images/leaves.png", "active":true }, { "title": "Shift change","icon": "assets/images/shift_change.png", "active":true }, { "title": "Permissions","icon": "assets/images/permission.png", "active":true}, { "title": "Compensatory offs","icon": "", "active":false }, { "title": "Compensatory off credits","icon": "", "active":false}, { "title": "On Duty", "icon": "assets/images/on_duty.png", "active":true }, { "title": "Leave donation", "icon": "", "active":false } ]';

    var myApprovalsList = JsonDecoder().convert(myApprovalsResp) as List;
    print('approvals repo');
    print(myApprovalsList);

    List<MyApprovalEntity> newList = myApprovalsList
        .where((json) => json["active"] == true)
        .map((json) => MyApprovalEntity.fromJson(json))
        .map((entity) => AtrakConstants.myApprovalsMenus.singleWhere(
            (menu) => menu.title.toLowerCase() == entity.title.toLowerCase(),
            orElse: () => null))
        .where((json) => json != null)
        .toList();

    return newList;
  }

  Future<List<MyAttendanceEntity>> getMyAttendance() async {
    String myAttendance =
        '[{"Date": "12-Nov-2018 09:00 AM","Shift": "Shift A","InTime": "12-Nov-2018 09:00 AM","OutTime": "12-Nov-2018 07:00 PM","WorkedHrs": 10,"Status": "Present","ColorCode": "#4286f4","IsWeekOff": "false"},{"Date": "13-Nov-2018 09:00 AM","Shift": "Shift A","InTime": "13-Nov-2018 09:00 AM","OutTime": "13-Nov-2018 07:00 PM","WorkedHrs": 10,"ColorCode": "#4286f4","Status": "Present","IsWeekOff": "false"},{"Date": "11-Dec-2018 09:00 AM","Shift": "Shift A","InTime": "11-Dec-2018 09:00 AM","OutTime": "11-Dec-2018 07:00 PM","WorkedHrs": 10,"Status": "Leave","ColorCode": "#4286f4","IsWeekOff": "false"},{"Date": "14-Dec-2018 09:00 AM","Shift": "Shift A","InTime": "14-Dec-2018 09:00 AM","OutTime": "14-Dec-2018 07:00 PM","WorkedHrs": 10,"Status": "Present","ColorCode": "#4286f4","IsWeekOff": "false"}, {"Date": "25-Dec-2018 09:00 AM","Shift": "Shift A","InTime": "12-Sep-2018 09:00 AM","OutTime": "12-Sep-2018 07:00 PM","WorkedHrs": 10,"Status": "Holiday","ColorCode": "#4286f4","IsWeekOff": "false"}, {"Date": "01-Jan-2019 09:00 AM","Shift": "Shift A","InTime": "01-Jan-2019 09:00 AM","OutTime": "01-Jan-2019 07:00 PM","WorkedHrs": 10,"Status": "Holiday","ColorCode": "#4286f4","IsWeekOff": "false"}, {"Date": "02-Jan-2019 09:00 AM","Shift": "Shift A","InTime": "02-Jan-2019 09:00 AM","OutTime": "02-Jan-2019 07:00 PM","WorkedHrs": 10,"Status": "Leave","ColorCode": "#4286f4","IsWeekOff": "false"},{"Date": "03-Jan-2019 09:00 AM","Shift": "Shift A","InTime": "03-Jan-2019 09:00 AM","OutTime": "03-Jan-2019 07:00 PM","WorkedHrs": 10,"Status": "Present","ColorCode": "#4286f4","IsWeekOff": "false"}]';
    var myAttendanceList = JsonDecoder().convert(myAttendance) as List;
    List<MyAttendanceEntity> list = myAttendanceList
        .map((json) => MyAttendanceEntity.fromJson(json))
        .toList();

    return list;
  }

  Future<EmployeeTeamAttendanceEntity> getTeamAttendance() async {
    String teamAttendance =
        '{ "totalDays": 12, "totalPresent": 10, "totalAbsent": 2,"avgLateTime": "12-Nov-2018 10:00 AM" }';

    var teamAttendanceJson = JsonDecoder().convert(teamAttendance);
    return EmployeeTeamAttendanceEntity.fromJson(teamAttendanceJson);
  }

  Future<List<TeamDailyAttendanceEntity>> getTeamDailyAttendance() async {
    String myAttendance =
        '[{"name":"balada","img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","designation":"Full stack Developer","date": "01-Jan-2019 09:00 AM","in_time": "09:00 AM","out_time": "07:00 PM","worked_hrs": 10},{"name":"bala","img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","designation":"Developer","date": "01-Jan-2019 09:00 AM","in_time": "09:00 AM","out_time": "07:00 PM","worked_hrs": 10},{"name":"bala","img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","designation":"Developer","date": "02-Jan-2019 09:00 AM","in_time": "09:00 AM","out_time": "07:00 PM","worked_hrs": 10},{"name":"bala","designation":"Developer","img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","date": "03-Jan-2019 09:00 AM","in_time": "09:00 AM","out_time": "07:00 PM","worked_hrs": 10},{"name":"bala","designation":"Developer","img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","date": "04-Jan-2019 09:00 AM","in_time": "09:00 AM","out_time": "07:00 PM","worked_hrs": 10}, {"name":"bala","designation":"Developer","img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","date": "05-Jan-2019 09:00 AM","in_time": "09:00 AM","out_time": "07:00 PM","worked_hrs": 10}, {"name":"bala","designation":"Developer","img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","date": "06-Jan-2019 09:00 AM","in_time": "09:00 AM","out_time": "07:00 PM","worked_hrs": 10}, {"name":"bala","designation":"Developer","img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","date": "07-Jan-2019 09:00 AM","in_time": "09:00 AM","out_time": "07:00 PM","worked_hrs": 10},{"name":"bala","designation":"Developer","img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","date": "08-Jan-2019 09:00 AM","in_time": "09:00 AM","out_time": "07:00 PM","worked_hrs": 10}]';
    var myAttendanceList = JsonDecoder().convert(myAttendance) as List;
    List<TeamDailyAttendanceEntity> list = myAttendanceList
        .map((json) => TeamDailyAttendanceEntity.fromJson(json))
        .toList();

    return list;
  }

  Future<Map<String, List<EmployeeTeamLeavesEntity>>>
      getApprovalLeaves() async {
    String approvalLeaves =
        '{"past":[{"staff_id": 1001, "reason":"haha i dont know","staff_name":"bala", "img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","title": "Sick leave request", "from_date":"12-Nov-2018", "to_date":"14-Nov-2018", "total":"2", "status":"Cancelled","reason":"haha i dont know"},{"staff_id": 1004, "staff_name":"bala", "img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","title": "Casual leave request", "from_date":"27-Nov-2018", "to_date":"29-Nov-2018", "total":"2", "status":"Approved","reason":"haha i dont know"}], "active":[{"staff_id": 1002, "staff_name":"bala", "img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","title": "Casual leave request", "from_date":"02-Dec-2018", "total":"2", "to_date":"04-Dec-2018", "status":"Pending","reason":"haha i dont know"},{"staff_id": 1003, "staff_name":"Shankar", "img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","title": "Casual leave request", "from_date":"02-Dec-2018", "total":"2", "to_date":"04-Dec-2018", "status":"Pending","reason":"haha i dont know"},{"staff_id": 1006, "staff_name":"Venkat", "img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","title": "Casual leave request", "from_date":"02-Dec-2018", "total":"2", "to_date":"04-Dec-2018", "status":"Pending","reason":"haha i dont know"},{"staff_id": 1007, "staff_name":"haha", "img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","title": "Casual leave request", "from_date":"02-Dec-2018", "total":"2", "to_date":"04-Dec-2018", "status":"Pending","reason":"haha i dont know"}]}';
    var approvalLeavesJson = JsonDecoder().convert(approvalLeaves);

    var activeL = approvalLeavesJson['active'] as List;
    var pastL = approvalLeavesJson['past'] as List;

    List<EmployeeTeamLeavesEntity> activeList =
        activeL.map((json) => EmployeeTeamLeavesEntity.fromJson(json)).toList();

    List<EmployeeTeamLeavesEntity> pastList =
        pastL.map((json) => EmployeeTeamLeavesEntity.fromJson(json)).toList();

    return {"active": activeList, "past": pastList};
  }

  Future<EmployeeProfileEntity> getUserProfile() async {
    String profile =
        '{ "id":"1002","img":"https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg","first_name": "Balamurugan","last_name": "M", "gender": "Male", "dob": "12-Nov-2018 10:00 AM","phone": "+919655171844","company_name": "Hexolabs", "join_date": "12-Nov-2018 10:00 AM", "department": "IT","designation": "Developer" }';

    var profileJson = JsonDecoder().convert(profile);
    return EmployeeProfileEntity.fromJson(profileJson);
  }
}

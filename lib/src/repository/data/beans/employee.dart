import 'dart:async';

import 'package:atrak/src/repository/data/beans/beans.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';


part 'employee.jorm.dart';

// The model
class Employee {
  Employee();

  Employee.make(
      this.id,
      this.staffId,
      this.userFullName,
      this.userEmailId,
      this.userRole,
      this.gradeName,
      this.officialPhone,
      this.reportingManagerId,
      this.reportingManagerName,
      this.reportingManagerEmailId,
      this.companyId,
      this.companyName,
      this.branchId,
      this.branchName,
      this.departmentId,
      this.deptName,
      this.token);

  static Employee fromJson(Token token, Map<String, Object> json) {
    return Employee.make(
        null,
        json["StaffId"] as String,
        json["UserFullName"] as String,
        json["UserEmailId"] as String,
        json["UserRole"] as String,
        json["GradeName"] as String,
        json["OfficialPhone"] as String,
        json["ReportingManagerId"] as String,
        json["ReportingManagerName"] as String,
        json["ReportingManagerEmailId"] as String,
        json["CompanyId"] as String,
        json["CompanyName"] as String,
        json["BranchId"] as String,
        json["BranchName"] as String,
        json["DepartmentId"] as String,
        json["DeptName"] as String,
        token);

  }

  @PrimaryKey(auto: true)
  int id;
  @Column(isNullable: false)
  String staffId;
  @Column(isNullable: true)
  String userFullName;
  @Column(isNullable: true)
  String userEmailId;
  @Column(isNullable: true)
  String userRole;
  @Column(isNullable: true)
  String gradeName;
  @Column(isNullable: true)
  String officialPhone;
  @Column(isNullable: true)
  String reportingManagerId;
  @Column(isNullable: true)
  String reportingManagerName;
  @Column(isNullable: true)
  String reportingManagerEmailId;
  @Column(isNullable: true)
  String companyId;
  @Column(isNullable: true)
  String companyName;
  @Column(isNullable: true)
  String branchId;
  @Column(isNullable: true)
  String branchName;
  @Column(isNullable: true)
  String departmentId;
  @Column(isNullable: true)
  String deptName;
  @Column(isNullable: true)
  bool isCheckedOut = true;
  @HasOne(TokenBean)
  Token token;

  String toString() =>
      'Employee{staffId: $staffId, userFullName: $userFullName, userEmailId: $userEmailId, userRole: $userRole, gradeName: $gradeName, officialPhno: $officialPhone, reportingManagerId: $reportingManagerId, reportingManagerName: $reportingManagerName, reportingManagerEmail: $reportingManagerEmailId, companyId: $companyId, companyName: $companyName, branchId: $branchId, branchName: $branchName, departName: $departmentId}}';

  static String get tableName => 'employees';
}

@GenBean()
class EmployeeBean extends Bean<Employee> with _EmployeeBean {
  EmployeeBean(Adapter adapter) : tokenBean = TokenBean(adapter), super(adapter);

  final TokenBean tokenBean;

  Future<Null> deleteAllValues() async {
    tokenBean.removeAll();
    this.removeAll();
  }

  final String tableName = 'employees';
}

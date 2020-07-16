import 'package:intl/intl.dart';

class EmployeeTeamLeavesEntity {
  final String staffId;
  final String title;
  final String imgUrl;
  final String staffName;
  final String fromToDate;
  final DateTime fromDate;
  final DateTime toDate;
  final String totalDays;
  final String status;
  final String reason;

  EmployeeTeamLeavesEntity(
      {this.staffId,
      this.imgUrl,
      this.staffName,
      this.title,
      this.fromToDate,
      this.fromDate,
      this.toDate,
      this.totalDays,
      this.status,
      this.reason});

  static DateFormat _dateFormat = DateFormat("dd-MMM-yyyy");
  static DateFormat _monthDayFormat = DateFormat("MMM dd - ");
  static DateFormat _monthDayYearFormat = DateFormat("MMM dd yyyy");

  static EmployeeTeamLeavesEntity fromJson(Map<String, Object> json) {
    return EmployeeTeamLeavesEntity(
        staffId: json['staff_id'].toString(),
        staffName: json['staff_name'].toString(),
        imgUrl: json['img'] as String,
        title: json["title"] as String,
        fromDate: _dateFormat.parse(json['from_date']),
        toDate: _dateFormat.parse(json['to_date']),
        fromToDate:
            "${_monthDayFormat.format(_dateFormat.parse(json['from_date']))}${_monthDayYearFormat.format(_dateFormat.parse(json['to_date']))}",
        totalDays: json['total'].toString(),
        status: json['status'] as String,
        reason: json['reason'] as String);
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is EmployeeTeamLeavesEntity &&
          runtimeType == other.runtimeType &&
          staffId == other.staffId;

  @override
  String toString() =>
      'UserApprovalLeavesEntity { staffId:$staffId, imgUrl:$imgUrl,staffName:$staffName, title: $title, status: $status, fromToDate: $fromToDate, reason:$reason }, total: $totalDays';
}

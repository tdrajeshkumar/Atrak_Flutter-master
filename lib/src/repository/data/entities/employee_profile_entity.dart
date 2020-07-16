import 'package:intl/intl.dart';

class EmployeeProfileEntity {
  final String id;
  final String img;
  final String firstName;
  final String lastName;
  final String gender;
  final DateTime dob;
  final String phone;
  final String companyName;
  final DateTime joinDate;
  final String department;
  final String designation;

  EmployeeProfileEntity({
    this.id,
    this.img,
    this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.phone,
    this.companyName,
    this.joinDate,
    this.department,
    this.designation,
  });

  static DateFormat _dateFormat = DateFormat("dd-MMM-yyyy");

  static EmployeeProfileEntity fromJson(Map<String, Object> json) {
    print(json);
    print('printed');
    return EmployeeProfileEntity(
      id: json['id'].toString(),
      img: json['img'].toString(),
      firstName: json['first_name'].toString(),
      lastName: json['last_name'].toString(),
      gender: json['gender'].toString(),
      dob: _dateFormat.parse(json['dob']),
      phone: json['phone'].toString(),
      companyName: json['company_name'].toString(),
      joinDate: _dateFormat.parse(json['join_date']),
      department: json['department'].toString(),
      designation: json['designation'].toString(),
    );
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is EmployeeProfileEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          img == other.img &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          gender == other.gender &&
          dob == other.dob &&
          phone == other.phone &&
          companyName == other.companyName &&
          joinDate == other.joinDate &&
          department == other.department &&
          designation == other.designation;

  @override
  String toString() =>
      'UserProfileEntity {id:$id, img:$img, firstName:$firstName,lastName:$lastName, gender:$gender,dob:$dob, phone: $phone, companyName: $companyName, joinDate: $joinDate, department:$department , designation: $designation}';
}

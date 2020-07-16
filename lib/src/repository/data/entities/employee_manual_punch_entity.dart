import 'package:meta/meta.dart';

class EmployeeManualPunchEntity {
  final String id;
  final String name;

  EmployeeManualPunchEntity({@required this.id, @required this.name});

  @override
  String toString() => 'UserManualPunchEntity { id: $id, name: $name }';
}

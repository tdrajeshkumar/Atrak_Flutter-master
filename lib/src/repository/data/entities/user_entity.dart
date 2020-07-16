import 'package:intl/intl.dart';

class UserEntity {
  final String id;
  final String name;
  final DateTime lastCheckIn;
  final DateTime lastCheckOut;

  UserEntity({this.id, this.name, this.lastCheckIn, this.lastCheckOut});

  DateFormat _dateFormat = DateFormat("EEEE d, MMM y, hh:mm");

  Map<String, Object> toJson() {
    return {
      "id": id,
      "name": name,
      "check_in_time":
      lastCheckIn != null ? lastCheckIn.millisecondsSinceEpoch : 0,
      "check_out_time":
      lastCheckOut != null ? lastCheckOut.millisecondsSinceEpoch : 0
    };
  }

  static UserEntity fromJson(Map<String, Object> json) {
    return UserEntity(
        id: json["id"] as String,
        name: json["name"] as String,
        lastCheckIn: json["check_in_time"] == 0

            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["check_in_time"] as int),
        lastCheckOut: json["check_out_time"] == 0
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
            json["check_out_time"] as int));
  }

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name, lastCheckedIn: ${_dateFormat.format(lastCheckIn)}, lastCheckedOut: ${_dateFormat.format(lastCheckOut)}}';
  }
}

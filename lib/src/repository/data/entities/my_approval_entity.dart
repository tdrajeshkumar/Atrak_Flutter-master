import 'package:meta/meta.dart';

class MyApprovalEntity {
  final String icon;
  final String title;
  final int count;

  MyApprovalEntity(
      {@required this.icon, @required this.title, this.count = 0});

  static MyApprovalEntity fromJson(Map<String, Object> json) {
    return MyApprovalEntity(
      icon: json["icon"] as String,
      title: json['title'] as String,
      count: json['count'] as int,
    );
  }

  @override
  String toString() =>
      'MyApprovalEntity { title: $title, icon: $icon, count: $count }';
}

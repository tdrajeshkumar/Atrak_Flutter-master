import 'package:atrak/src/repository/data/entities/my_approval_entity.dart';

class AtrakConstants {
  static List<MyApprovalEntity> myApprovalsMenus = [
    MyApprovalEntity(
        title: 'Punch regularization', icon: 'assets/images/manual_punch.png'),
    MyApprovalEntity(title: 'Leaves', icon: 'assets/images/leaves.png'),
    MyApprovalEntity(
        title: 'Shift change', icon: 'assets/images/shift_change.png'),
    MyApprovalEntity(
        title: 'Permissions', icon: 'assets/images/permission.png'),
    MyApprovalEntity(title: 'On Duty', icon: 'assets/images/on_duty.png'),
    MyApprovalEntity(title: 'Compensatory offs', icon: ''),
    MyApprovalEntity(title: 'Compensatory off credits', icon: ''),
    MyApprovalEntity(title: 'Leave donation', icon: ''),
  ];
}

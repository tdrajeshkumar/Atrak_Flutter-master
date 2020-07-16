import 'dart:async';

import 'package:atrak/src/localizations/messages_all.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AtrakLocalizations {
  AtrakLocalizations(this.locale);

  final Locale locale;

  static Future<AtrakLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString()).then((_) {
      return AtrakLocalizations(locale);
    });
  }

  static AtrakLocalizations of(BuildContext context) {
    return Localizations.of<AtrakLocalizations>(context, AtrakLocalizations);
  }

  String get logoText => Intl.message(
        'Brand logo',
        name: 'logoText',
        args: [],
        locale: locale.toString(),
      );

  String get login => Intl.message(
        'Login',
        name: 'login',
        args: [],
        locale: locale.toString(),
      );

  String get usernameHint => Intl.message(
        'User ID',
        name: 'usernameHint',
        args: [],
        locale: locale.toString(),
      );

  String get usernameLabel => Intl.message(
        'User ID',
        name: 'usernameLabel',
        args: [],
        locale: locale.toString(),
      );

  String get passwordLabel => Intl.message(
        'Password',
        name: 'passwordLabel',
        args: [],
        locale: locale.toString(),
      );

  // Manual punch locals start

  String get manualPunch => Intl.message(
        'Manual punch',
        name: 'manualPunch',
        args: [],
        locale: locale.toString(),
      );

  String get staffName => Intl.message(
        'Staff name',
        name: 'staffName',
        args: [],
        locale: locale.toString(),
      );

  String get selectPunch => Intl.message(
        'Select punch',
        name: 'selectPunch',
        args: [],
        locale: locale.toString(),
      );

  String get inLabel => Intl.message(
        'in',
        name: 'inLabel',
        args: [],
        locale: locale.toString(),
      );

  String get outLabel => Intl.message(
        'out',
        name: 'outLabel',
        args: [],
        locale: locale.toString(),
      );

  String get inOutLabel => Intl.message(
        'in-out',
        name: 'inOutLabel',
        args: [],
        locale: locale.toString(),
      );

  String get timeLabel => Intl.message(
        'time',
        name: 'timeLabel',
        args: [],
        locale: locale.toString(),
      );

  // Manual punch locals end

  // Leave balance

  String get leaveBalance => Intl.message(
        'Leave balance',
        name: 'leaveBalance',
        args: [],
        locale: locale.toString(),
      );

  String get myAttendance => Intl.message(
        'My Attendance',
        name: 'myAttendance',
        args: [],
        locale: locale.toString(),
      );

  String get inAndOutTimeSummary => Intl.message(
        'In - Out time summary',
        name: 'inAndOutTimeSummary',
        args: [],
        locale: locale.toString(),
      );

  String get holidayList => Intl.message(
        'Holiday List',
        name: 'holidayList',
        args: [],
        locale: locale.toString(),
      );

  String holidays(int year) => Intl.message(
        'Holidays $year',
        name: 'holidays',
        args: [year],
        locale: locale.toString(),
      );

  String get leaves => Intl.message(
        'Leaves',
        name: 'leaves',
        args: [],
        locale: locale.toString(),
      );

  String get balance => Intl.message(
        'Balance',
        name: 'balance',
        args: [],
        locale: locale.toString(),
      );

  String get request => Intl.message(
        'Request',
        name: 'request',
        args: [],
        locale: locale.toString(),
      );

  String get status => Intl.message(
        'Status',
        name: 'status',
        args: [],
        locale: locale.toString(),
      );

  String get leaveApplication => Intl.message(
        'Leave application',
        name: 'leaveApplication',
        args: [],
        locale: locale.toString(),
      );

  String get leaveStatus => Intl.message(
        'Leave status',
        name: 'leaveStatus',
        args: [],
        locale: locale.toString(),
      );

  String get fromDate => Intl.message(
        'From date',
        name: 'fromDate',
        args: [],
        locale: locale.toString(),
      );

  String get selectFromDateErrorMessage => Intl.message(
        'Select from date before to date',
        name: 'selectFromDateErrorMessage',
        args: [],
        locale: locale.toString(),
      );

  String get fullDay => Intl.message(
        'Full day',
        name: 'fullDay',
        args: [],
        locale: locale.toString(),
      );

  String get firstHalf => Intl.message(
        'First Half',
        name: 'firstHalf',
        args: [],
        locale: locale.toString(),
      );

  String get secondHalf => Intl.message(
        'Second half',
        name: 'secondHalf',
        args: [],
        locale: locale.toString(),
      );

  String get toDate => Intl.message(
        'To date',
        name: 'toDate',
        args: [],
        locale: locale.toString(),
      );

  String get totalDays => Intl.message(
        'Total days',
        name: 'totalDays',
        args: [],
        locale: locale.toString(),
      );

  String get leaveType => Intl.message(
        'Leave type',
        name: 'leaveType',
        args: [],
        locale: locale.toString(),
      );

  String get reason => Intl.message(
        'Reason',
        name: 'reason',
        args: [],
        locale: locale.toString(),
      );

  String get contactNo => Intl.message(
        'Contact No.',
        name: 'contactNo',
        args: [],
        locale: locale.toString(),
      );

  String get submit => Intl.message(
        'Submit',
        name: 'submit',
        args: [],
        locale: locale.toString(),
      );

  String get shiftChange => Intl.message(
        'Shift Change',
        name: 'shiftChange',
        args: [],
        locale: locale.toString(),
      );

  String get oldShift => Intl.message(
        'Old shift',
        name: 'oldShift',
        args: [],
        locale: locale.toString(),
      );

  String get newShift => Intl.message(
        'New shift',
        name: 'newShift',
        args: [],
        locale: locale.toString(),
      );

  String get selectFromTimeErrorMessage => Intl.message(
        'Select From time before to time',
        name: 'selectFromTimeErrorMessage',
        args: [],
        locale: locale.toString(),
      );

  String get shiftRequest => Intl.message(
        'Shift requests',
        name: 'shiftRequest',
        args: [],
        locale: locale.toString(),
      );

  String get requestStatus => Intl.message(
        'Request status',
        name: 'requestStatus',
        args: [],
        locale: locale.toString(),
      );

  String get shiftChangeApplication => Intl.message(
        'Shift change application',
        name: 'shiftChangeApplication',
        args: [],
        locale: locale.toString(),
      );

  String get shiftChangeStatus => Intl.message(
        'Shift change status',
        name: 'shiftChangeStatus',
        args: [],
        locale: locale.toString(),
      );

  // Permission Page
  String get permission => Intl.message(
        'Permission',
        name: 'permission',
        args: [],
        locale: locale.toString(),
      );

  String get permissionRequest => Intl.message(
        'Permission Request',
        name: 'permissionRequest',
        args: [],
        locale: locale.toString(),
      );

  String get askForPermission => Intl.message(
        'Ask for permission',
        name: 'askForPermission',
        args: [],
        locale: locale.toString(),
      );

  String get date => Intl.message(
        'Date',
        name: 'date',
        args: [],
        locale: locale.toString(),
      );

  String get fromTime => Intl.message(
        'From time',
        name: 'fromTime',
        args: [],
        locale: locale.toString(),
      );

  String get toTime => Intl.message(
        'To time',
        name: 'toTime',
        args: [],
        locale: locale.toString(),
      );

  String get permittedHours => Intl.message(
        'Permitted hrs',
        name: 'permittedHours',
        args: [],
        locale: locale.toString(),
      );

  String get emptyPermittedHours => Intl.message(
        '-- : --',
        name: 'emptyPermittedHours',
        args: [],
        locale: locale.toString(),
      );

  String get permissionType => Intl.message(
        'Permission type',
        name: 'permissionType',
        args: [],
        locale: locale.toString(),
      );

  //OD locals start

  String get od => Intl.message(
        'OD',
        name: 'od',
        args: [],
        locale: locale.toString(),
      );

  String get odRequest => Intl.message(
        'OD request',
        name: 'odRequest',
        args: [],
        locale: locale.toString(),
      );

  String get askForOd => Intl.message(
        'Ask for OD',
        name: 'askForOd',
        args: [],
        locale: locale.toString(),
      );

  String get duration => Intl.message(
        'Duration',
        name: 'duration',
        args: [],
        locale: locale.toString(),
      );

  String get singleDays => Intl.message(
        'Single days',
        name: 'singleDays',
        args: [],
        locale: locale.toString(),
      );

  String get multipleDays => Intl.message(
        'Multiple days',
        name: 'multipleDays',
        args: [],
        locale: locale.toString(),
      );

  String get onDutyType => Intl.message(
        'OD type',
        name: 'onDutyType',
        args: [],
        locale: locale.toString(),
      );

  //OD locals end

  // comp off locals start

  String get compOff => Intl.message(
        'Comp-off',
        name: 'compOff',
        args: [],
        locale: locale.toString(),
      );

  String get compOffRequest => Intl.message(
        'Comp-off request',
        name: 'compOffRequest',
        args: [],
        locale: locale.toString(),
      );

  String get askForCompOff => Intl.message(
        'Ask for Comp-off',
        name: 'askForCompOff',
        args: [],
        locale: locale.toString(),
      );

  String get workedDate => Intl.message(
        'Worked Date',
        name: 'workedDate',
        args: [],
        locale: locale.toString(),
      );

  // comp off locals end

  String get shiftStart => Intl.message(
        'Shift start',
        name: 'shiftStart',
        args: [],
        locale: locale.toString(),
      );

  String get betweenShift => Intl.message(
        'Between shift',
        name: 'betweenShift',
        args: [],
        locale: locale.toString(),
      );

  String get shiftEnd => Intl.message(
        'Shift end',
        name: 'shiftEnd',
        args: [],
        locale: locale.toString(),
      );

  String get totalHours => Intl.message(
        'Total Hrs',
        name: 'totalHours',
        args: [],
        locale: locale.toString(),
      );
  //Team Attendance locals

  String get teamAttendance => Intl.message(
        'Team attendance',
        name: 'teamAttendance',
        args: [],
        locale: locale.toString(),
      );

  String get myApprovals => Intl.message(
        'My Approvals',
        name: 'myApprovals',
        args: [],
        locale: locale.toString(),
      );

  String get todaysSummery => Intl.message(
        'Today\'s Summery',
        name: 'todaysSummery',
        args: [],
        locale: locale.toString(),
      );

  String get approvals => Intl.message(
        'Approvals',
        name: 'approvals',
        args: [],
        locale: locale.toString(),
      );

  String get totalPresent => Intl.message(
        'Total present',
        name: 'totalPresent',
        args: [],
        locale: locale.toString(),
      );
  String get avgLateComeTime => Intl.message(
        'Avg. Late coming time',
        name: 'avgLateComeTime',
        args: [],
        locale: locale.toString(),
      );
  String get totalAbsent => Intl.message(
        'Total absent',
        name: 'totalAbsent',
        args: [],
        locale: locale.toString(),
      );

  String get dailyAttendance => Intl.message(
        'Daily attendance',
        name: 'dailyAttendance',
        args: [],
        locale: locale.toString(),
      );

  // Approval Leaves locals
  String get activeRequest => Intl.message(
        'Active requests',
        name: 'activeRequest',
        args: [],
        locale: locale.toString(),
      );

  String get pastRequest => Intl.message(
        'Past requests',
        name: 'pastRequest',
        args: [],
        locale: locale.toString(),
      );

  //Approval leaves locals
  String get leaveDetails => Intl.message(
        'Leave details',
        name: 'leaveDetails',
        args: [],
        locale: locale.toString(),
      );

  String get dateFrom => Intl.message(
        'Date from',
        name: 'dateFrom',
        args: [],
        locale: locale.toString(),
      );

  String get dateTo => Intl.message(
        'Date to',
        name: 'dateTo',
        args: [],
        locale: locale.toString(),
      );

  String get approve => Intl.message(
        'Approve',
        name: 'approve',
        args: [],
        locale: locale.toString(),
      );

  String get cancel => Intl.message(
        'Cancel',
        name: 'cancel',
        args: [],
        locale: locale.toString(),
      );

  String get approvedSuccessfully => Intl.message(
        'Approved Successfully',
        name: 'approvedSuccessfully',
        args: [],
        locale: locale.toString(),
      );

  // my approval shift change
  String get shiftDetails => Intl.message(
        'Shift details',
        name: 'shiftDetails',
        args: [],
        locale: locale.toString(),
      );

  String get department => Intl.message(
        'Department',
        name: 'department',
        args: [],
        locale: locale.toString(),
      );

  //Profile screen locals
  String get profile => Intl.message(
        'Profile',
        name: 'profile',
        args: [],
        locale: locale.toString(),
      );

  String get personalDetails => Intl.message(
        'Personal Details',
        name: 'personalDetails',
        args: [],
        locale: locale.toString(),
      );
  String get companyDetails => Intl.message(
        'Company Details',
        name: 'companyDetails',
        args: [],
        locale: locale.toString(),
      );
}

class AtrakLocalizationsDelegate
    extends LocalizationsDelegate<AtrakLocalizations> {
  @override
  Future<AtrakLocalizations> load(Locale locale) =>
      AtrakLocalizations.load(locale);

  @override
  bool shouldReload(AtrakLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains("en");
}

import 'package:atrak/src/repository/data/beans/beans.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DbStorage {
  final String tag;
  final String dbPath;

  /// The adapter and been
  SqfliteAdapter _adapter;
  EmployeeBean _employeeBean;
  TokenBean _tokenBean;
  HolidayBean _holidayBean;

  bool _tableInitialized = false;

  DbStorage({@required this.tag, this.dbPath}) {
    _adapter = SqfliteAdapter(path.join(dbPath, "atrak.db"), version: 1);
  }

  Future<void> _initTables() async {
    await Sqflite.setDebugModeOn(true);
    await _adapter.connect();

    _employeeBean = EmployeeBean(_adapter);
    _tokenBean = TokenBean(_adapter);
    _holidayBean = HolidayBean(_adapter);

    _employeeBean.createTable(ifNotExists: true);
    _tokenBean.createTable(ifNotExists: true);
    _holidayBean.createTable(ifNotExists: true);

  }

  Future<Null> saveEmployee(Employee employee) async {
    await _employeeBean.insert(employee, cascade: true);
  }

  Future<Token> getToken() async {
    if (!_tableInitialized) {
      await _initTables();
    }
    final List<Token> tokens = await _tokenBean.getAll();

    print("Tokens Length : ${tokens.length}");

    return tokens.length > 0 ? tokens.first : null;
  }

  Future<bool> saveToken(Token token) async {
    try {
      await _tokenBean.insert(token);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<void> deleteToken() async {
    await _tokenBean.removeAll();
    return;
  }

  Future<Employee> fetchEmployeeDetails() async {
    return (await _employeeBean.getAll()).first;
  }

  Future<void> close() async {
    if (_adapter != null) await _adapter.close();
  }

  Future<void> deleteEmployee() async {
    return await _employeeBean.deleteAllValues();
  }

  Future<List<Holiday>> getHolidayList() async {
    return await _holidayBean.getAll();
  }
}

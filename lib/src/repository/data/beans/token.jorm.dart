// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _TokenBean implements Bean<Token> {
  final accessToken = StrField('access_token');
  final tokenType = StrField('token_type');
  final expiredIn = DateTimeField('expired_in');
  final refreshToken = StrField('refresh_token');
  final employeeId = IntField('employee_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        accessToken.name: accessToken,
        tokenType.name: tokenType,
        expiredIn.name: expiredIn,
        refreshToken.name: refreshToken,
        employeeId.name: employeeId,
      };
  Token fromMap(Map map) {
    Token model = Token();
    model.accessToken = adapter.parseValue(map['access_token']);
    model.tokenType = adapter.parseValue(map['token_type']);
    model.expiredIn = adapter.parseValue(map['expired_in']);
    model.refreshToken = adapter.parseValue(map['refresh_token']);
    model.employeeId = adapter.parseValue(map['employee_id']);

    return model;
  }

  List<SetColumn> toSetColumns(Token model,
      {bool update = false, Set<String> only}) {
    List<SetColumn> ret = [];

    if (only == null) {
      ret.add(accessToken.set(model.accessToken));
      ret.add(tokenType.set(model.tokenType));
      ret.add(expiredIn.set(model.expiredIn));
      ret.add(refreshToken.set(model.refreshToken));
      ret.add(employeeId.set(model.employeeId));
    } else {
      if (only.contains(accessToken.name))
        ret.add(accessToken.set(model.accessToken));
      if (only.contains(tokenType.name))
        ret.add(tokenType.set(model.tokenType));
      if (only.contains(expiredIn.name))
        ret.add(expiredIn.set(model.expiredIn));
      if (only.contains(refreshToken.name))
        ret.add(refreshToken.set(model.refreshToken));
      if (only.contains(employeeId.name))
        ret.add(employeeId.set(model.employeeId));
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists: false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addStr(accessToken.name, primary: true, isNullable: false);
    st.addStr(tokenType.name, isNullable: true);
    st.addDateTime(expiredIn.name, isNullable: true);
    st.addStr(refreshToken.name, isNullable: true);
    st.addInt(employeeId.name,
        foreignTable: employeeBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Token model) async {
    final Insert insert = inserter.setMany(toSetColumns(model));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<Token> models) async {
    final List<List<SetColumn>> data =
        models.map((model) => toSetColumns(model)).toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Token model) async {
    final Upsert upsert = upserter.setMany(toSetColumns(model));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<Token> models) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(toSetColumns(model).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(Token model, {Set<String> only}) async {
    final Update update = updater
        .where(this.accessToken.eq(model.accessToken))
        .setMany(toSetColumns(model, only: only));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Token> models) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(toSetColumns(model).toList());
      where.add(this.accessToken.eq(model.accessToken));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<Token> find(String accessToken,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder.where(this.accessToken.eq(accessToken));
    return await findOne(find);
  }

  Future<int> remove(String accessToken) async {
    final Remove remove = remover.where(this.accessToken.eq(accessToken));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Token> models) async {
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.accessToken.eq(model.accessToken));
    }
    return adapter.remove(remove);
  }

  Future<Token> findByEmployee(int employeeId,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder.where(this.employeeId.eq(employeeId));
    return findOne(find);
  }

  Future<List<Token>> findByEmployeeList(List<Employee> models,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder;
    for (Employee model in models) {
      find.or(this.employeeId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByEmployee(int employeeId) async {
    final Remove rm = remover.where(this.employeeId.eq(employeeId));
    return await adapter.remove(rm);
  }

  void associateEmployee(Token child, Employee parent) {
    child.employeeId = parent.id;
  }

  EmployeeBean get employeeBean;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _EmployeeBean implements Bean<Employee> {
  final id = IntField('id');
  final staffId = StrField('staff_id');
  final userFullName = StrField('user_full_name');
  final userEmailId = StrField('user_email_id');
  final userRole = StrField('user_role');
  final gradeName = StrField('grade_name');
  final officialPhone = StrField('official_phone');
  final reportingManagerId = StrField('reporting_manager_id');
  final reportingManagerName = StrField('reporting_manager_name');
  final reportingManagerEmailId = StrField('reporting_manager_email_id');
  final companyId = StrField('company_id');
  final companyName = StrField('company_name');
  final branchId = StrField('branch_id');
  final branchName = StrField('branch_name');
  final departmentId = StrField('department_id');
  final deptName = StrField('dept_name');
  final isCheckedOut = BoolField('is_checked_out');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        staffId.name: staffId,
        userFullName.name: userFullName,
        userEmailId.name: userEmailId,
        userRole.name: userRole,
        gradeName.name: gradeName,
        officialPhone.name: officialPhone,
        reportingManagerId.name: reportingManagerId,
        reportingManagerName.name: reportingManagerName,
        reportingManagerEmailId.name: reportingManagerEmailId,
        companyId.name: companyId,
        companyName.name: companyName,
        branchId.name: branchId,
        branchName.name: branchName,
        departmentId.name: departmentId,
        deptName.name: deptName,
        isCheckedOut.name: isCheckedOut,
      };
  Employee fromMap(Map map) {
    Employee model = Employee();
    model.id = adapter.parseValue(map['id']);
    model.staffId = adapter.parseValue(map['staff_id']);
    model.userFullName = adapter.parseValue(map['user_full_name']);
    model.userEmailId = adapter.parseValue(map['user_email_id']);
    model.userRole = adapter.parseValue(map['user_role']);
    model.gradeName = adapter.parseValue(map['grade_name']);
    model.officialPhone = adapter.parseValue(map['official_phone']);
    model.reportingManagerId = adapter.parseValue(map['reporting_manager_id']);
    model.reportingManagerName =
        adapter.parseValue(map['reporting_manager_name']);
    model.reportingManagerEmailId =
        adapter.parseValue(map['reporting_manager_email_id']);
    model.companyId = adapter.parseValue(map['company_id']);
    model.companyName = adapter.parseValue(map['company_name']);
    model.branchId = adapter.parseValue(map['branch_id']);
    model.branchName = adapter.parseValue(map['branch_name']);
    model.departmentId = adapter.parseValue(map['department_id']);
    model.deptName = adapter.parseValue(map['dept_name']);
    model.isCheckedOut = adapter.parseValue(map['is_checked_out']);

    return model;
  }

  List<SetColumn> toSetColumns(Employee model,
      {bool update = false, Set<String> only}) {
    List<SetColumn> ret = [];

    if (only == null) {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      ret.add(staffId.set(model.staffId));
      ret.add(userFullName.set(model.userFullName));
      ret.add(userEmailId.set(model.userEmailId));
      ret.add(userRole.set(model.userRole));
      ret.add(gradeName.set(model.gradeName));
      ret.add(officialPhone.set(model.officialPhone));
      ret.add(reportingManagerId.set(model.reportingManagerId));
      ret.add(reportingManagerName.set(model.reportingManagerName));
      ret.add(reportingManagerEmailId.set(model.reportingManagerEmailId));
      ret.add(companyId.set(model.companyId));
      ret.add(companyName.set(model.companyName));
      ret.add(branchId.set(model.branchId));
      ret.add(branchName.set(model.branchName));
      ret.add(departmentId.set(model.departmentId));
      ret.add(deptName.set(model.deptName));
      ret.add(isCheckedOut.set(model.isCheckedOut));
    } else {
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(staffId.name)) ret.add(staffId.set(model.staffId));
      if (only.contains(userFullName.name))
        ret.add(userFullName.set(model.userFullName));
      if (only.contains(userEmailId.name))
        ret.add(userEmailId.set(model.userEmailId));
      if (only.contains(userRole.name)) ret.add(userRole.set(model.userRole));
      if (only.contains(gradeName.name))
        ret.add(gradeName.set(model.gradeName));
      if (only.contains(officialPhone.name))
        ret.add(officialPhone.set(model.officialPhone));
      if (only.contains(reportingManagerId.name))
        ret.add(reportingManagerId.set(model.reportingManagerId));
      if (only.contains(reportingManagerName.name))
        ret.add(reportingManagerName.set(model.reportingManagerName));
      if (only.contains(reportingManagerEmailId.name))
        ret.add(reportingManagerEmailId.set(model.reportingManagerEmailId));
      if (only.contains(companyId.name))
        ret.add(companyId.set(model.companyId));
      if (only.contains(companyName.name))
        ret.add(companyName.set(model.companyName));
      if (only.contains(branchId.name)) ret.add(branchId.set(model.branchId));
      if (only.contains(branchName.name))
        ret.add(branchName.set(model.branchName));
      if (only.contains(departmentId.name))
        ret.add(departmentId.set(model.departmentId));
      if (only.contains(deptName.name)) ret.add(deptName.set(model.deptName));
      if (only.contains(isCheckedOut.name))
        ret.add(isCheckedOut.set(model.isCheckedOut));
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists: false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addStr(staffId.name, isNullable: false);
    st.addStr(userFullName.name, isNullable: true);
    st.addStr(userEmailId.name, isNullable: true);
    st.addStr(userRole.name, isNullable: true);
    st.addStr(gradeName.name, isNullable: true);
    st.addStr(officialPhone.name, isNullable: true);
    st.addStr(reportingManagerId.name, isNullable: true);
    st.addStr(reportingManagerName.name, isNullable: true);
    st.addStr(reportingManagerEmailId.name, isNullable: true);
    st.addStr(companyId.name, isNullable: true);
    st.addStr(companyName.name, isNullable: true);
    st.addStr(branchId.name, isNullable: true);
    st.addStr(branchName.name, isNullable: true);
    st.addStr(departmentId.name, isNullable: true);
    st.addStr(deptName.name, isNullable: true);
    st.addBool(isCheckedOut.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Employee model, {bool cascade: false}) async {
    final Insert insert = inserter.setMany(toSetColumns(model)).id(id.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      Employee newModel;
      if (model.token != null) {
        newModel ??= await find(retId);
        tokenBean.associateEmployee(model.token, newModel);
        await tokenBean.insert(model.token);
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Employee> models, {bool cascade: false}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data =
          models.map((model) => toSetColumns(model)).toList();
      final InsertMany insert = inserters.addAll(data);
      await adapter.insertMany(insert);
      return;
    }
  }

  Future<dynamic> upsert(Employee model, {bool cascade: false}) async {
    final Upsert upsert = upserter.setMany(toSetColumns(model)).id(id.name);
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Employee newModel;
      if (model.token != null) {
        newModel ??= await find(retId);
        tokenBean.associateEmployee(model.token, newModel);
        await tokenBean.upsert(model.token);
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Employee> models, {bool cascade: false}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = [];
      for (var i = 0; i < models.length; ++i) {
        var model = models[i];
        data.add(toSetColumns(model).toList());
      }
      final UpsertMany upsert = upserters.addAll(data);
      await adapter.upsertMany(upsert);
      return;
    }
  }

  Future<int> update(Employee model,
      {bool cascade: false, bool associate: false, Set<String> only}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only));
    final ret = adapter.update(update);
    if (cascade) {
      Employee newModel;
      if (model.token != null) {
        if (associate) {
          newModel ??= await find(model.id);
          tokenBean.associateEmployee(model.token, newModel);
        }
        await tokenBean.update(model.token);
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Employee> models, {bool cascade: false}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = [];
      final List<Expression> where = [];
      for (var i = 0; i < models.length; ++i) {
        var model = models[i];
        data.add(toSetColumns(model).toList());
        where.add(this.id.eq(model.id));
      }
      final UpdateMany update = updaters.addAll(data, where);
      await adapter.updateMany(update);
      return;
    }
  }

  Future<Employee> find(int id,
      {bool preload: false, bool cascade: false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Employee model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(int id, [bool cascade = false]) async {
    if (cascade) {
      final Employee newModel = await find(id);
      if (newModel != null) {
        await tokenBean.removeByEmployee(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Employee> models) async {
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Employee> preload(Employee model, {bool cascade: false}) async {
    model.token = await tokenBean.findByEmployee(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Employee>> preloadAll(List<Employee> models,
      {bool cascade: false}) async {
    await OneToXHelper.preloadAll<Employee, Token>(
        models,
        (Employee model) => [model.id],
        tokenBean.findByEmployeeList,
        (Token model) => [model.employeeId],
        (Employee model, Token child) => model.token = child,
        cascade: cascade);
    return models;
  }

  TokenBean get tokenBean;
}

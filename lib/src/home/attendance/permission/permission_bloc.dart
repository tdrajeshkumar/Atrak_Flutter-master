import 'package:atrak/src/home/attendance/permission/permission.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_permission_status_entity.dart';
import 'package:bloc/bloc.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  final ApiRepository _repository;

  PermissionBloc(this._repository);

  void getPermissionStatus() {
    dispatch(GetPermissionStatus());
  }

  @override
  PermissionState get initialState => PermissionState.initial();

  @override
  Stream<PermissionState> mapEventToState(
      PermissionState state, PermissionEvent event) async* {
    if (event is GetPermissionStatus) {
      yield PermissionState.loading();
      List<EmployeePermissionStatusEntity> permissionStatus =
          await _repository.getEmployeePermissionStatus();

      try {
        yield PermissionState.permissionStatusLoaded(permissionStatus);
      } catch (error) {
        yield PermissionState.showError("error");
      }
    }
  }
}

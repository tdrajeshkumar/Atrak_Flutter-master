import 'package:atrak/src/home/attendance/profile/profile.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/entities/employee_profile_entity.dart';
import 'package:bloc/bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ApiRepository _repository;

  ProfileBloc(this._repository);
  @override
  ProfileState get initialState => ProfileState.initial();

  void getUserProfile() {
    dispatch(GetUserProfile());
  }

  @override
  Stream<ProfileState> mapEventToState(
      ProfileState currentState, ProfileEvent event) async* {
    if (event is GetUserProfile) {
      yield ProfileState.loading();

      try {
        var user = await _repository.getUserProfile();
        print(user);
        yield ProfileState.userLoaded(user);
      } catch (error) {
        yield ProfileState.showError(error.toString());
      }
    }
  }
}

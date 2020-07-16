import 'dart:async';

import 'package:atrak/src/authentication/authentication.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/beans/beans.dart';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final ApiRepository repository;

  AuthenticationBloc(this.repository);

  void onAppStart() {
    dispatch(AppStarted());
  }

  void onLogin({@required Token token}) {
    dispatch(LoggedIn(token: token));
  }

  void onLogout() {
    dispatch(LoggedOut());
  }

  @override
  AuthenticationState get initialState => AuthenticationState.initializing();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationState state, AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await repository.hasToken();
      print("HasToken : $hasToken");
      if (hasToken) {
        yield AuthenticationState.authenticated();
      } else {
        yield AuthenticationState.unauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield state.copyWith(isLoading: true);

      Employee employee = await repository.getEmployeeDetails(event.token);

      await repository.saveEmployee(employee);

      yield AuthenticationState.authenticated();
    }

    if (event is LoggedOut) {
      yield state.copyWith(isLoading: true);
      await repository.deleteEmployee();
      yield AuthenticationState.unauthenticated();
    }
  }
}

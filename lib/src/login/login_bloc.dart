import 'dart:async';

import 'package:atrak/src/login/login.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/repository/data/beans/beans.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepository repository;

  LoginBloc({@required this.repository});

  LoginState get initialState {
    return LoginState.initial();
  }

  void onLoginButtonPressed({String username, String password}) {
    dispatch(
      LoginButtonPressed(
        username: username,
        password: password,
      ),
    );
  }

  void onLoginSuccess() {
    dispatch(LoggedIn());
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginState currentState,
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginState.loading();

      try {
        final Token token =
            await repository.getToken(event.username, event.password);
        //await repository.saveToken(token);
        yield LoginState.success(token);
      } catch (error) {
        yield LoginState.failure(error.toString());
      }
    }

    if (event is LoggedIn) {
      yield LoginState.initial();
    }
  }
}

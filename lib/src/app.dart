import 'package:atrak/src/authentication/authentication.dart';
import 'package:atrak/src/bloc_localization.dart';
import 'package:atrak/src/home/home_screen.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/login/login.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/splash/SplashScreen.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:atrak/src/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  final ApiRepository _repository;

  App(this._repository);

  @override
  _AppState createState() => _AppState(_repository);
}

class _AppState extends State<App> {
  final AuthenticationBloc _authenticationBloc;

  _AppState._(this._authenticationBloc) {
    _authenticationBloc.onAppStart();
  }

  factory _AppState(ApiRepository repository) {
    AuthenticationBloc authenticationBloc = AuthenticationBloc(repository);
    return _AppState._(authenticationBloc);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    widget._repository.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authenticationBloc,
      child: MaterialApp(
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            List<Widget> widgets = [];

            if (state.isAuthenticated) {
              print("Goto Home Page");
              widgets.add(HomeScreen());
              // widgets.add(AttendanceScreen());
            } else {
              print("Goto Login Page");
              widgets.add(LoginScreen());
              //widgets.add(DashboardScreen());
            }

            if (state.isInitializing) {
              //print("Show Splash Screen");
              widgets.add(SplashScreen());
            }

            if (state.isLoading) {
              widgets.add(LoadingSpinner());
            }

            return Stack(
              children: widgets,
            );
          },
        ),
        title: "Atrak",
        theme: AtrakTheme.theme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AtrakLocalizationsDelegate(),
          InheritedWidgetLocalizationsDelegate(),
        ],
      ),
    );
  }
}

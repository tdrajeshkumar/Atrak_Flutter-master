import 'package:atrak/src/authentication/authentication.dart';
import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/login/login.dart';
import 'package:atrak/src/utils/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  @override
  Widget build(BuildContext context) {
    _loginBloc = LoginBloc(repository: Injector.of(context).repository);
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: AtrakTheme.greyColor,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    AtrakLocalizations.of(context).logoText,
                    style: Theme.of(context).textTheme.title,
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: LoginForm(
                      authBloc: BlocProvider.of<AuthenticationBloc>(context),
                      loginBloc: _loginBloc,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    _loginBloc = null;
    super.dispose();
  }
}

import 'package:atrak/src/authentication/authentication.dart';
import 'package:atrak/src/localization.dart';
import 'package:atrak/src/login/login.dart';
import 'package:atrak/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc _loginBloc;
  final AuthenticationBloc _authBloc;

  LoginForm({
    Key key,
    @required LoginBloc loginBloc,
    @required AuthenticationBloc authBloc,
  })  : _loginBloc = loginBloc,
        _authBloc = authBloc,
        super(key: key);

  @override
  State<LoginForm> createState() {
    return LoginFormState(
      loginBloc: _loginBloc,
      authBloc: _authBloc,
    );
  }
}

class LoginFormState extends State<LoginForm> {
  final LoginBloc _loginBloc;
  final AuthenticationBloc _authBloc;

  static final _loginFormKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  LoginFormState({
    @required LoginBloc loginBloc,
    @required AuthenticationBloc authBloc,
  })  : _loginBloc = loginBloc,
        _authBloc = authBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState loginState,
      ) {
        if (_loginSucceeded(loginState)) {
          _authBloc.onLogin(token: loginState.token);
          _loginBloc.onLoginSuccess();
        }

        if (_loginFailed(loginState)) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${loginState.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return _form(loginState);
      },
    );
  }

  Widget _form(LoginState loginState) {
    return SingleChildScrollView(
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.subtitle,
                hintText: AtrakLocalizations.of(context).usernameHint,
                labelStyle: Theme.of(context).textTheme.subtitle,
                labelText: AtrakLocalizations.of(context).usernameLabel,
              ),
              controller: _usernameController,
              focusNode: _usernameFocus,
              maxLines: 1,
              onFieldSubmitted: (term) {
                _usernameFocus.unfocus();
                FocusScope.of(context).requestFocus(_passwordFocus);
              },
              validator: (val) {
                return FormUtils.validate(value: val, type: TYPES.text);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.subtitle,
                labelText: AtrakLocalizations.of(context).passwordLabel,
              ),
              controller: _passwordController,
              focusNode: _passwordFocus,
              maxLines: 1,
              obscureText: true,
              onFieldSubmitted: (term) {
                _passwordFocus.unfocus();
                _onLoginButtonPressed();
              },
              validator: (val) {
                return FormUtils.validate(value: val, type: TYPES.text);
              },
            ),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
              onPressed: loginState.isLoginButtonEnabled
                  ? _onLoginButtonPressed
                  : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  AtrakLocalizations.of(context).login,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: loginState.isLoading
                        ? CircularProgressIndicator()
                        : null),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool _loginSucceeded(LoginState state) =>
      state.token != null && state.token.accessToken.isNotEmpty;

  bool _loginFailed(LoginState state) => state.error.isNotEmpty;

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed() {
    final form = _loginFormKey.currentState;

    if (form.validate()) {
      FocusScope.of(context).requestFocus(new FocusNode());
      _loginBloc.onLoginButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

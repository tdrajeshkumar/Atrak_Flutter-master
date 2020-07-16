import 'package:atrak/src/dependency_injection.dart';
import 'package:atrak/src/repository/api_repository.dart';
import 'package:atrak/src/utils/simple_bloc_delegate.dart';
import 'package:atrak/src/app.dart';
import 'package:fimber/fimber.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main({@required ApiRepository repository}) {

Fimber.plantTree(DebugTree());

  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(Injector(
    repository: repository,
    child: App(repository),
  ));
}
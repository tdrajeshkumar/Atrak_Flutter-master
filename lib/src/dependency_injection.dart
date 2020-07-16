// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

// A poor man's DI. This should be replaced by a proper solution once they
// are more stable.
library dependency_injector;


import 'package:atrak/src/repository/api_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class Injector extends InheritedWidget {
  final ApiRepository repository;

  Injector({
    Key key,
    @required this.repository,
    @required Widget child,
  }) : super(key: key, child: child);

  static Injector of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(Injector);

  @override
  bool updateShouldNotify(Injector oldWidget) =>
      repository != oldWidget.repository;
}

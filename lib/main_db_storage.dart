import 'package:atrak/src/repository/repository.dart';
import 'package:flutter/services.dart';

import 'package:atrak/src/main.dart' as app;
import 'package:sqflite/sqflite.dart';

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    app.main(
      repository: ProdDataRepository(
        webClient: WebClient(),
        dbStorage: DbStorage(
          tag: "__db_storage__",
          dbPath: await getDatabasesPath(),
        ),
      ),
    );
  });
}

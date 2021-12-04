import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';

class DbProvider {
  static late Database _db;

  static DbProvider? _provider;

  DbProvider._();

  static Future<DbProvider> getInstance([String? path]) async {
    _provider ??= DbProvider._();

    await init(path);
    return _provider!;
  }

  static Future<void> init(String? path) async {
    if (path == null) {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      path = join(documentsDirectory.path, "data.db");
    }

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb
            .execute('CREATE TABLE Prices (secid TEXT PRIMARY KEY, price NUM)');
      },
    );
  }

  Future<void> insertPrices(List<List> data) async {
    for (List securiry in data) {
      await _db.transaction((txn) async {
        await txn.rawInsert('INSERT INTO prices(secid, price) VALUES (?, ?)', securiry);
      });
    }
  }

  Future<void> updatePrices(List<List> data) async {
    for (List securiry in data) {
      _db.rawUpdate('UPDATE prices SET price = ? WHERE secid = ?', securiry.reversed.toList());
    }
  }

  Future<List<Map<String, dynamic>>> getPrices() async {
    return _db.rawQuery('SELECT * FROM prices');
  }

  Future<void> dispose() async {
    await _db.close();
  }
}

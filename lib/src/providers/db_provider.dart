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

    await _init(path);
    return _provider!;
  }

  static Future<void> _init(String? path) async {
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
        newDb.execute(
            'CREATE TABLE Data (isin TEXT PRIMARY KEY, secid TEXT UNIQUE, secname TEXT, boardid TEXT, currencyid TEXT, lotvalue NUM DEFAULT 100)');
      },
    );
  }

  Future<void> _insert(String query, List<List> data) async {
    for (List securiry in data) {
      await _db.transaction((txn) async {
        await txn.rawInsert(query, securiry);
      });
    }
  }

  Future<void> _update(String query, List<List> data) async {
    for (List securiry in data) {
      // List<dynamic> reversed = [securiry.last] + securiry.sublist(0, securiry.length-1);
      List<dynamic> reversed = securiry.sublist(1) + <dynamic>[securiry[0]];

      await _db.rawUpdate(query, reversed);
    }
  }

  Future<void> insertPrices(List<List> data) async {
    const String query = 'INSERT INTO prices(secid, price) VALUES (?, ?)';
    await _insert(query, data);
  }

  Future<void> updatePrices(List<List> data) async {
    const String query = 'UPDATE prices SET price = ? WHERE secid = ?';
    await _update(query, data);
  }

  Future<List<Map<String, dynamic>>> getPrices() async {
    return await _db.rawQuery('SELECT * FROM prices');
  }

  Future<void> insertData(List<List> data) async {
    String lotval = data[0].length == 6 ? ', lotvalue' : '';
    String qMark = data[0].length == 6 ? ', ?' : '';
    String query =
        'INSERT INTO Data(isin, secid, secname, boardid, currencyid$lotval) VALUES (?, ?, ?, ?, ?$qMark)';
    await _insert(query, data);
  }

  Future<void> updateData(List<List> data) async {
    String lotval = data[0].length == 6 ? ', lotvalue = ?' : '';
    String query =
        'UPDATE Data SET secid = ?, secname = ?, boardid = ?, currencyid = ?$lotval WHERE isin = ?';
    await _update(query, data);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    return await _db.rawQuery('SELECT * FROM Data');
  }

  Future<void> dispose() async {
    await _db.close();
  }
}

import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import '../dto/security_price.dart';
import '../dto/security_data.dart';

class DbProvider {
  static late Database _db; // Поле, в котором хранится сама база данных

  static DbProvider? _provider;

  DbProvider._internal();

  static Future<DbProvider> getInstance([String? path]) async {
    _provider ??= DbProvider._internal(); // Создаём объект провайдера

    await _initDB(path); // Инициализируем базу данных
    return _provider!;
  }

  static Future<void> _initDB(String? path) async {
    // Параметр path нужен для поддержки unit тестов
    if (path == null) {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      path = join(documentsDirectory.path, "data.db");
    }

    // Открываем БД, создаём нужные таблицы, если они отсутствуют
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb
            .execute('CREATE TABLE prices (secid TEXT PRIMARY KEY, price NUM)');
        newDb.execute(
            'CREATE TABLE data (isin TEXT PRIMARY KEY, secid TEXT UNIQUE, secname TEXT, boardid TEXT, currencyid TEXT, lotvalue NUM)');
      },
    );
  }

  Future<void> insertPrices(List<SecPrice> data) async {
    const table = 'prices';
    for (SecPrice security in data) {
      await _db.transaction((txn) => txn.insert(table, security.toJSON()));
    }
  }

  Future<void> updatePrices(List<SecPrice> data) async {
    const table = 'prices';
    for (SecPrice security in data) {
      await _db.transaction(
        (txn) => txn.update(
          table,
          security.toJSON(),
          where: 'secid = ?',
          whereArgs: [security.secid],
        ),
      );
    }
  }

  Future<List<SecPrice>> getPrices() async {
    final query = await _db.rawQuery('SELECT * FROM prices');
    return query.map((e) => SecPrice.fromJSON(e)).toList();
  }

  Future<void> insertData(List<SecData> data) async {
    const table = 'data';
    for (SecData security in data) {
      await _db.transaction((txn) => txn.insert(table, security.toJSON()));
    }
  }

  Future<void> updateData(List<SecData> data) async {
    const table = 'data';
    for (var security in data) {
      await _db.transaction(
        (txn) => txn.update(
          table,
          security.toJSON(),
          where: 'isin = ?',
          whereArgs: [security.isin],
        ),
      );
    }
  }

  Future<List<SecData>> getData() async {
    List<Map<String, dynamic>> query = await _db.rawQuery('SELECT * FROM Data');
    return query.map((e) => SecData.fromJSON(e)).toList();
  }

  Future<void> dispose() async {
    await _db.close();
  }
}

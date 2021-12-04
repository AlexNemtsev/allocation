import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:allocation/src/providers/db_data_provider.dart';
import '../test_data.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  test('Writing/reading prices in/from db', () async {
    DbDataProvider dataProvider = await DbDataProvider.getInstance(inMemoryDatabasePath);
    await dataProvider.insertToPrices(securitiesPrices,);

    List<Map<String, dynamic>> dbQuery = await dataProvider.getPrices();
    
    expect(dbQuery, equals(dbSecuritiesPrices));

    await dataProvider.dispose();
  });
}

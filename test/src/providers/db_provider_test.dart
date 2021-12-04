import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:allocation/src/providers/db_provider.dart';
import '../test_data.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  test('Writing/reading prices in/from db', () async {
    DbProvider dbProvider =
        await DbProvider.getInstance(inMemoryDatabasePath);
    await dbProvider.insertPrices(secPrices);

    List<Map<String, dynamic>> dbQuery = await dbProvider.getPrices();

    expect(dbQuery, equals(dbSecPrices));

    await dbProvider.dispose();
  });

  test('Updating prices', () async {
    DbProvider dbProvider =
        await DbProvider.getInstance(inMemoryDatabasePath);

    await dbProvider.insertPrices(secPrices);
    await dbProvider.updatePrices(secPricesUpdated);
    
    List<Map<String, dynamic>> dbQuery = await dbProvider.getPrices();
    
    expect(dbQuery, equals(dbSecPricesUpdated));
    dbProvider.dispose();
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:allocation/src/providers/db_provider.dart';
import 'package:allocation/src/dto/security_price.dart';
import 'package:allocation/src/dto/security_data.dart';
import '../test_data.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  test('Writing/reading prices in/from db', () async {
    DbProvider dbProvider = await DbProvider.getInstance(inMemoryDatabasePath);
    await dbProvider.insertPrices(secPrices);

    List<SecPrice> dbQuery = await dbProvider.getPrices();

    expect(dbQuery, equals(secPrices));

    await dbProvider.dispose();
  });

  test('Updating prices', () async {
    DbProvider dbProvider = await DbProvider.getInstance(inMemoryDatabasePath);

    await dbProvider.insertPrices(secPrices);
    await dbProvider.updatePrices(secPricesUpdated);

    List<SecPrice> dbQuery = await dbProvider.getPrices();

    expect(dbQuery, equals(dbSecPricesUpdated));
    dbProvider.dispose();
  });

  test('Writing/reading securities data in/from db', () async {
    DbProvider dbProvider = await DbProvider.getInstance(inMemoryDatabasePath);
    await dbProvider.insertData(sharesData);

    List<SecData> dbQuery = await dbProvider.getData();

    expect(dbQuery, equals(sharesData));

    await dbProvider.dispose();
  });

  test('Updating table data', () async {
    DbProvider dbProvider = await DbProvider.getInstance(inMemoryDatabasePath);
    await dbProvider.insertData(sharesData);
    await dbProvider.updateData(sharesDataUpd);

    List<SecData> dbQuery = await dbProvider.getData();

    expect(dbQuery, equals(dbSharesDataUpd));

    await dbProvider.dispose();
  });

//   test('Empty db returns empty list', () async {
//     DbProvider dbProvider = await DbProvider.getInstance(inMemoryDatabasePath);

//     List<Map<String, dynamic>> dbQuery = await dbProvider.getData();

//     expect(dbQuery, equals(<Map<String, dynamic>>[]));

//     await dbProvider.dispose();
//   });
}

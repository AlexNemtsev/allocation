import 'package:allocation/src/db_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'db_provider_mock.dart';
import 'test_data.dart';

void main() {
  test('Get AFLT price', () {
    String secid = 'AFLT';
    LocalStorageProvider dbProviderMock = DbProviderMock();
    
    double price = dbProviderMock.getPrice(secid);
    
    expect(price, equals(securitiesPrices[secid]));
  });
}
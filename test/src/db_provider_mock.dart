import 'test_data.dart';
import 'package:allocation/src/db_provider.dart';

class DbProviderMock implements LocalStorageProvider {
  @override
  double getPrice(String secid) {
    return securitiesPrices[secid]!;
  }
}
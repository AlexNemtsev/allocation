import 'package:http/http.dart';
import 'dart:convert';
import '../dto/security_data.dart';
import '../dto/security_price.dart';

//TODO: Передалать в Singleton?
class NetworkProvider {
  NetworkProvider([Client? client]) {
    client ??= Client();
    _client = client;
  }
  late Client _client;

  final Map<String, String> _boardIds = {
    "SMAL": 'shares',
    "SPEQ": 'shares',
    "TQBR": 'shares',
    "TQDP": 'shares',
    "TQFD": 'shares',
    "TQFE": 'shares',
    "TQIF": 'shares',
    "TQPD": 'shares',
    "TQPE": 'shares',
    "TQPI": 'shares',
    "TQTD": 'shares',
    "TQTE": 'shares',
    "TQTF": 'shares',
    "AUCT": 'bonds',
    "PACT": 'bonds',
    "SPOB": 'bonds',
    "TQCB": 'bonds',
    "TQDB": 'bonds',
    "TQDU": 'bonds',
    "TQIR": 'bonds',
    "TQIU": 'bonds',
    "TQOB": 'bonds',
    "TQOD": 'bonds',
    "TQOE": 'bonds',
    "TQRD": 'bonds',
    "TQUD": 'bonds'
  };

  Future<List<SecurityData>> fetchData(String boardId) async {
    final String market = _boardIds[boardId]!;

    final url = Uri(
      scheme: 'https',
      host: 'iss.moex.com',
      path: 'iss/engines/stock/markets/$market/boards/$boardId/securities.json',
      queryParameters: {
        'iss.meta': 'off',
        'iss.only': 'securities',
        'iss.json': 'extended',
        'securities.columns': 'ISIN,SECID,SECNAME,BOARDID,CURRENCYID,LOTVALUE'
      },
    );

    final Response response = await _client.get(url);

    final decoded = _decode(response);

    List<dynamic> dataJSON = decoded[1]['securities'];
    List<SecurityData> data = dataJSON
        .map((e) => SecurityData.fromJSON(e as Map<String, dynamic>))
        .toList();

    return data;
  }

  Future<List<SecurityPrice>> fetchPrices(String boardId) async {
    final String market = _boardIds[boardId]!;
    final url = Uri(
      scheme: 'https',
      host: 'iss.moex.com',
      path: 'iss/engines/stock/markets/$market/boards/$boardId/securities.json',
      queryParameters: {
        'iss.meta': 'off',
        'iss.only': 'marketdata',
        'iss.json': 'extended',
        'marketdata.columns': 'SECID,LAST'
      },
    );
    final response = await _client.get(url);

    final decoded = _decode(response);

    List<dynamic> pricesJSON = decoded[1]['marketdata'];
    List<SecurityPrice> secidPrices = pricesJSON
        .map((e) => SecurityPrice.fromJSON(e as Map<String, dynamic>))
        .toList();

    return secidPrices;
  }

  dynamic _decode(Response response) {
    if (response.statusCode != 200) {
      throw Exception('An error has occured');
    }

    return json.decode(response.body);
  }
}

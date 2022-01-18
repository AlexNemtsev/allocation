import 'package:http/http.dart';
import 'dart:convert';

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

  Future<List<dynamic>> fetchData(String boardId) async {
    final String market = _boardIds[boardId]!;
    final String lotVal = market == 'bonds' ? ',LOTVALUE' : '';
    
    final Response response = await _client.get(Uri.parse(
        'https://iss.moex.com/iss/engines/stock/markets/$market/boards/$boardId/securities.json?iss.meta=off&iss.only=securities&securities.columns=ISIN,SECID,SECNAME,BOARDID,CURRENCYID$lotVal'));

    final decoded = _decode(response);

    List<dynamic> data = decoded['securities']['data'];

    return data;
  }

  Future<List<dynamic>> fetchPrices(String boardId) async {
    final String market = _boardIds[boardId]!;
    final Response response = await _client.get(Uri.parse(
        'https://iss.moex.com/iss/engines/stock/markets/$market/boards/$boardId/securities.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST'));

    final decoded = _decode(response);

    List<dynamic> secidPrice = decoded["marketdata"]["data"];

    return secidPrice;
  }

  dynamic _decode(Response response) {
    if (response.statusCode != 200) {
      throw Exception('An error has occured');
    }

    return json.decode(response.body);
  }
}

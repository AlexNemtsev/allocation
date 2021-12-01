import 'package:http/http.dart';
import 'dart:convert';

// Этот класс должен выполнять две функции
// TODO: Возврат таблиц securities
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

  Future<Map<String, List<dynamic>>> fetchData(String boardId) async {
    final String market = _boardIds[boardId]!;
    final String lotVal = market == 'bonds' ? ',LOTVALUE' : '';

    final Response response = await _client.get(Uri.parse('https://iss.moex.com/iss/engines/stock/markets/$market/boards/$boardId/securities.json?iss.meta=off&iss.only=securities&securities.columns=SECID,SECNAME,BOARDID,ISIN$lotVal'));

    final decoded = _decode(response);

    Map<String, List<dynamic>> data = {};

    for (List<dynamic> item in decoded['securities']['data']) {
      data[item[0]] = item.sublist(1);
    }

    return data;
  }

  Future<Map<String, double>> fetchPrices(String boardId) async {
    final String market = _boardIds[boardId]!;
    final Response response = await _client.get(Uri.parse('https://iss.moex.com/iss/engines/stock/markets/$market/boards/$boardId/securities.json?iss.meta=off&iss.only=marketdata&marketdata.columns=SECID,LAST'));

    final decoded = _decode(response);

    Map<String, double> secidPrice = {};

    for (List<dynamic> item in decoded["marketdata"]["data"]) {
      secidPrice[item[0]] = item[1].toDouble();
      // В цену может прилететь целое число, поэтому здесь нужно явное преобразование к double
    }

    return secidPrice;
  }

  dynamic _decode(Response response) {
    if (response.statusCode != 200) {
      throw Exception('An error has occured');
    }

    return json.decode(response.body);
  }
}

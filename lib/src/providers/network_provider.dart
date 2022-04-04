import 'package:http/http.dart';
import 'dart:convert';
import '../dto/security_data.dart';
import '../dto/security_price.dart';

class NetworkProvider {
  Client _client = Client();

  NetworkProvider._internal();

  static final NetworkProvider _instance = NetworkProvider._internal();

  factory NetworkProvider([Client? mockClient]) {
    if (mockClient != null) {
      _instance._client = mockClient;
    }
    return _instance;
  }

  Future<List<SecurityData>> fetchData(String boardID) async {
    final url = _getUrl(boardID, 'securities', 'ISIN,SECID,SECNAME,BOARDID,CURRENCYID,LOTVALUE');
    final Response response = await _client.get(url);

    final decoded = _decode(response);

    List<dynamic> dataJSON = decoded[1]['securities'];
    List<SecurityData> data = dataJSON
        .map((e) => SecurityData.fromJSON(e as Map<String, dynamic>))
        .toList();

    return data;
  }

  Future<List<SecurityPrice>> fetchPrices(String boardID) async {
    final url = _getUrl(boardID, 'marketdata', 'SECID,LAST');
    final response = await _client.get(url);

    final decoded = _decode(response);

    List<dynamic> pricesJSON = decoded[1]['marketdata'];
    List<SecurityPrice> secidPrices = pricesJSON
        .map((e) => SecurityPrice.fromJSON(e as Map<String, dynamic>))
        .toList();

    return secidPrices;
  }

  Uri _getUrl(String boardID, String issOnlyParam, String columns) {

    // TODO: Всю эту шляпу можно тянуть с сервера и хранить в б/д
    // shares https://iss.moex.com/iss/engines/stock/markets/shares/boards?iss.meta=off&boards.columns=boardid
    final boardIds = {
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

    final String market = boardIds[boardID]!;
    final url = Uri(
      scheme: 'https',
      host: 'iss.moex.com',
      path: 'iss/engines/stock/markets/$market/boards/$boardID/securities.json',
      queryParameters: {
        'iss.meta': 'off',
        'iss.only': issOnlyParam,
        'iss.json': 'extended',
        '$issOnlyParam.columns': columns
      },
    );
    return url;
  }

  dynamic _decode(Response response) {
    if (response.statusCode != 200) {
      throw Exception('An error has occured');
    }

    return json.decode(response.body);
  }
}

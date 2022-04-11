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

  Future<List<SecData>> fetchData(String boardID) async {
    final url = _getUrl(boardID, 'securities',
        'ISIN,SECID,SECNAME,BOARDID,CURRENCYID,LOTVALUE');
    final Response response = await _client.get(url);

    final decoded = _decode(response);

    List<dynamic> dataJSON = decoded[1]['securities'];
    List<SecData> data = dataJSON
        .map((e) => _SecData.fromJSON(e as Map<String, dynamic>))
        .toList()
        .map((e) => e.copyWith(
            secid: e.secid,
            isin: e.isin,
            boardid: e.boardid,
            lotvalue: e.lotvalue,
            secname: e.secname,
            currencyid: e.currencyid))
        .toList();

    return data;
  }

  Future<List<SecPrice>> fetchPrices(String boardID) async {
    final url = _getUrl(boardID, 'marketdata', 'SECID,LAST');
    final response = await _client.get(url);

    final decoded = _decode(response);

    List<dynamic> pricesJSON = decoded[1]['marketdata'];
    List<SecPrice> secidPrices = pricesJSON
        .map((e) => _SecPrice.fromJSON(e as Map<String, dynamic>))
        .toList()
        .map((e) => e.copyWith(secid: e.secid, price: e.price))
        .toList();

    return secidPrices;
  }

  Uri _getUrl(String boardID, String issOnlyParam, String columns) {
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

class _SecPrice extends SecPrice {
  _SecPrice(String secid, double? price) : super(secid, price);

  @override
  factory _SecPrice.fromJSON(Map<String, dynamic> json) => _SecPrice(
        json['SECID'] as String,
        (json['LAST'] as num?)?.toDouble(),
      );
}

class _SecData extends SecData {
  _SecData(String isin, String secid, String secName, String boardID,
      String currencyID, double lotValue)
      : super(isin, secid, secName, boardID, currencyID, lotValue);

  @override
  factory _SecData.fromJSON(Map<String, dynamic> json) => _SecData(
        json['ISIN'] as String,
        json['SECID'] as String,
        json['SECNAME'] as String,
        json['BOARDID'] as String,
        json['CURRENCYID'] as String,
        (json['LOTVALUE'] as num?)?.toDouble() ?? 100,
      );
}

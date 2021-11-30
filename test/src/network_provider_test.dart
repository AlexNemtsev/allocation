import 'dart:convert';
import 'dart:io';
import 'package:allocation/src/network_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'test_data.dart';

void main() {
  // TODO: Добавить тесты на коды 404, 502 и т.п.
  test('fetchPrices recives prices of securities using board_id', () async {
    String boardId = 'TQBR';
    final client = MockClient((request) async {
      return Response(json.encode(MOEXSharesPrices), 200);
    });

    NetworkProvider networkProvider = NetworkProvider(client);

    Map<String, double> prices = await networkProvider.fetchPrices(boardId);

    expect(prices, equals(securitiesPrices));
  });

  test('fetchSharesData recives secid, name, boardid, isin', () async {
    String boardId = 'TQBR';
    final client = MockClient((request) async {
      return Response(json.encode(MOEXSharesData), 200, headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });
    });
    NetworkProvider networkProvider = NetworkProvider(client);

    Map<String, List<dynamic>> data =
        await networkProvider.fetchSharesData(boardId);

    expect(data, equals(sharesData));
  });


}

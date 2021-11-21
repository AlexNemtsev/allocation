import 'dart:convert';
import 'package:allocation/src/network_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'test_data.dart';

void main() {
  test('Fetch board id from Mock of MOEX', () async {
    String secid = boardIds.keys.toList()[0];
    final client = MockClient((request) async {
      return Response(json.encode(sharesBoardIds), 200);
    });

    NetworkProvider networkProvider = NetworkProvider(client);

    String boardId = await networkProvider.getBoardId(secid);

    expect(boardId, equals(boardIds[secid]));
  });

  test('Get board ids of all types of securities', () async {
    List<String> secids = boardIds.keys.toList();
    final client = Client();
    NetworkProvider networkProvider = NetworkProvider(client);
    List<String> ids =[];

    for (var secid in secids) {
      String boardId = await networkProvider.getBoardId(secid);
      ids.add(boardId);
    }

    expect(ids, equals(boardIds.values.toList()));
  });
}

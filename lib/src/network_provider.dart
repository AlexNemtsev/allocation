import 'package:http/http.dart';
import 'dart:convert';

class NetworkProvider {
  NetworkProvider(this._client);
  final Client _client;

  Future<String> getBoardId(String secid) async {
    final response = await _client.get(Uri.parse(
        'https://iss.moex.com/iss/securities.json?q=$secid/$secid&iss.meta=off&securities.columns=secid,primary_boardid'));
    final decoded = json.decode(response.body);
    //TODO: сделать поиск по isin
    final data = decoded["securities"]["data"];

    String boardId = '';
    for (var item in data) {
      if (item[0] == secid) {
        if (item[1] == 'SOTC') {
          boardId = 'FQBR';
        } else {
          boardId = item[1];
        }
        break;
      }
    }

    if (boardId == '') {
      for (var item in data) {
        if(item[0] == '$secid-RM') {
          boardId = item[1];
          break;
        }
      }
    }
    return boardId;
  }
}

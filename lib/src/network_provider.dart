import 'package:http/http.dart';
import 'dart:convert';

class NetworkProvider {
  NetworkProvider(this._client);
  Client _client;

  Future<String> getBoardId(String secid) async {
    final response = await _client.get(Uri.parse(
        'https://iss.moex.com/iss/securities.json?q=$secid/$secid&iss.meta=off&securities.columns=secid,primary_boardid'));
    final decoded = json.decode(response.body);
    //TODO: Обобщить для иностранных акций
    final data = decoded["securities"]["data"];

    String boardId = '';
    for (var item in data) {
      if(item[0] == secid) {
        boardId = item[1];
        break;
      }
    }
    return boardId;
  }
}

import 'package:first_app/model/Player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?lat=28.4595&lon=77.0266&appid=e77e558e80f3b53249ddb36c055b14f9
  //https://api.openweathermap.org/data/2.5/weather?q=Gurgaon&appid=e77e558e80f3b53249ddb36c055b14f9
  final String authority = 'api.cricapi.com';
  final String playerPath = 'v1/matches';
  final String apiKey = 'e989aebb-098c-4511-ab0c-506b54478154';

  Future<Player> getPlayerInfo(String name) async {
    Map<String, dynamic> parameter = {
      // 'lat': latitude,
      // 'lon': longitude,
      'apikey': apiKey,
      'offset': '0',
      'search': name
    };

    Uri uri = Uri.https(authority, playerPath, parameter);
    http.Response result = await http.get(uri);
    // print(result.body);
    Map<String, dynamic> data = json.decode(result.body);
    print("Check 1");
    Player cricketData = Player.fromJson(data);
    print("Check 2");
    // print(result.body);
    //return result.body;
    // print(data);
    return cricketData;
  }

  Future<Player> getMatchListInfo() async {
    Map<String, dynamic> parameter = {
      // 'lat': latitude,
      // 'lon': longitude,
      'apikey': apiKey,
      'offset': '0',
    };

    Uri uri = Uri.https(authority, playerPath, parameter);
    http.Response result = await http.get(uri);
    // print(result.body);
    Map<String, dynamic> data = json.decode(result.body);
    Player cricketData = Player.fromJson(data);
    // print(result.body);
    //return result.body;
    // print(data);
    return cricketData;
  }

  Future<Player> getMatchInfo(String id) async {
    Map<String, dynamic> parameter = {
      // 'lat': latitude,
      // 'lon': longitude,
      'apikey': apiKey,
      'offset': '0',
      'id': id
    };

    Uri uri = Uri.https(authority, playerPath, parameter);
    http.Response result = await http.get(uri);
    // print(result.body);
    Map<String, dynamic> data = json.decode(result.body);
    Player cricketData = Player.fromJson(data);
    // print(result.body);
    //return result.body;
    // print(data);
    return cricketData;
  }
}

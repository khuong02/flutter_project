import 'dart:convert';

import 'package:do_an_di_dong/Consts/cosntants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LeaderBoardApi {
  playLeaderBoard(Map<String, String> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    final response = await http.post(
      Uri.parse(Constants.urlApi + "leaderboard"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token,
      },
      body: jsonEncode(data),
    );

    return response;
  }
}

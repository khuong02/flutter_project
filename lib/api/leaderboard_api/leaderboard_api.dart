import 'dart:convert';

import 'package:do_an_di_dong/Consts/cosntants.dart';
import 'package:do_an_di_dong/models/leaderboard_obj.dart';
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

  static Future<List<LeaderBoardObj>> getLeaderBoard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    List<LeaderBoardObj> users = [];

    final response = await http.get(
      Uri.parse(Constants.urlApi + "leaderboard"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token,
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["data"];

      for (var user in data) {
        users.add(LeaderBoardObj(
          user["user_id"],
          user["time"],
          user["quantity"],
          user["score"],
          user["username"],
          user["email"],
          user["avatar"],
        ));
      }

      return users;
    }

    throw Exception("Fail to get leaderboard");
  }
}

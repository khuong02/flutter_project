import 'dart:convert';
import 'package:do_an_di_dong/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  final String _url = "https://8b8e-116-110-42-127.ap.ngrok.io/api/";
  //POST
  register(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse(_url + "register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  //POST
  verifyToken(String idToken) async {
    final response = await http.post(
      Uri.parse(_url + "verify"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': idToken,
      },
    );
    return response;
  }

  //GET
  Future<User> getUser() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String token = await perfs.getString('token')!;

    final response = await http.get(
      Uri.parse(_url + "users"),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception("Fail to get user profile");
  }

  //POST
  login(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse(_url + "login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  //GET
  callQuestions(quizid, diffid) async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String token = await perfs.getString('token')!;

    String uri = _url +
        "questions?quizz_id=" +
        quizid.toString() +
        "&difficulty_id=" +
        diffid.toString();

    var response = await http.get(
      Uri.parse(uri),
      headers: <String, String>{
        "Authorization": 'Bearer ' + token,
      },
    );

    return response;
  }
}

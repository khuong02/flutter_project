import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url =
      "https://b530-2403-e200-16b-4536-f92f-5790-cb70-1866.ap.ngrok.io/api/";

  register(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse(_url + "register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to register");
    }
  }

  verifyToken(String idToken) async {
    final response = await http.post(
      Uri.parse(_url + "verify"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': idToken,
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Fail to veriyfy token");
    }
  }

  getUser(String token) async {
    final response = await http.get(
      Uri.parse(_url + "users"),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception("Fail to get user profile");
  }
}

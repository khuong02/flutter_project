import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Consts/cosntants.dart';

class AuthenticationApi {
  //POST
  register(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse(Constants.urlApi + "register"),
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
      Uri.parse(Constants.urlApi + "verify"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': idToken,
      },
    );
    return response;
  }

  //POST
  login(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse(Constants.urlApi + "login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return response;
  }
}

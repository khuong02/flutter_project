import 'dart:convert';

import 'package:do_an_di_dong/Widgets/auth/signin/forgot_password_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Consts/cosntants.dart';
import '../../screens/auth/authentication_view.dart';

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

  //forgot pass
  ForgotPassword(Map<String, dynamic> data) async {
    final rep = await http.post(
      Uri.parse(Constants.urlApi + 'reset-password-request'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return rep;
  }

  static onSignOut(context) async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    await pref.remove('cost');
    Navigator.pop(context);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const AuthenticationView()),
        (route) => false);
  }
}

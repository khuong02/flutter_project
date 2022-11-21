import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Consts/cosntants.dart';
import '../../models/user.dart';

class UserApi {
  //GET
  Future<User> getUser() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String token = await perfs.getString('token')!;

    final response = await http.get(
      Uri.parse(Constants.urlApi + "users"),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    throw Exception("Fail to get user profile");
  }
}

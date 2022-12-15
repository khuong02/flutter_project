import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Consts/cosntants.dart';
import '../../models/friend_obj.dart';

class FriendApi {
  Future<List<FriendObj>> getFriendList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;

    final response = await http.get(
      Uri.parse(Constants.urlApi + "get-list-friend"),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );

    List<FriendObj> myFriends = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["listUser"];
      for (var friend in data) {
        myFriends.add(FriendObj(
          friend["id"],
          friend["avatar"],
          friend["name"],
          friend["email"],
          friend["status"],
        ));
      }
    }
    return myFriends;
  }

  Future<List<FriendObj>> getFriendListPending() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;

    final response = await http.get(
      Uri.parse(Constants.urlApi + "get-list-pending"),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );

    List<FriendObj> listPending = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["listUser"];
      for (var friend in data) {
        listPending.add(FriendObj(
          friend["id"],
          friend["avatar"],
          friend["name"],
          friend["email"],
          friend["status"],
        ));
      }
    }
    return listPending;
  }

  Future<List<FriendObj>> getStrangerList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;

    final response = await http.get(
      Uri.parse(Constants.urlApi + "get-list-stranger"),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );

    List<FriendObj> listStranger = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["listusers"];
      for (var friend in data) {
        listStranger.add(FriendObj(
          friend["id"],
          friend["avatar"],
          friend["name"],
          friend["email"],
          friend["status"],
        ));
      }
    }
    return listStranger;
  }

  unfriend(Map<String, int> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;

    final response = await http.post(
      Uri.parse(Constants.urlApi + "unFriend"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token,
      },
      body: jsonEncode(data),
    );
    return response;
  }

  addFriend(Map<String, int> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;

    final response = await http.post(
      Uri.parse(Constants.urlApi + "addFriend"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token,
      },
      body: jsonEncode(data),
    );
    return response;
  }

  responseFriend(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;

    final response = await http.post(
      Uri.parse(Constants.urlApi + "respond2invitation"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token,
      },
      body: jsonEncode(data),
    );
    return response;
  }
}

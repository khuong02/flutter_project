import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Consts/cosntants.dart';
import 'package:cloudinary/cloudinary.dart';
import '../../models/user.dart';

class UserApi {
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  //GET
  Future<User> getUser() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String token = perfs.getString('token')!;

    final response = await http.get(
      Uri.parse(Constants.urlApi + "users"),
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body)["data"]);
    }
    throw Exception("Fail to get user profile");
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<String> uploadImage(File image) async {
    final cloudinary = Cloudinary.signedConfig(
      apiKey: Constants.apiKey,
      apiSecret: Constants.apiSecret,
      cloudName: Constants.cloudName,
    );
    final response = await cloudinary.upload(
      file: image.path,
      fileBytes: image.readAsBytesSync(),
      resourceType: CloudinaryResourceType.image,
      folder: "flutter",
      fileName: getRandomString(20),
    );

    if (response.isSuccessful) {
      return response.secureUrl!;
    }
    throw Exception('Failed to upload image');
  }

  updateProfile(Map<String, String> data, File? image) async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String token = perfs.getString('token')!;
    if (image != null) {
      String imageUrl = await uploadImage(image);
      data['avatar'] = imageUrl;
    }

    final response = await http.post(
      Uri.parse(Constants.urlApi + "users"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token,
      },
      body: jsonEncode(data),
    );
    return response;
  }

  //POST
  addCredit(int cost) async{
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String token = perfs.getString('token')!;
    Map<String, int> data = {
      "cost": cost,
    };

    final response = await http.post(
      Uri.parse(Constants.urlApi + "users/buycredit"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + token,
      },
      body: jsonEncode(data),
    );

    return response;
  }
}

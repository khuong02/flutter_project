import 'dart:convert';
import 'dart:ui';

import 'package:do_an_di_dong/models/topic_obj.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Consts/cosntants.dart';
import '../../Utilities/card/card_details.dart';

class TopicApi {
  List<ListDetail> parseListTopic(dynamic data){
    List<ListDetail> listTopic = [];
    int index = 0;

    for(var item in data){
      ListDetail detail = ListDetail(
        id: item["id"],
        title: item["name"],
        iconAssetName: cardDetailList[index].iconAssetName,
        gradients: cardDetailList[index].gradients,
        shadowColor: cardDetailList[index].shadowColor,
        iconTag: cardDetailList[index].iconTag,
        category: cardDetailList[index].category,
        textColor: cardDetailList[index].textColor,
      );
      index++;

      listTopic.add(detail);
    }

    return listTopic;
  }

  //GET
  static Future<List<ListDetail>> getTopic() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String token = perfs.getString('token')!;

    String uri = Constants.urlApi + "quizz?page=1&limit=10";

    var response = await http.get(
      Uri.parse(uri),
      headers: <String, String>{
        "Authorization": 'Bearer ' + token,
      },
    );

    return TopicApi().parseListTopic(jsonDecode(response.body)["data"]);
  }
}

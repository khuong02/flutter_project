import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Consts/cosntants.dart';

class QuestionApi {
  //GET
  callQuestions(quizid, diffid) async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String token = perfs.getString('token')!;

    String uri = Constants.urlApi +
        "questions?quizz_id=" +
        quizid.toString() +
        "&difficulty_id=" +
        diffid.toString() +
        "&page=1" +
        "&limit=10";

    var response = await http.get(
      Uri.parse(uri),
      headers: <String, String>{
        "Authorization": 'Bearer ' + token,
      },
    );

    return response;
  }

  callQuestionsRankMode() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String token = perfs.getString('token')!;

    String uri = Constants.urlApi + "questionsrank?page=1";

    var response = await http.get(
      Uri.parse(uri),
      headers: <String, String>{
        "Authorization": 'Bearer ' + token,
      },
    );

    return response;
  }
}

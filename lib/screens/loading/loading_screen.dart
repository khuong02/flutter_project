import 'dart:async';
import 'dart:convert';
import 'package:do_an_di_dong/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../question/question_screen.dart';
import '../../Utilities/card/card_details.dart';
import '../../models/networking.dart';
import '../../Consts/cosntants.dart';

class LoadingScreen extends StatefulWidget {
  final int index;
  final int selectedDif;
  const LoadingScreen(
      {Key? key, required this.index, required this.selectedDif})
      : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(milliseconds: 500), () {
        getQuestions();
      });
    });
  }

  Future<bool> checkConnectivity() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  void getQuestions() async {
    bool result = await checkConnectivity();
    if (result) {
      Response data =
          await QuestionApi().callQuestions(widget.index, widget.selectedDif);

      if (data.statusCode == 200) {
        var body = jsonDecode(data.body);

        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => QuestionScreen(
                  questionData: body['data'],
                  categoryIndex: widget.index,
                )),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('No internet connection. Try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: cardDetailList[widget.index].gradients,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: LoadingAnimationWidget.dotsTriangle(
            color: const Color(0xFFF5D973),
            size: 100,
          ),
        ),
      ),
    );
  }
}

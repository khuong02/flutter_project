import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/Widgets/close_button.dart';
import 'package:do_an_di_dong/api/leaderboard_api/leaderboard_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/theme_provider.dart';
import '../../Widgets/history/history_widget.dart';
import '../../features/card/add_cost.dart';
import '../../models/history_obj.dart';

class HistoryScreen extends StatefulWidget{
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Widget> getListCardHistory(List<HistoryObject> histories){
    List<Widget> listCard = [];

    for(HistoryObject item in histories){
      listCard.add(HistoryWidget(history: item));
    }

    return listCard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).getThemeMode ? MyColor.leaderboardBackGroundColor : Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: FutureBuilder<List<HistoryObject>>(
          future: LeaderBoardApi.getHistory(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              var data = snapshot.data!;

              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomCloseButton(
                        color: Provider.of<ThemeProvider>(context).getThemeMode
                            ? Colors.white
                            : Colors.black,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'History',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color(0xfff85e7d),
                      ),
                    ),
                  ),
                  HistoryTitle(),
                  ...getListCardHistory(data),
                ],
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
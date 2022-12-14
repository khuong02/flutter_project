import 'package:do_an_di_dong/Providers/theme_provider.dart';
import 'package:do_an_di_dong/features/card/add_cost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Consts/my_color/my_color.dart';
import '../../Widgets/close_button.dart';

class AddCost extends StatefulWidget {
  @override
  State<AddCost> createState() => _AddCostState();
}

class _AddCostState extends State<AddCost> {

  List<Widget> getListCardMoney(){
    List<Widget> listCard = [];
    listCard.add(AddCostWidget(img: "assets/images/money.png", cost: 10000, money: 1000,));
    listCard.add(AddCostWidget(img: "assets/images/profits.png", cost: 50000, money: 2000));
    listCard.add(AddCostWidget(img: "assets/images/money-bag (1).png", cost: 100000, money: 5000));
    return listCard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).getThemeMode ? MyColor.leaderboardBackGroundColor : Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCloseButton(color: Provider.of<ThemeProvider>(context).getThemeMode ? Colors.white : Colors.black,),
              ],
            ),
            ...getListCardMoney(),
          ],
        ),
      ),
    );
  }
}

import 'package:do_an_di_dong/features/card/add_cost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Widgets/close_button.dart';

class AddCost extends StatefulWidget {
  @override
  State<AddCost> createState() => _AddCostState();
}

class _AddCostState extends State<AddCost> {
  int index = -1;

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                CustomCloseButton(color: Colors.black),
              ],
            ),
            ...getListCardMoney(),
          ],
        ),
      ),
    );
  }
}

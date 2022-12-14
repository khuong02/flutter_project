import 'package:do_an_di_dong/Utilities/nav_bar.dart';
import 'package:do_an_di_dong/api/api.dart';
import 'package:do_an_di_dong/screens/mode/mode_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "package:intl/intl.dart";

class AddCostWidget extends StatefulWidget {
  final String img;
  final int cost;
  final int money;

  const AddCostWidget(
      {Key? key, required this.img, required this.cost, required this.money})
      : super(key: key);

  @override
  State<AddCostWidget> createState() => _AddCostWidgetState();
}

class _AddCostWidgetState extends State<AddCostWidget> {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text('Do you want buy ${widget.cost} credit?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await UserApi().addCredit(widget.cost);
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    int? money = prefs.getInt('cost');
                    prefs.setInt('cost', money! + widget.cost);

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => NavBar()),
                        (route) => false);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: () {
          _showDialog();
        },
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.brown.shade400, Colors.brown],
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 3),
                    blurRadius: 7,
                    spreadRadius: 5,
                    color: Colors.brown.shade100,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cost.toString() + " cost",
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    NumberFormat.simpleCurrency(
                            locale: 'en-US', decimalDigits: 0)
                        .format(widget.money),
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              child: Image.asset(
                widget.img,
                scale: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
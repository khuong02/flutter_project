import 'package:do_an_di_dong/Consts/cosntants.dart';
import 'package:do_an_di_dong/screens/cost/add_cost_screen.dart';
import 'package:do_an_di_dong/screens/home/home_screen.dart';
import 'package:do_an_di_dong/screens/rankmode/rank_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:do_an_di_dong/features/authentication/authentication_controller.dart';

class ModeScreen extends ConsumerStatefulWidget {
  const ModeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ModeScreenState();
}

class _ModeScreenState extends ConsumerState<ModeScreen> {

  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              Container(
                alignment: AlignmentDirectional.bottomEnd,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCost()),
                    );
                  }, // Handle your callback
                  child: Ink(
                    height: 40,
                    width: 120,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: Colors.purple,
                            size: 39,
                          ),
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.purple, Colors.orange],
                              ),
                            ),
                            child: Text(
                              '5000',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: const [
                    Text(
                      'Welcome To Quizz KLD',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color(0xfff85e7d),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Choose Practice Or Rank!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffa9a4a5),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: GestureDetector(
                  onTap: () {
                    Constants.isRank = false;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        height: 150,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.teal.shade400, Colors.teal],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 3),
                              blurRadius: 7,
                              spreadRadius: 5,
                              color: Colors.teal.shade200,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Practice",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Hero(
                        tag: "Practice",
                        child: Image.asset(
                          "assets/images/general knowledge.png",
                          scale: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: GestureDetector(
                  onTap: () {
                    Constants.isRank = true;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RankMode()));
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        height: 150,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.pink.shade400, Colors.pink],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 3),
                              blurRadius: 7,
                              spreadRadius: 5,
                              color: Colors.pink.shade200,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Rank",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Hero(
                        tag: "Rank",
                        child: Image.asset(
                          "assets/images/geography.png",
                          scale: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
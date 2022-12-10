import 'package:do_an_di_dong/Consts/cosntants.dart';
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
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 70,
                      height: 30,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 1),
                          color: Colors.grey.shade400),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("5000"),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 60,
                    top: 2,
                    child: Icon(Icons.add_circle),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     authController.onSignOut(context);
                  //   },
                  //   child: Text("Sign out"),
                  // ),
                ],
              ),
              Text("Let's choose a mode to play!"),
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
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.teal.shade400, Colors.teal],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 3),
                              blurRadius: 7,
                              spreadRadius: 5,
                              color: Colors.teal,
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
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.pink.shade400, Colors.pink],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 3),
                              blurRadius: 7,
                              spreadRadius: 5,
                              color: Colors.pink,
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

  Widget cardMode(List<Color> colors, Color color, String title, String image) {
    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: () {},
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
                  colors: colors,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 3),
                    blurRadius: 7,
                    spreadRadius: 5,
                    color: color,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Hero(
              tag: title,
              child: Image.asset(
                image,
                scale: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

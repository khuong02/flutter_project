import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Widgets/close_button.dart';
import '../loading/loading_screen.dart';

class RankMode extends StatelessWidget {
  const RankMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.deepPurple.shade400, Colors.deepPurple],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                CustomCloseButton(color: Colors.white),
              ],
            ),
            const Text(
              'Rank Mode',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 35,
              ),
            ),
            Hero(
              tag: 'Rank',
              child: Image.asset(
                "assets/images/geography.png",
                height: 150,
                width: 300,
              ),
            ),
            Column(
              children: [
                const Text(
                  'Infomation',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'In this mode, you can answer a lot of questions with random topic and random difficult. More question you answer, More knowledge you have!!',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoadingScreen()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3, 3),
                      blurRadius: 3,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: const Text(
                  "Let's play",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

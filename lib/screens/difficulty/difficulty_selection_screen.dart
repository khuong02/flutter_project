import 'package:do_an_di_dong/models/topic_obj.dart';
import 'package:flutter/material.dart';

import '../../Utilities/card/card_details.dart';
import '../../Widgets/close_button.dart';
import '../../Widgets/home/difficulty_tile.dart';

class DifficultyScreen extends StatelessWidget {
  const DifficultyScreen({
    required this.detail,
  });
  final ListDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: detail.gradients,
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
            Text(
              detail.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 35,
              ),
            ),
            Hero(
              tag: detail.iconTag,
              child: Image.asset(
                detail.iconAssetName,
                height: 150,
                width: 300,
              ),
            ),
            Column(
              children: [
                const Text(
                  'Select Difficulty',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Harder the Difficulty, Lesser the Time per question.',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DifficultyTile(
                  detail: detail,
                  difficulty: 0,
                ),
                const SizedBox(height: 20),
                DifficultyTile(
                  detail: detail,
                  difficulty: 1,
                ),
                const SizedBox(height: 20),
                DifficultyTile(
                  detail: detail,
                  difficulty: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

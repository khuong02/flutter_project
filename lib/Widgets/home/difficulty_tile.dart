import 'package:flutter/material.dart';

import '../../screens/loading/loading_screen.dart';
import '../../Utilities/card/card_details.dart';

class DifficultyTile extends StatelessWidget {
  DifficultyTile({
    Key? key,
    required this.selectedIndex,
    required this.difficulty,
  }) : super(key: key);

  final int selectedIndex;
  final int difficulty;

  final List<String> level = ['Easy', 'Medium', 'Hard'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoadingScreen(
                      index: selectedIndex,
                      selectedDif: difficulty + 1,
                    )));
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: cardDetailList[selectedIndex].shadowColor,
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
        child: Text(
          level[difficulty],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

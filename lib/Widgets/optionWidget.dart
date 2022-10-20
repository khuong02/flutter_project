import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../Utilities/card/card_details.dart';
import '../features/question/header_question.dart';
import '../screens/question/question_screen.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    Key? key,
    required this.widget,
    required this.option,
    required this.onTap,
    required this.optionColor,
  }) : super(key: key);
  final HeaderQuestion widget;
  final String option;
  final VoidCallback onTap;
  final Color optionColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        alignment: Alignment.center,
        height: size.height * 0.065,
        width: size.width,
        decoration: BoxDecoration(
          color: optionColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 3),
              blurRadius: 3,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        child: SizedBox(
          child: AutoSizeText(
            option,
            minFontSize: 14,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: cardDetailList[widget.categoryIndex].textColor,
            ),
          ),
        ),
      ),
    );
  }
}

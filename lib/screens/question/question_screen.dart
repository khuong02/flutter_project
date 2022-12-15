import 'package:flutter/material.dart';

import '../../features/question/header_question.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({
    required this.questionData,
    required this.categoryIndex,
  });
  final questionData;
  final int categoryIndex;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isAbsorbing = false;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isAbsorbing,
      child: HeaderQuestion(
        questionData: widget.questionData,
        categoryIndex: widget.categoryIndex,
      ),
    );
  }
}

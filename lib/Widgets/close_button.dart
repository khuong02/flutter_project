import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  final Color color;
  const CustomCloseButton({
    Key? key,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          CupertinoIcons.arrowshape_turn_up_left_fill,
          color: color,
          size: 40,
        ),
      ),
    );
  }
}

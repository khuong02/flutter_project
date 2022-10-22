import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          CupertinoIcons.arrowshape_turn_up_left_fill,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

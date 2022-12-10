import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
    required this.datetime,
  }) : super(key: key);

  final String datetime;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 24,
            child: VerticalDivider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
          buildNumber(context, datetime, "Join since"),
          const SizedBox(
            height: 24,
            child: VerticalDivider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNumber(BuildContext context, String value, String title) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

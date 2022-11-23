import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Refresh extends StatefulWidget {
  final Widget child;
  final Future Function() onRefresh;
  const Refresh({Key? key, required this.child, required this.onRefresh})
      : super(key: key);

  @override
  State<Refresh> createState() => _RefreshState();
}

class _RefreshState extends State<Refresh> {
  @override
  Widget build(BuildContext context) => buildFresh();

  Widget buildFresh() =>
      RefreshIndicator(child: widget.child, onRefresh: widget.onRefresh);
}

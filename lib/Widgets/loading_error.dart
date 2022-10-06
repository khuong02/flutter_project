import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog._({Key? key, required this.error}) : super(key: key);

  final String error;

  static Future<void> show(BuildContext context, String errorMessage) {
    return showCupertinoDialog(
      context: context,
      builder: (_) => ErrorDialog._(
        error: errorMessage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(error),
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}

class LoadingSheet extends StatelessWidget {
  const LoadingSheet._({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(48)),
      ),
      builder: (_) => const LoadingSheet._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Center(
        child: LoadingAnimationWidget.dotsTriangle(
            color: Color(0xFFF5D973), size: 100),
      ),
    );
  }
}

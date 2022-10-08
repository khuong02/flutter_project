import 'package:flutter/cupertino.dart';

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

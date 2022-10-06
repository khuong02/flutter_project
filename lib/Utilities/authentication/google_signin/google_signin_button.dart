import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Widgets/animated_button.dart';
import '../../../Widgets/loading_error.dart';
import 'controller/google_signin_controller.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<GoogleSignInState>(
      googleSignInProvider,
      (previous, current) {
        if (current == GoogleSignInState.loading) {
          LoadingSheet.show(context);
        } else if (current == GoogleSignInState.error) {
          Navigator.of(context).pop();
          ErrorDialog.show(context, "Google signin failed!");
        } else {
          Navigator.of(context).pop();
        }
      },
    );

    return AnimatedButton(
      onTap: () {
        ref.read(googleSignInProvider.notifier).signInWithGoogle();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'http://pngimg.com/uploads/google/google_PNG19635.png',
              width: 30,
              height: 30,
            ),
            const Text(
              "Sign in with Google",
              style: TextStyle(
                color: Color(0xFF9A9A9A),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
    // TextButton(
    //   child: const Text(
    //     "Sign In With Google",
    //     style: TextStyle(
    //       color: Color(0xFF9A9A9A),
    //       fontWeight: FontWeight.bold,
    //       fontSize: 18,
    //     ),
    //   ),
    //   onPressed: () {
    //     ref.read(googleSignInProvider.notifier).signInWithGoogle();
    //   },
    // );
  }
}

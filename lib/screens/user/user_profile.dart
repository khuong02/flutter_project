import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Utilities/nav_bar.dart';
import '../../features/authentication/authentication_controller.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authProvider.notifier);
    final authUser = ref.watch(authProvider).user;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("user id: ${authUser.id}"),
            Text("user email: ${authUser.email}"),
            Text("email verified: ${authUser.emailVerified}"),
            TextButton(
              child: const Text("SignOut"),
              onPressed: () {
                authController.onSignOut();
                Navigator.of(context).pushNamed("/auth");
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavBar(),
    );
  }
}

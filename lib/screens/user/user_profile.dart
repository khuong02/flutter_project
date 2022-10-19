import 'dart:ffi';

import 'package:do_an_di_dong/Providers/user_provider.dart';
import 'package:do_an_di_dong/Widgets/user/number_widget.dart';
import 'package:do_an_di_dong/models/user.dart';
import 'package:do_an_di_dong/screens/user/edit_profile_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Utilities/nav_bar.dart';
import '../../Widgets/user/profile.dart';
import '../../features/authentication/authentication_controller.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => UserProfileState();
}

class UserProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authProvider.notifier);
    // final authUser = ref.watch(authProvider).user;
    final user = UserProvider.myuser;
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            child: ProfileWidget(
              imageUrl: user.photo,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfileUser(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
            child: buildName(user),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
            child: NumberWidget(
              rank: user.ranking,
              totalPlayed: user.totalPlay,
              datetime: user.dateCreated,
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: buildInfo(),
              )),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.06),
            child: TextButton(
              onPressed: () {
                authController.onSignOut();
              },
              child: const Text(
                "Log out",
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) {
    return Column(
      children: [
        Text(
          user.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.email,
          style: const TextStyle(color: Colors.grey, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget buildInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Infomation",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "content",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        Divider(
          thickness: 0.2,
          color: Colors.black.withOpacity(0.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Infomation",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "content",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        Divider(
          thickness: 0.2,
          color: Colors.black.withOpacity(0.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Infomation",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "content",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        Divider(
          thickness: 0.2,
          color: Colors.black.withOpacity(0.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Infomation",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "content",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ],
    );
  }
}

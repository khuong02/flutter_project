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
  Future<User>? _futureUser;
  FutureBuilder<User> buildFutureBuilder() {
    return FutureBuilder<User>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authProvider.notifier);
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            child: ProfileWidget(
              imageUrl: "http://pngimg.com/uploads/google/google_PNG19635.png",
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
            child: buildName(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
            child: NumberWidget(
              rank: 1,
              totalPlayed: 20,
              datetime: DateTime(2020, 2, 3),
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
                authController.onSignOut(context);
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

  Widget buildName() {
    return Column(
      children: const [
        Text(
          "Trần Phi Long",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "caybut65@gmail.com",
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        SizedBox(
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

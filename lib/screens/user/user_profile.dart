import 'dart:ffi';
import 'package:do_an_di_dong/Widgets/user/number_widget.dart';
import 'package:do_an_di_dong/api/api.dart';
import 'package:do_an_di_dong/models/user.dart';
import 'package:do_an_di_dong/screens/user/edit_profile_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/user/profile.dart';
import '../../features/authentication/authentication_controller.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => UserProfileState();
}

class UserProfileState extends ConsumerState<Profile> {
  Future<User> getUser() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString("token");
    return await CallApi().getUser(token!);
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authProvider.notifier);
    return FutureBuilder<User>(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: ProfileWidget(
                    imageUrl: snapshot.data?.photo ??
                        "http://pngimg.com/uploads/google/google_PNG19635.png",
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
                  child: buildName(snapshot.data!),
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
                      child: buildInfo(snapshot.data!),
                    )),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.06),
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
        return Scaffold(
          body: Center(
            child: Text("Loading..."),
          ),
        );
      },
    );
  }

  Widget buildName(User user) {
    return Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.email,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget buildInfo(User user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Credit",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              user.cost.toString(),
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

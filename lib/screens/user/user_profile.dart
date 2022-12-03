import 'package:auto_reload/auto_reload.dart';
import 'package:do_an_di_dong/Widgets/user/number_widget.dart';
import 'package:do_an_di_dong/api/api.dart';
import 'package:do_an_di_dong/models/user.dart';
import 'package:do_an_di_dong/screens/user/edit_profile_user.dart';
import 'package:flutter/material.dart';
import '../../Widgets/user/profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UserProfileState();
}

abstract class AutoReload extends State<Profile> implements AutoReloader {}

class UserProfileState extends AutoReload with AutoReloadMixin {
  late Future<User> myUser;
  final Duration autoReloadDuration = const Duration(seconds: 8);

  @override
  void initState() {
    loadUser();
    super.initState();
    startAutoReload();
  }

  @override
  void dispose() {
    cancelAutoReload();
    super.dispose();
  }

  Future loadUser() async {
    setState(() {
      myUser = UserApi().getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: myUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: ProfileWidget(
                    imageUrl: snapshot.data!.photo,
                    onClicked: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditProfileUser(snapshot.data!),
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
                  child: buildInfo(snapshot.data!),
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
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
      ],
    );
  }

  @override
  void autoReload() {
    setState(() {
      loadUser();
    });
  }
}

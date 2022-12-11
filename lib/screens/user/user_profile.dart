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
            extendBodyBehindAppBar: true,
            body: Stack(children: [
              Center(
                child: Image.network(
                  snapshot.data!.photo,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.91,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage(snapshot.data!.photo),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      snapshot.data!.name,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text(
                                      snapshot.data!.email,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 40, 171, 227),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 24,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfileUser(snapshot.data!),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Edit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                      ),
                      MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        onPressed: () {},
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Date create",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            Text(
                              snapshot.data!.dateJoin.day.toString() +
                                  "/" +
                                  snapshot.data!.dateJoin.month.toString() +
                                  "/" +
                                  snapshot.data!.dateJoin.year.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: buildInfo(snapshot.data!),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildInfo(User user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Cash",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              user.cost.toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Best score",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              user.bestScore.toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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

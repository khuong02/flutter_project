import 'package:auto_reload/auto_reload.dart';
import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/Providers/theme_provider.dart';
import 'package:do_an_di_dong/Widgets/user/number_widget.dart';
import 'package:do_an_di_dong/api/api.dart';
import 'package:do_an_di_dong/models/user.dart';
import 'package:do_an_di_dong/screens/user/edit_profile_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                  decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).getThemeMode
                        ? MyColor.leaderboardBackGroundColor
                        : Colors.white,
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
                                      style: TextStyle(
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                    .getThemeMode
                                                ? Colors.white
                                                : Colors.black,
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
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                    .getThemeMode
                                                ? Colors.white
                                                : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Container(
                            //   decoration: const BoxDecoration(
                            //     gradient: LinearGradient(
                            //       begin: Alignment.centerLeft,
                            //       end: Alignment.centerRight,
                            //       colors: [Colors.purple, Colors.orange],
                            //     ),
                            //     borderRadius: BorderRadius.all(
                            //       Radius.circular(20),
                            //     ),
                            //   ),
                            //   padding: const EdgeInsets.symmetric(
                            //     vertical: 8,
                            //     horizontal: 24,
                            //   ),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       Navigator.of(context).push(
                            //         MaterialPageRoute(
                            //           builder: (context) =>
                            //               EditProfileUser(snapshot.data!),
                            //         ),
                            //       );
                            //     },
                            //     child: const Text(
                            //       "Edit",
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.w600),
                            //     ),
                            //   ),
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 4),
                                      blurRadius: 5.0)
                                ],
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.purple, Colors.orange],
                                ),
                                color: Colors.deepPurple.shade300,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(10, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  // elevation: MaterialStateProperty.all(3),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfileUser(snapshot.data!),
                                    ),
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                      fontSize: 18,
                                      // fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Provider.of<ThemeProvider>(context).getThemeMode
                            ? Colors.white
                            : Colors.grey.shade400,
                      ),
                      MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        onPressed: () {},
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Date create",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Provider.of<ThemeProvider>(context)
                                        .getThemeMode
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                            Text(
                              snapshot.data!.dateJoin.day.toString() +
                                  "/" +
                                  snapshot.data!.dateJoin.month.toString() +
                                  "/" +
                                  snapshot.data!.dateJoin.year.toString(),
                              style: TextStyle(
                                color: Provider.of<ThemeProvider>(context)
                                        .getThemeMode
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Provider.of<ThemeProvider>(context).getThemeMode
                            ? Colors.white
                            : Colors.grey.shade400,
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
            Text(
              "Cash",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Provider.of<ThemeProvider>(context).getThemeMode
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            Text(
              user.cost.toString(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Provider.of<ThemeProvider>(context).getThemeMode
                    ? Colors.white
                    : Colors.black,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Best score",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Provider.of<ThemeProvider>(context).getThemeMode
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            Text(
              user.bestScore.toString(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Provider.of<ThemeProvider>(context).getThemeMode
                    ? Colors.white
                    : Colors.black,
              ),
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

import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/Utilities/nav_bar.dart';
import 'package:do_an_di_dong/Widgets/setting/setting_group.dart';
import 'package:do_an_di_dong/api/api.dart';
import 'package:do_an_di_dong/features/friend/list_friend_pending.dart';
import 'package:do_an_di_dong/screens/friend/my_friend_screen.dart';
import 'package:do_an_di_dong/screens/history/history_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Providers/theme_provider.dart';
import '../../Widgets/setting/setting_item.dart';
import '../../features/friend/list_friend.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> switchMap = {
      "darkMode": Provider.of<ThemeProvider>(context).getThemeMode,
    };

    return Scaffold(
      backgroundColor: switchMap["darkMode"]!
          ? MyColor.leaderboardBackGroundColor
          : Colors.white.withOpacity(.94),
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
              color: switchMap["darkMode"]! ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SettingGroup(
              backgroundColor: switchMap["darkMode"]!
                  ? MyColor.leaderboardColor
                  : Colors.white,
              items: [
                SettingItem(
                  onTap: () {},
                  icons: Icons.notifications,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.orange,
                  ),
                  titleStyle: TextStyle(
                    color: switchMap["darkMode"]!
                        ? Colors.white
                        : MyColor.leaderboardColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  subtitleStyle: TextStyle(
                    color: switchMap["darkMode"]! ? Colors.white : Colors.grey,
                  ),
                  title: 'Dark Mode',
                  subtitle: "Use Dark Mode will you feel funny",
                  trailing: Switch.adaptive(
                    value: switchMap["darkMode"]!,
                    onChanged: (value) async {
                      SharedPreferences perfs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        switchMap["darkMode"] = !switchMap["darkMode"]!;
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                        UserApi.setThemeMode(switchMap["darkMode"]! ? 1 : 0);
                      });

                      await perfs.setBool('mode', switchMap["darkMode"]!);
                    },
                  ),
                ),
              ],
            ),
            SettingGroup(
              backgroundColor: switchMap["darkMode"]!
                  ? MyColor.leaderboardColor
                  : Colors.white,
              settingsGroupTitle: "Individual",
              settingsGroupTitleStyle: TextStyle(
                  fontSize: 19,
                  color: switchMap["darkMode"]! ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
              items: [
                SettingItem(
                  iconStyle: IconStyle(
                    backgroundColor: Colors.white,
                    iconsColor:
                        switchMap["darkMode"]! ? Colors.black : Colors.black,
                  ),
                  icons: Icons.supervised_user_circle,
                  titleStyle: TextStyle(
                    color: switchMap["darkMode"]!
                        ? Colors.white
                        : MyColor.leaderboardColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  subtitleStyle: TextStyle(
                    color: switchMap["darkMode"]! ? Colors.white : Colors.grey,
                  ),
                  title: "Your Friends",
                  subtitle: "Friends",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListFriend()));
                  },
                ),
                SettingItem(
                  iconStyle: IconStyle(
                    backgroundColor: Colors.white,
                    iconsColor:
                        switchMap["darkMode"]! ? Colors.black : Colors.black,
                  ),
                  icons: Icons.supervised_user_circle,
                  titleStyle: TextStyle(
                    color: switchMap["darkMode"]!
                        ? Colors.white
                        : MyColor.leaderboardColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  subtitleStyle: TextStyle(
                    color: switchMap["darkMode"]! ? Colors.white : Colors.grey,
                  ),
                  title: "Friends Request",
                  subtitle: "Accept or deny",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListFriendPending()));
                  },
                ),
              ],
            ),
            SettingGroup(
              backgroundColor: switchMap["darkMode"]!
                  ? MyColor.leaderboardColor
                  : Colors.white,
              settingsGroupTitle: "History",
              settingsGroupTitleStyle: TextStyle(
                  fontSize: 19,
                  color: switchMap["darkMode"]! ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
              items: [
                SettingItem(
                  iconStyle: IconStyle(
                    backgroundColor: Colors.white,
                    iconsColor:
                        switchMap["darkMode"]! ? Colors.black : Colors.black,
                  ),
                  icons: Icons.history,
                  titleStyle: TextStyle(
                    color: switchMap["darkMode"]!
                        ? Colors.white
                        : MyColor.leaderboardColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  subtitleStyle: TextStyle(
                    color: switchMap["darkMode"]! ? Colors.white : Colors.grey,
                  ),
                  title: "History",
                  subtitle: "Your history play game!",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HistoryScreen()));
                  },
                ),
              ],
            ),
            SettingGroup(
              backgroundColor: switchMap["darkMode"]!
                  ? MyColor.leaderboardColor
                  : Colors.white,
              settingsGroupTitle: "Account",
              settingsGroupTitleStyle: TextStyle(
                  fontSize: 19,
                  color: switchMap["darkMode"]! ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
              items: [
                SettingItem(
                  iconStyle: IconStyle(
                    backgroundColor: Colors.white,
                    iconsColor:
                        switchMap["darkMode"]! ? Colors.black : Colors.black,
                  ),
                  icons: Icons.history,
                  titleStyle: TextStyle(
                    color: switchMap["darkMode"]!
                        ? Colors.white
                        : MyColor.leaderboardColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  subtitleStyle: TextStyle(
                    color: switchMap["darkMode"]! ? Colors.white : Colors.grey,
                  ),
                  title: "History",
                  subtitle: "Your history play game!",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HistoryScreen()));
                  },
                ),
              ],
            ),
            SettingGroup(
              backgroundColor: switchMap["darkMode"]!
                  ? MyColor.leaderboardColor
                  : Colors.white,
              settingsGroupTitle: "Account",
              settingsGroupTitleStyle: TextStyle(
                  fontSize: 19,
                  color: switchMap["darkMode"]! ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
              items: [
                SettingItem(
                  iconStyle: IconStyle(
                    backgroundColor: Colors.white,
                    iconsColor:
                        switchMap["darkMode"]! ? Colors.black : Colors.black,
                  ),
                  icons: Icons.exit_to_app_rounded,
                  titleStyle: TextStyle(
                    color: switchMap["darkMode"]!
                        ? Colors.white
                        : MyColor.leaderboardColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  subtitleStyle: TextStyle(
                    color: switchMap["darkMode"]! ? Colors.white : Colors.grey,
                  ),
                  title: "Sign Out",
                  subtitle: "Sign out this account",
                  onTap: () {
                    AuthenticationApi.onSignOut(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

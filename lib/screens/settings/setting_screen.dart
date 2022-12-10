import 'package:do_an_di_dong/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../Providers/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  Map<String, bool> switchMap = {
    "darkMode": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.94),
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SettingsGroup(
              items: [
                // SettingsItem(
                //   onTap: () {},
                //   icons: LineIcons.history,
                //   iconStyle: IconStyle(),
                //   title: 'card recharge history',
                //   // subtitle: "Make Ziar'App yours",
                // ),
                // SettingsItem(
                //   onTap: () {},
                //   icons: Icons.fingerprint,
                //   iconStyle: IconStyle(
                //     iconsColor: Colors.white,
                //     withBackground: true,
                //     backgroundColor: Colors.red,
                //   ),
                //   title: 'Privacy',
                //   subtitle: "Lock Ziar'App to improve your privacy",
                // ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.notifications,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.orange,
                  ),
                  title: 'Dark Mode',
                  subtitle: "Use Dark Mode will you feel funny",
                  trailing: Switch.adaptive(
                    value: switchMap["darkMode"]!,
                    onChanged: (value) {
                      setState(() {
                        switchMap["darkMode"] = !switchMap["darkMode"]!;
                        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                      });
                    },
                  ),
                ),
                // SettingsItem(
                //   onTap: () {},
                //   icons: CupertinoIcons.bell,
                //   iconStyle: IconStyle(
                //     iconsColor: Colors.white,
                //     withBackground: true,
                //     backgroundColor: Colors.red,
                //   ),
                //   title: 'Sound',
                //   subtitle: "Invitation, ...vv",
                //   trailing: Switch.adaptive(
                //     value: false,
                //     onChanged: (value) {},
                //   ),
                // ),
                // SettingsItem(
                //   onTap: () {},
                //   icons: Icons.feedback_rounded,
                //   iconStyle: IconStyle(
                //     iconsColor: Colors.white,
                //     withBackground: true,
                //     backgroundColor: Colors.yellow,
                //   ),
                //   title: 'Send Feedback',
                //   subtitle: "send feedback about your experience,...",
                // ),
              ],
            ),
            // SettingsGroup(
            //   items: [
            //     SettingsItem(
            //       onTap: () {},
            //       icons: Icons.info_rounded,
            //       iconStyle: IconStyle(
            //         backgroundColor: Colors.purple,
            //       ),
            //       title: 'About',
            //       subtitle: "Learn more about Ziar'App",
            //     ),
            //   ],
            // ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {
                    AuthenticationApi.onSignOut(context);
                  },
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
                // SettingsItem(
                //   onTap: () {},
                //   icons: CupertinoIcons.repeat,
                //   title: "Change email",
                // ),
                // SettingsItem(
                //   onTap: () {},
                //   icons: CupertinoIcons.delete_solid,
                //   title: "Delete account",
                //   titleStyle: TextStyle(
                //     color: Colors.red,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

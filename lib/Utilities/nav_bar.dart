import 'dart:convert';

import 'package:do_an_di_dong/api/api.dart';
import 'package:do_an_di_dong/models/user.dart';
import 'package:do_an_di_dong/screens/home/home_screen.dart';
import 'package:do_an_di_dong/screens/leaderboard/leaderboard_screen.dart';
import 'package:do_an_di_dong/screens/user/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/errors/not_found_screen.dart';
import '../screens/settings/setting_screen.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBar createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  // User user = User(id: 0, name: '');
  // getUserProfile() async {
  //   var pref = await SharedPreferences.getInstance();
  //   String token = await pref.getString('token')!;
  //   var res = await CallApi().getUser(token);

  //   var body = jsonDecode(res.body);
  //   setState(() {
  //     user = User.fromJson(body);
  //   });
  // }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  final List<Widget> _children = [
    const HomeScreen(),
    const LeaderboardScreen(),
    const Profile(),
    const SettingScreen(),
  ];
  // @override
  // void initState() {
  //   getUserProfile();
  //   super.initState();
  // }

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Leaderboard',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  void handleTabChange(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget handleChangeScreen(int index) {
    if (index >= _children.length || index < 0) {
      return const NotFoundScreen();
    }

    return _children[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: handleChangeScreen(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[300]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                ),
                GButton(
                  icon: LineIcons.barChart,
                ),
                GButton(
                  icon: LineIcons.user,
                ),
                GButton(
                  icon: Icons.settings,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: handleTabChange,
            ),
          ),
        ),
      ),
    );
  }
}

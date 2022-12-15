import 'package:do_an_di_dong/api/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Consts/my_color/my_color.dart';
import '../../Utilities/card/card_details.dart';
import '../../Providers/theme_provider.dart';
import '../../Widgets/home/list_card.dart';

import '../../Widgets/close_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).getThemeMode
          ? MyColor.leaderboardBackGroundColor
          : Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Container(
            margin:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomCloseButton(
                      color: Provider.of<ThemeProvider>(context).getThemeMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Let\'s play',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xfff85e7d),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Choose a topic to practice !',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffa9a4a5),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                FutureBuilder<List<ListDetail>>(
                  future: TopicApi.getTopic(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ListDetail> data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListCard(data[index]);
                        },
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

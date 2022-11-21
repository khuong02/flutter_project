import 'package:do_an_di_dong/Providers/user_provider.dart';
import 'package:do_an_di_dong/features/authentication/authentication_controller.dart';
import 'package:do_an_di_dong/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Utilities/card/card_details.dart';
import '../../Widgets/home/list_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authProvider.notifier);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          margin:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Text("5000"),
                  ),
                  TextButton(
                      onPressed: () {
                        authController.onSignOut(context);
                      },
                      child: Text("Sign out"))
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
                'Be the fisrt!',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffa9a4a5),
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListView.builder(
                itemCount: cardDetailList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListCard(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

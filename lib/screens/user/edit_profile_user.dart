import 'dart:io';

import 'package:do_an_di_dong/Providers/user_provider.dart';
import 'package:do_an_di_dong/Widgets/user/profile.dart';
import 'package:do_an_di_dong/Widgets/user/text_edit_user.dart';
import 'package:do_an_di_dong/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/authentication/authentication_controller.dart';

class EditProfileUser extends ConsumerStatefulWidget {
  final User myUser;
  EditProfileUser(this.myUser, {Key? key, this.isChange}) : super(key: key);

  bool? isChange = false;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        border: Border.all(style: BorderStyle.none),
        trailing: GestureDetector(
          child: const Text(
            "Save",
            style:
                TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w700),
          ),
          onTap: () async {},
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          ProfileWidget(
            isEdit: true,
            imageUrl: widget.myUser.photo!,
            onClicked: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextEditUser(
              title: "Full name",
              text: widget.myUser.name,
              onChanged: (name) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextEditUser(
              title: "Email",
              text: widget.myUser.email,
              onChanged: (name) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextEditUser(
              title: "Cost",
              text: widget.myUser.cost.toString(),
              onChanged: (name) {},
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:do_an_di_dong/Utilities/loading/loading_sheet.dart';
import 'package:do_an_di_dong/Utilities/my_error/error_dialog.dart';
import 'package:do_an_di_dong/Widgets/text_input_field.dart';
import 'package:do_an_di_dong/Widgets/user/profile.dart';
import 'package:do_an_di_dong/api/user_api/user_api.dart';
import 'package:do_an_di_dong/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileUser extends StatefulWidget {
  User myUser;
  EditProfileUser(this.myUser, {Key? key, this.isChange}) : super(key: key);

  bool? isChange = false;

  @override
  State<StatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileUser> {
  final _txtName = TextEditingController();

  @override
  void dispose() {
    _txtName.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _txtName.text = widget.myUser.name;
    super.initState();
  }

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTem = File(image.path);
      setState(() {
        this.image = imageTem;
      });
    } on PlatformException catch (e) {
      ErrorDialog.show(context, "Failed to pick image: $e");
    }
  }

  updateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> data = {
      "username": _txtName.text,
      "cost": prefs.getInt('cost').toString(),
      "avatar": widget.myUser.photo,
    };

    if (image != null) {
      return await UserApi().updateProfile(data, image);
    }
    return await UserApi().updateProfile(data, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        border: Border.all(style: BorderStyle.none),
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
            onClicked: () {
              pickImage();
            },
            image: image,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextInputField(
              hintText: "Name",
              onChanged: (name) {},
              controller: _txtName,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text(
              "Save",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            onPressed: () async {
              LoadingSheet.show(context);
              final res = await updateUser();

              final body = jsonDecode(res.body);
              if (body['status'] == 200) {
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}

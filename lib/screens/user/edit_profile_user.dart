import 'dart:convert';
import 'dart:io';

import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/Providers/theme_provider.dart';
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
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/close_button.dart';

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
      backgroundColor: Provider.of<ThemeProvider>(context).getThemeMode ? MyColor.leaderboardBackGroundColor : Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: ListView(
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCloseButton(color: Provider.of<ThemeProvider>(context).getThemeMode ? Colors.white : Colors.black,),
              ],
            ),
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
              padding: const EdgeInsets.only(top: 40),
              child: TextInputField(
                hintText: "Name",
                onChanged: (name) {},
                controller: _txtName,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                ],
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.purple, Colors.orange],
                ),
                color: Colors.deepPurple.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(10, 50)),
                  backgroundColor:
                  MaterialStateProperty.all(Colors.transparent),
                  // elevation: MaterialStateProperty.all(3),
                  shadowColor:
                  MaterialStateProperty.all(Colors.transparent),
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
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "Save",
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
    );
  }
}

import 'package:do_an_di_dong/Widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class TextEditUser extends StatefulWidget {
  const TextEditUser(
      {Key? key,
      required this.title,
      required this.text,
      required this.onChanged})
      : super(key: key);

  final String title;
  final String text;
  final ValueChanged<String> onChanged;

  @override
  State<TextEditUser> createState() => _TextEditUserState();
}

class _TextEditUserState extends State<TextEditUser> {
  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        const SizedBox(
          height: 5,
        ),
        TextInputField(controller: controller, onChanged: (value) {})
      ],
    );
  }
}

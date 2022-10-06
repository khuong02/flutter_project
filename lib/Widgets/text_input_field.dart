import 'package:flutter/material.dart';
import 'size_fade_switcher.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final void Function(String value) onChanged;
  final String? errorText;
  final bool obscureText;

  const TextInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.errorText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFD0D0D0), width: 1)),
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
                border: InputBorder.none,
                // errorText: errorText,
                hintText: hintText,
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFC2C2C2))),
          ),
        ),
        SizeFadeSwitcher(
          child: errorText != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Text(
                    errorText!,
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}

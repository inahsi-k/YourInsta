import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  const TextFieldWidget({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    //OutlineINputBorder -- draws a box-shaped border.
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(
        context,
      ), //gives it a light, default line (like a divider line)
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder, //default border
        focusedBorder: inputBorder, //when the user taps the field
        enabledBorder:
            inputBorder, //when the field is active but not tapped yet
        filled:
            true, // text box background will be filled (usually white or light gray) to make it stand out.
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}

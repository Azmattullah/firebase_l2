import 'package:flutter/material.dart';


class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.textEditingController,
    this.isPass = false,
  });

  final String hintText;
  final TextInputType textInputType;
  final bool isPass;
  final TextEditingController textEditingController;


  @override
  Widget build(BuildContext context) {
    final InputBorder = OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder,
        enabledBorder: InputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}

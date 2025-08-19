import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.textFieldController,
    this.textFieldValidator,
    required this.textFieldTitle,
    required this.icon,
    this.isObscureText =false
  });
  final TextEditingController? textFieldController;
  final String? Function(String?)? textFieldValidator;
  final String textFieldTitle;
  final Widget icon;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText,
      controller: textFieldController,
      validator: textFieldValidator,
      decoration: InputDecoration(prefixIcon: icon, labelText: textFieldTitle),
      
    );
  }
}

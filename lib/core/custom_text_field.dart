import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key ,  this.textFieldController, this.textFieldValidator,required this.textFieldTitle , required this.icon});
  final  TextEditingController? textFieldController;
  final String? Function(String?)? textFieldValidator;
  final String textFieldTitle; 
  final Widget icon ; 
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFieldController,
      validator: textFieldValidator,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFEFE4F2),
        border: const OutlineInputBorder(),
       // prefixIcon: const Icon(Icons.email),
       prefixIcon: icon,
        labelText: textFieldTitle,
      ),
    );
  }
}

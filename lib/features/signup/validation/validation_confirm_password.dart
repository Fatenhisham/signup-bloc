import 'package:flutter/material.dart';
String? Function(String?) validationConfirmPasswordField({
  required BuildContext context,
  required TextEditingController passwordController,
}) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  };
}

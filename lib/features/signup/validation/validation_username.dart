import 'package:flutter/material.dart';

String? Function(String?) validationUsernameField({required BuildContext context}) {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }
    if (value.trim().length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  };
}
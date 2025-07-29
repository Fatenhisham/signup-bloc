import 'package:flutter/material.dart';

String? Function(String?) validationPasswordField({
  required BuildContext context,
}) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  };
}
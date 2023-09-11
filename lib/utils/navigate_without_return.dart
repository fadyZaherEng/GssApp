import 'package:flutter/material.dart';

void navigateToWithoutReturn({
  required BuildContext context,
  required Widget screen,
  required bool validate,
}) {
  if (validate) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => screen
        ), (Route<dynamic>route) => false);
  }
}

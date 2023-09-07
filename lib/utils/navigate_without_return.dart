import 'package:flutter/material.dart';

void navigateToWithoutReturn(context,Widget screen) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder: (context)=>screen
    ),(Route<dynamic>route) => false);

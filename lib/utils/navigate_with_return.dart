import 'package:flutter/material.dart';

void navigateToWithReturn(context,Widget screen) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>screen
    ));
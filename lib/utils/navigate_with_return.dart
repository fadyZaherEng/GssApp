import 'package:flutter/material.dart';

void navigateToWithReturn({
required BuildContext context,
required Widget screen,
required bool validate,
}) {
    if(validate){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=>screen
            ));
    }
}
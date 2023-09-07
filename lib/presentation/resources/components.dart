// ignore_for_file: deprecated_member_use, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

void navigateToWithoutReturn(context,Widget screen) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder: (context)=>screen
    ),(Route<dynamic>route) => false);
void navigateToWithReturn(context,Widget screen) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>screen
    ));
Widget defaultTextForm({
  required context,
  required TextEditingController controller,
  Widget? suffixIcon,
  required Widget prefixIcon,
  required String text,
  required FormFieldValidator validate,
  bool obscure=false,
  required TextInputType type,
}) => TextFormField(
  controller: controller,
  decoration: InputDecoration(
    hintStyle: const TextStyle(color: Colors.grey),
    labelStyle:  const TextStyle(color: Colors.grey,fontSize: 15),
    suffixIcon: suffixIcon,
    label: Text(text),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color.fromRGBO(226 ,226, 226,1),
        )
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color.fromRGBO(226 ,226, 226,1),
      )
    ),
  ),
  style:Theme.of(context).textTheme.bodyText2,
  validator: validate,
  obscureText:obscure ,
  keyboardType: type,
);
enum ToastState {SUCCESS,ERROR,WARNING}
Future<bool?> showToast({
  required String message,
  required ToastState state,
})
=> Fluttertoast.showToast(
  msg:message,
  gravity: ToastGravity.BOTTOM,
  textColor: Colors.white,
  toastLength: Toast.LENGTH_LONG,
  timeInSecForIosWeb: 5,
  backgroundColor: chooseToastColor(state),
);

Color chooseToastColor(ToastState state) {
  late Color color;
  switch(state){
    case ToastState.SUCCESS:
      color=HexColor('180040');
      break;
    case ToastState.ERROR:
      color=Colors.red;
      break;
    case ToastState.WARNING:
      color=Colors.amber;
      break;
  }
  return color;
}

Widget mySeparator(context) =>Container(
  padding: const EdgeInsets.all(8),
  margin: const EdgeInsets.all(8),
  color: HexColor('180040'),
  width: double.infinity,
  height: 1,
);


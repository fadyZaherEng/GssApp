import 'package:flutter/material.dart';

class CustomTextFiledWidget extends StatelessWidget {

  final BuildContext context;
  final TextEditingController controller;
   Widget? suffixIcon;
  final Widget prefixIcon;
  final String text;
  final FormFieldValidator validate;
   bool obscure;
  final TextInputType type;

   CustomTextFiledWidget({
    super.key,
    required this.context,
    required this.controller,
    this.suffixIcon,
    required this.prefixIcon,
    required this.text,
    required this.validate,
    this.obscure=false,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        suffixIcon: suffixIcon??SizedBox(),
        label: Text(text),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(226, 226, 226, 1),
            )
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(226, 226, 226, 1),
            )
        ),
      ),
      style: Theme
          .of(context)
          .textTheme
          .bodyText2,
      validator: validate,
      obscureText: obscure,
      keyboardType: type,
    );
  }
}

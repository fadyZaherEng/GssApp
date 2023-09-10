import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailTextFiledWidget extends StatelessWidget {
  TextEditingController controller;


  EmailTextFiledWidget(
      {required this.controller,
 });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        label: Text("Email Address"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(226, 226, 226, 1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(226, 226, 226, 1),
            )),
      ),
      style: Theme.of(context).textTheme.bodyText2,
      validator: (val) {
        if (val != null) {
          if (!EmailValidator.validate(val)) {
            return "Please Enter Your Valid Email Address";
          }
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,

    );
  }
}

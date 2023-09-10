import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  TextEditingController controller;
 // FormFieldValidator validate;
  Function(String?)? onChanged;
  String? errorMSG;
  String text;
  CustomTextFieldWidget({super.key,
   required this.controller,required this.text,required this.errorMSG,this.onChanged
});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(
            color: Colors.grey, fontSize: 15),
        label:  Text(text),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(226, 226, 226, 1),
          ),),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(226 ,226, 226,1),
            )
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (val) {
          if(val.toString().isEmpty){
            return errorMSG;
          }
          return null;
      },
      keyboardType: TextInputType.text,
      onChanged: onChanged,
    );
  }
}

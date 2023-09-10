import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  void Function(String value)? onChanged;
  PasswordTextFieldWidget({
    super.key,
    required this.controller,
    this.onChanged
  });

  @override
  State<PasswordTextFieldWidget> createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  Icon? _suffixIcon;
  bool _obscure = true;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEye();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        suffixIcon: IconButton(
          onPressed: () {
            changeObscure();
            changeEye();
          },
          icon: _suffixIcon!
        ),
        label: const Text("Password"),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(226, 226, 226, 1),
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(226, 226, 226, 1),
            )),
      ),
      style: Theme.of(context).textTheme.bodyText2,
      validator: (val) {
        if (val.toString().length<7) {
          return "Password is Very Short";
        }
        return null;
      },
      obscureText: _obscure,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  void changeObscure() {
    _obscure = !_obscure;
    setState(() {});
  }

  void changeEye() {
    if (_obscure) {
      _suffixIcon = const Icon(
        Icons.remove_red_eye_outlined,
        color: Colors.grey,
      );
    } else {
      _suffixIcon = const Icon(
        Icons.visibility_off_outlined,
        color: Colors.grey,
      );
    }
    setState(() {});
  }
}

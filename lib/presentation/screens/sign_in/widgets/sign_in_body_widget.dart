// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_background_widget.dart';
import 'package:gss/presentation/widgets/custom_text_field_widget.dart';
import 'package:gss/presentation/widgets/password_text_field_widget.dart';

class SignInBodyWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  void Function(String value) onChangePhoneNumber;
  void Function(String value) onSubmittedPhoneNumber;
  void Function() onPressedClosed;
  void Function() navigateToHomeScreen;
  void Function() navigateToSignUpScreen;
  void Function(String value) onChangePassword;
  void Function() onPressedForgetPassword;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  String? validationMessagePhone;
  String? validationMessagePassword;

  SignInBodyWidget({
    super.key,
    required this.formKey,
    required this.navigateToHomeScreen,
    required this.navigateToSignUpScreen,
    required this.onPressedForgetPassword,
    required this.onChangePassword,
    required this.onPressedClosed,
    required this.onChangePhoneNumber,
    required this.validationMessagePassword,
    required this.validationMessagePhone,
    required this.passwordController,
    required this.phoneController,
    required this.onSubmittedPhoneNumber,
  });

  @override
  State<SignInBodyWidget> createState() => _SignInBodyWidgetState();
}

class _SignInBodyWidgetState extends State<SignInBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SignInBackgroundWidget(),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: widget.onPressedClosed,
                      icon: Icon(
                        Icons.close_sharp,
                        size: 22,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextFieldWidget(
                  controller: widget.phoneController,
                  text: "Phone Number",
                  errorMSG: widget.validationMessagePhone,
                  onChanged: widget.onChangePhoneNumber,
                  onSubmitted: widget.onSubmittedPhoneNumber,
                ),
                const SizedBox(
                  height: 35,
                ),
                PasswordTextFieldWidget(
                  controller: widget.passwordController,
                  onChanged: widget.onChangePassword,
                  errorMSG: widget.validationMessagePassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: TextButton(
                      onPressed: widget.onPressedForgetPassword,
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                            color: Color.fromRGBO(3, 106, 130, 1),
                            fontWeight: FontWeight.normal,
                            fontSize: 13),
                      )),
                ),
                const SizedBox(
                  height: 45,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    height: 50,
                    onPressed: widget.navigateToHomeScreen,
                    color: const Color.fromRGBO(3, 106, 130, 1),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: widget.navigateToSignUpScreen,
                        child: const Text(
                          "Create Account",
                          style:
                              TextStyle(color: Color.fromRGBO(3, 106, 130, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gss/src/presentation/screens/sign_up/widgets/sign_up_background_widget.dart';
import 'package:gss/src/presentation/widgets/custom_text_field_widget.dart';
import 'package:gss/src/presentation/widgets/email_text_filed_widget.dart';
import 'package:gss/src/presentation/widgets/password_text_field_widget.dart';

class SignUpBodyWidget extends StatefulWidget {
  //massage
  String? validationMassageFullName;
  String? validationMassagePhoneNumber;
  String? validationMassageEmail;
  String? validationMassagePassword;

  final GlobalKey<FormState> formKey;
  //phone
  void Function(String value) onChangedPhoneNumber;
  void Function(String value) onSubmittedPhoneNumber;
  void Function() onPressesClosed;
  //name
  void Function(String value) onPressedSubmittedFullName;
  void Function(String value) onPressedChangedFullName;
  //email
  void Function(String value) onPressedChangedEmail;
  //password
  void Function(String value) onPressedChangedPassword;
  //controller
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  //sign up
  void Function() signUpOnPressed;
  //sign in
  void Function() onPressedAlreadyAccount;
  SignUpBodyWidget({
    super.key,
    required this.validationMassagePhoneNumber,
    required this.validationMassageEmail,
    required this.validationMassageFullName,
    required this.validationMassagePassword,
    required this.phoneController,
    required this.onChangedPhoneNumber,
    required this.passwordController,
    required this.formKey,
    required this.emailController,
    required this.nameController,
    required this.onPressedSubmittedFullName,
    required this.onPressedChangedFullName,
    required this.onPressesClosed,
    required this.onSubmittedPhoneNumber,
    required this.onPressedChangedEmail,
    required this.onPressedChangedPassword,
    required this.signUpOnPressed,
    required this.onPressedAlreadyAccount,
  });

  @override
  State<SignUpBodyWidget> createState() => _SignUpBodyWidgetState();
}

class _SignUpBodyWidgetState extends State<SignUpBodyWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SignUpBackgroundWidget(),
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
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: widget.onPressesClosed,
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
                  controller: widget.nameController,
                  errorMSG:widget.validationMassageFullName,
                  text: "Full Name",
                  onSubmitted:widget.onPressedSubmittedFullName,
                  onChanged: widget.onPressedChangedFullName,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFieldWidget(
                  controller: widget.phoneController,
                  text: "Phone Number",
                  errorMSG: widget.validationMassagePhoneNumber,
                  onChanged: widget.onChangedPhoneNumber,
                  onSubmitted:widget.onSubmittedPhoneNumber,
                ),
                const SizedBox(
                  height: 15,
                ),
                EmailTextFiledWidget(
                  controller: widget.emailController,
                  onChangedEmail: widget.onPressedChangedEmail,
                  errorMSG: widget.validationMassageEmail,
                ),
                const SizedBox(
                  height: 15,
                ),
                PasswordTextFieldWidget(
                  controller: widget.passwordController,
                  onChanged: widget.onPressedChangedPassword,
                  errorMSG: widget.validationMassagePassword,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                    "By pressing \"Create account\" you are agreeing to UGP"),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Terms & Conditions",
                        style: TextStyle(
                            color: Color.fromRGBO(3, 106, 130, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        width: 120,
                        height: 0.8,
                        color: const Color.fromRGBO(3, 106, 130, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    height: 50,
                    onPressed: widget.signUpOnPressed,
                    color: const Color.fromRGBO(3, 106, 130, 1),
                    child: const Text(
                      "Create account",
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
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed:widget.onPressedAlreadyAccount,
                        child: const Text(
                          " Sign in",
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

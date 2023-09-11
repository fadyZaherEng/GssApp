import 'package:flutter/material.dart';
import 'package:gss/presentation/screens/home/home_screen.dart';
import 'package:gss/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:gss/presentation/widgets/custom_text_field_widget.dart';
import 'package:gss/presentation/widgets/email_text_filed_widget.dart';
import 'package:gss/presentation/widgets/password_text_field_widget.dart';
import 'package:gss/utils/navigate_with_return.dart';

class SignUpBodyWidget extends StatefulWidget {
  String? validationMassage;
  final GlobalKey<FormState> formKey;
  void Function(String) onChangedPhoneNumber;
  final TextEditingController passwordController;

  final TextEditingController emailController;

  final TextEditingController nameController;

  final TextEditingController phoneController;

  SignUpBodyWidget({
      super.key,
      required this.validationMassage,
      required this.phoneController,
      required this.passwordController,
      required this.formKey,
      required this.emailController,
      required this.nameController,
      required this.onChangedPhoneNumber,
      });
  @override
  State<SignUpBodyWidget> createState() => _SignUpBodyWidgetState();
}

class _SignUpBodyWidgetState extends State<SignUpBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  onPressed: () {},
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
              errorMSG: "Please Enter Your Username",
              text: "Full Name",
              onSubmitted:(val){} ,
              onChanged: (val){},
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFieldWidget(
              controller: widget.phoneController,
              text: "Phone Number",
              errorMSG: widget.validationMassage,
              onChanged: widget.onChangedPhoneNumber,
              onSubmitted: (val){},
            ),
            const SizedBox(
              height: 15,
            ),
            EmailTextFiledWidget(
              controller: widget.emailController,
            ),
            const SizedBox(
              height: 15,
            ),
            PasswordTextFieldWidget(
              controller: widget.passwordController,
              onChanged: (value) {},
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
                //minWidth: double.infinity,
                onPressed: () {
                  //register
                  if (widget.formKey.currentState!.validate()) {
                    //sign up
                    FocusScope.of(context).unfocus();
                    navigateToWithReturn(context, const MyHomePage());
                  }
                },
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
                    onPressed: () {
                      navigateToWithReturn(context, SignInScreen());
                    },
                    child: const Text(
                      " Sign in",
                      style: TextStyle(color: Color.fromRGBO(3, 106, 130, 1)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_events.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_states.dart';
import 'package:gss/presentation/screens/home_screen.dart';
import 'package:gss/presentation/screens/sign_in_screen.dart';
import 'package:gss/presentation/widgets/custom_text_filed_widget.dart';
import 'package:gss/utils/navigate_with_return.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  Icon suffixIcon = const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.grey,
  );
  bool obscure = true;
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                signUpBackground(),
                signUpBody(state),
              ],
            ),
          ),
        );
      },
    );
  }
  void changeVisibilityOfEye() {
    obscure = !obscure;
    if (obscure) {
      suffixIcon = const Icon(
        Icons.remove_red_eye_outlined,
        color: Colors.grey,
      );
    } else {
      suffixIcon = const Icon(
        Icons.visibility_off_outlined,
        color: Colors.grey,
      );
    }
    setState(() {});
  }
  Widget signUpBackground() {
    return Image(
      alignment: AlignmentDirectional.bottomCenter,
      isAntiAlias: false,
      matchTextDirection: true,
      gaplessPlayback: true,
      image: const AssetImage('assets/png/group.png'),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      fit: BoxFit.fitWidth,
    );
  }
  Widget signUpBody(state) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
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
            CustomTextFiledWidget(
              context: context,
              type: TextInputType.text,
              controller: nameController,
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.indigo,
              ),
              text: "Full Name",
              validate: (val) {
                if (val.toString().isEmpty) {
                  return "Please Enter Your Username";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey),
                labelStyle: const TextStyle(
                    color: Colors.grey, fontSize: 15),
                label: const Text("Phone Number"),
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
              style: Theme.of(context).textTheme.bodyText2,
              validator: (val) {
                if (state is ValidatePhoneStates) {
                  return state.res;
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              onChanged: (val) {
                context
                    .read<RegisterBloc>()
                    .add(ValidatePhoneEvents(val: val));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFiledWidget(
                context: context,
                type: TextInputType.emailAddress,
                controller: emailController,
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.indigo,
                ),
                text: "Email Address",
                validate: (val) {
                  if (!EmailValidator.validate(val)) {
                    return "Please Enter Your Valid Email Address";
                  }
                  return null;
                }),
            const SizedBox(
              height: 15,
            ),
            CustomTextFiledWidget(
              context: context,
              type: TextInputType.visiblePassword,
              controller: passwordController,
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.indigo,
              ),
              text: "Password",
              validate: (val) {
                if (val.toString().isEmpty) {
                  return "Password is Very Short";
                }
                return null;
              },
              obscure: obscure,
              suffixIcon: IconButton(
                  onPressed: () {
                    changeVisibilityOfEye();
                  },
                  icon: suffixIcon),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("By pressing \"Create account\" you are agreeing to UGP"),
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
                borderRadius:
                BorderRadiusDirectional.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: MaterialButton(
                height: 50,
                //minWidth: double.infinity,
                onPressed: () {
                  //register
                  if (formKey.currentState!.validate()) {
                    //sign up
                    FocusScope.of(context).unfocus();
                    navigateToWithReturn(
                        context, const MyHomePage());
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
                      navigateToWithReturn(context,const SignInScreen());
                    },
                    child: const Text(
                      " Sign in",
                      style: TextStyle(
                          color: Color.fromRGBO(3, 106, 130, 1)),
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

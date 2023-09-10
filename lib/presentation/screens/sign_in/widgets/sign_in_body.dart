// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_events.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_states.dart';
import 'package:gss/presentation/screens/home/home_screen.dart';
import 'package:gss/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:gss/presentation/widgets/custom_text_filed_widget.dart';
import 'package:gss/utils/navigate_with_return.dart';
import 'package:gss/utils/navigate_without_return.dart';

class SignInBody extends StatefulWidget {
 String?res;


 SignInBody({this.res});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _formKey = GlobalKey<FormState>();
  Icon _suffixIcon = const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.grey,
  );
  LogInBloc get bloc=> BlocProvider.of<LogInBloc>(context);

  bool _obscure = true;

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
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
            TextFormField(
              controller: _phoneController,
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
                return widget.res;
              },
              keyboardType: TextInputType.phone,
              onChanged: (val) {
                bloc.add(ValidatePhoneEventsSignIn(val: val));
              },
            ),
            const SizedBox(
              height: 35,
            ),
            CustomTextFiledWidget(
              context: context,
              type: TextInputType.visiblePassword,
              controller: _passwordController,
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
              obscure: _obscure,
              suffixIcon: IconButton(
                  onPressed: () {
                    changeVisibilityOfEye();
                  },
                  icon: _suffixIcon),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(onPressed: (){

              }, child:const Text("Forget Password?",style: TextStyle(
                  color: Color.fromRGBO(3, 106, 130, 1),
                  fontWeight: FontWeight.normal,
                  fontSize: 13
              ),)),
            ),
            const SizedBox(
              height: 45,
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //sign in
                    navigateToWithoutReturn(context,const MyHomePage());
                  }
                },
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
                    onPressed: () {
                      navigateToWithReturn(
                          context, const SignUpScreen());
                    },
                    child: const Text(
                      "Create Account",
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

  void changeVisibilityOfEye() {
    _obscure = !_obscure;
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

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_events.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_states.dart';
import 'package:gss/presentation/screens/home/home_screen.dart';
import 'package:gss/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:gss/presentation/widgets/custom_text_field_widget.dart';
import 'package:gss/presentation/widgets/email_text_filed_widget.dart';
import 'package:gss/presentation/widgets/password_text_field_widget.dart';
import 'package:gss/utils/navigate_with_return.dart';

class SignUpBodyWidget extends StatefulWidget {
  String?res;


  SignUpBodyWidget({this.res});

  @override
  State<SignUpBodyWidget> createState() => _SignUpBodyWidgetState();
}

class _SignUpBodyWidgetState extends State<SignUpBodyWidget> {
  final _formKey = GlobalKey<FormState>();

  Icon _suffixIcon = const Icon(
    Icons.remove_red_eye_outlined,
    color: Colors.grey,
  );

  bool _obscure = true;
  RegisterBloc get bloc=> BlocProvider.of<RegisterBloc>(context);

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

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
              controller: _nameController,
              errorMSG: "Please Enter Your Username",
              text: "Full Name",
            ),
            const SizedBox(
              height: 15,
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
                enabledBorder: OutlineInputBorder(
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
              validator: (val) {
                return widget.res;
              },
              keyboardType: TextInputType.phone,
              onChanged: (val) {
                bloc.add(ValidatePhoneEvents(val: val));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            EmailTextFiledWidget(
                controller: _emailController,
                ),
            const SizedBox(
              height: 15,
            ),
            PasswordTextFieldWidget(
              controller: _passwordController,
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
                borderRadius:
                BorderRadiusDirectional.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: MaterialButton(
                height: 50,
                //minWidth: double.infinity,
                onPressed: () {
                  //register
                  if (_formKey.currentState!.validate()) {
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
                      navigateToWithReturn(context,  SignInScreen());
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

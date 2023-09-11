// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/register_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_events.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_states.dart';
import 'package:gss/presentation/screens/sign_up/widgets/sign_up_background_widget.dart';
import 'package:gss/presentation/screens/sign_up/widgets/sign_up_body_widget.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _validationMassage;

  final _formKey = GlobalKey<FormState>();

  RegisterBloc get bloc=> BlocProvider.of<RegisterBloc>(context);

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterStates>(
      listener: (context, state) {
        if(state is ValidatePhoneStates){
          _validationMassage=state.validationMassage;
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                const SignUpBackgroundWidget(),
                SignUpBodyWidget(
                validationMassage:_validationMassage,
                phoneController: _phoneController,
                passwordController: _passwordController,
                onChangedPhoneNumber:  (val) {
                  bloc.add(ValidatePhoneEvents(val: val??""));
                }, emailController: _emailController,
                  formKey: _formKey,
                  nameController: _nameController,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_events.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_states.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_background_widget.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_body_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? _validationMessage;
  final _formKey = GlobalKey<FormState>();

  SignInBloc get _bloc => BlocProvider.of<SignInBloc>(context);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInValidatePhoneNumberState) {
          _validationMessage = state.validationMassage;
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                /// You have body here why you set two widgets
                /// shold be one widget SignInBodyWidget and this contain also SignInBackgroundWidget and rest body
                const SignInBackgroundWidget(),
                SignInBodyWidget(
                  formKey: _formKey,

                  ///change to value not val
                  onChangePhoneNumber: (val) {
                    _bloc.add(SignInValidatePhoneNumberEvent(
                        validatePhoneNumber: val));
                  },
                  passwordController: _passwordController,
                  phoneController: _phoneController,
                  onSubmittedPhoneNumber: (val) {},
                  validationMessage: _validationMessage,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// After finish this comments reformate code
}

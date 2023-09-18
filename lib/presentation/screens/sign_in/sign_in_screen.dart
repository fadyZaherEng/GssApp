// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/app/di.dart';
import 'package:gss/domain/models/login_models/login_response/LoginResponseModel.dart';
import 'package:gss/domain/usecase/login_usecase.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:gss/presentation/screens/home/home_screen.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_body_widget.dart';
import 'package:gss/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:gss/utils/navigate_with_return.dart';
import 'package:gss/utils/navigate_without_return.dart';
import 'package:gss/utils/show_toast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? _validationMessagePhone;
  String? _validationMessagePassword;
  final _formKey = GlobalKey<FormState>();
  LoginResponseModel? loginResponseModel;
  SignInBloc get _bloc => BlocProvider.of<SignInBloc>(context);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, AbstractionSignInState>(
      listener: (context, state) {
        if (state is SignInValidatePhoneNumberState) {
          _validationMessagePhone = state.validationMassage;
        }
        if (state is SignInChangePasswordStates) {
          _validationMessagePassword = state.validationMassage;
        }
        if (state is SignInSuccessState) {
          loginResponseModel = state.loginResponseModel;
          if(state.loginResponseModel.responseCode==1){
            navigateToWithoutReturn(
              context: context,
              screen: const HomeScreen(),
            );
            showToast(message: state.loginResponseModel.responseMessage.toString(), state: ToastState.SUCCESS);
          }else{
            showToast(message: state.loginResponseModel.responseMessage.toString(), state: ToastState.ERROR);
          }
        }
        if (state is SignInNavigateToHomeScreenState) {
          _validationMessagePassword = state.signInValidationModel.validationMassagePassword;
          _validationMessagePhone = state.signInValidationModel.validationMassagePhoneNumber;
        }
        if (state is SignInNavigateToSignUpScreenState) {
          navigateToWithReturn(
            context: context,
            screen: const SignUpScreen(),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SignInBodyWidget(
              formKey: _formKey,
              onChangePhoneNumber: (value) {
                _bloc.add(
                    SignInValidatePhoneNumberEvent(validatePhoneNumber: value));
              },
              passwordController: _passwordController,
              phoneController: _phoneController,
              onSubmittedPhoneNumber: (String value) {
                _bloc.add(
                    SignInSubmittedPhoneNumberEvent(signInPhoneNumber: value));
              },
              validationMessagePassword: _validationMessagePassword,
              validationMessagePhone: _validationMessagePhone,
              onChangePassword: (String value) {
                _bloc.add(SignInChangePasswordEvent(signInPassword: value));
              },
              onPressedClosed: () {
                _bloc.add(SignInPressedClosedEvent());
              },
              onPressedForgetPassword: () {
                _bloc.add(SignInPressedForgetPasswordEvent(
                    signInPhoneNumber: _phoneController.text));
              },
              navigateToHomeScreen: () {
                _bloc.add(
                  SignInEvent(
                      logInPhone: _phoneController.text,
                      logInPassword: _passwordController.text,
                      logInUseCase:instance<LogInUseCase>()
                  ),
                );
              },
              navigateToSignUpScreen: () {
                _bloc.add(
                  SignInNavigateToSignUpScreenEvent(
                    context: context,
                    screen: const SignUpScreen(),
                  ),
                );
              },
              onPressedChangeLanguage: () {
                _bloc.add(SignInChangeLangEvent(context: context));
              },
            ),
          ),
        );
      },
    );
  }
}

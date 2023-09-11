import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:gss/utils/navigate_with_return.dart';
import 'package:gss/utils/navigate_without_return.dart';

class SignInBloc extends Bloc<AbstractSignInEvent, AbstractionSignInState> {
  SignInBloc() : super(SignInInitialStates()) {
    on<SignInEvent>(_onSignInSuccessEvent);
    on<SignInValidatePhoneNumberEvent>(_onSignInValidatePhoneNumberEvent);
    on<SignInSubmittedPhoneNumberEvent>(_onSignInSubmittedPhoneNumberEvent);
    on<SignInPressedForgetPasswordEvent>(_onSignInPressedForgetPasswordEvent);
    on<SignInPressedClosedEvent>(_onSignInPressedClosedEvent);
    on<SignInChangePasswordEvent>(_onSignInChangePasswordEvent);
    on<SignInNavigateToHomeScreenEvent>(_onSignInNavigateToHomeScreenEvent);
    on<SignInNavigateToSignUpScreenEvent>(_onSignInNavigateToSignUpScreenEvent);
  }

  Future<String?> checkValidateMobile(value) async {
    return validateMobile(value);
  }

  String? validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  FutureOr<void> _onSignInSuccessEvent(
      SignInEvent event, Emitter<AbstractionSignInState> emit) async {
    emit(SignInLoadingStates());
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInSuccessState());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInValidatePhoneNumberEvent(
      SignInValidatePhoneNumberEvent event,
      Emitter<AbstractionSignInState> emit) async {
    emit(SignInLoadingStates());
    await Future.delayed(const Duration(milliseconds: 200));
    await checkValidateMobile(event.validatePhoneNumber).then((value) {
      emit(SignInValidatePhoneNumberState(validationMassage: value));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInSubmittedPhoneNumberEvent(
      SignInSubmittedPhoneNumberEvent event,
      Emitter<AbstractionSignInState> emit)async {
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInSubmittedPhoneNumberStates());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInPressedForgetPasswordEvent(
      SignInPressedForgetPasswordEvent event,
      Emitter<AbstractionSignInState> emit) async{
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInPressedForgetPasswordStates("25555"));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInPressedClosedEvent(
      SignInPressedClosedEvent event, Emitter<AbstractionSignInState> emit) async{
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInPressedClosedStates());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInChangePasswordEvent(
      SignInChangePasswordEvent event, Emitter<AbstractionSignInState> emit) async{
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInChangePasswordStates("Ok"));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInNavigateToHomeScreenEvent(
      SignInNavigateToHomeScreenEvent event,
      Emitter<AbstractionSignInState> emit)async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      navigateToWithoutReturn(
        context:event.context,
        screen: event.screen,
        validate: event.validate,
      );
      emit(SignInNavigateToHomeScreenStates());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInNavigateToSignUpScreenEvent(
      SignInNavigateToSignUpScreenEvent event,
      Emitter<AbstractionSignInState> emit)async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      navigateToWithReturn(
        context:event.context,
        screen: event.screen,
        validate: event.validate,
      );
      emit(SignInNavigateToSignUpScreenStates());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }
}

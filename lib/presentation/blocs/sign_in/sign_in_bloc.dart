// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gss/data/network/cashe_helper.dart';
import 'package:gss/domain/models/sign_in_validation_model.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_state.dart';


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
    on<SignInChangeLangEvent>(_onSignInChangeLangEvent);
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
    emit(SignInLoadingState());
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInSuccessState());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInValidatePhoneNumberEvent(
      SignInValidatePhoneNumberEvent event,
      Emitter<AbstractionSignInState> emit) async {
    emit(SignInLoadingState());
    await Future.delayed(const Duration(milliseconds: 200));
    await checkValidateMobile(event.validatePhoneNumber).then((value) {
      emit(SignInValidatePhoneNumberState(validationMassage: value));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInSubmittedPhoneNumberEvent(
      SignInSubmittedPhoneNumberEvent event,
      Emitter<AbstractionSignInState> emit) async {
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInSubmittedPhoneNumberState());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInPressedForgetPasswordEvent(
      SignInPressedForgetPasswordEvent event,
      Emitter<AbstractionSignInState> emit) async {
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInPressedForgetPasswordState("25555"));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInPressedClosedEvent(SignInPressedClosedEvent event,
      Emitter<AbstractionSignInState> emit) async {
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInPressedClosedState());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInChangePasswordEvent(SignInChangePasswordEvent event,
      Emitter<AbstractionSignInState> emit) async {
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      String? validationMassage;
      if (event.signInPassword.toString().length < 7) {
        validationMassage = "Password is very Short";
      } else {
        validationMassage = null;
      }
      emit(SignInChangePasswordStates(validationMassage: validationMassage));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInNavigateToHomeScreenEvent(
      SignInNavigateToHomeScreenEvent event,
      Emitter<AbstractionSignInState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) async {
      SignInValidationModel signInValidationModel = SignInValidationModel();
      signInValidationModel.validationMassagePhoneNumber =
          await checkValidateMobile(event.phone);
      String? validationMassage;
      if (event.password.toString().length < 7) {
        signInValidationModel.validationMassagePassword =
            "Password is very Short";
      } else {
        signInValidationModel.validationMassagePassword = null;
      }
      emit(SignInNavigateToHomeScreenState(
          signInValidationModel: signInValidationModel));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInNavigateToSignUpScreenEvent(
      SignInNavigateToSignUpScreenEvent event,
      Emitter<AbstractionSignInState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      emit(SignInNavigateToSignUpScreenState());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }


  FutureOr<void> _onSignInChangeLangEvent(
      SignInChangeLangEvent event, Emitter<AbstractionSignInState> emit) {
  Future.delayed(const Duration(milliseconds: 100))
  .then((value) {
    if (SharedHelper.get(key: 'lang') == 'arabic') {
      SharedHelper.save(value: 'english', key: 'lang');
      event.context.setLocale(const Locale('en', 'US'));
    } else {
      SharedHelper.save(value: 'arabic', key: 'lang');
      event.context.setLocale(const Locale('ar', 'SA'));
    }
    Phoenix.rebirth(event.context);
    emit(SignInChangeLangState());
  })
  .catchError((onError){
    emit(SignInErrorState());
  });
  }
}

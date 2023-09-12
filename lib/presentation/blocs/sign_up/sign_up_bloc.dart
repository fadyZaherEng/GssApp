// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/app/constants.dart';
import 'package:gss/domain/models/sign_up_validation_model.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_state.dart';
import 'package:gss/utils/navigate_with_return.dart';
import 'package:gss/utils/navigate_without_return.dart';

class SignUpBloc extends Bloc<AbstractionSignUpEvent, AbstractionSignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    //sign up
    on<SignUpEvents>(_onSignUpEvents);
    //already have account
    on<SignUpAlreadyHaveAccountEvent>(_onSignUpAlreadyHaveAccountEvent);
    //phone
    on<SignUpValidatePhoneEvents>(_onValidate);
    on<SignUpSubmittedPhoneNumberEvents>(_onSignUpSubmittedPhoneNumberEvent);
    on<SignUpChangedFullNameEvents>(_onSignUpChangedFullNameEvent);
    //sign up
    on<SignUpPressedClosedEvent>(_onSignUpPressedClosedEvent);
    on<SignUpNavigateToSignInScreenEvent>(_onSignUpNavigateToSignInScreenEvent);
    //full name
    on<SignUpValidateFullNameEvents>(_onSignUpValidateFullNameEvents);
    on<SignUpSubmittedFullNameEvents>(_onSignUpSubmittedFullNameEvent);
    //email
    on<SignUpChangedEmailEvents>(_onSignUpChangedEmailEvent);
    //password
    on<SignUpChangedPasswordEvents>(_onSignUpChangedPasswordEvent);
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

  FutureOr<void> _onSignUpEvents(
      SignUpEvents event, Emitter<AbstractionSignUpState> emit) async {
    emit(SignUpLoadingState());
    await Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      SignUpValidationModel validationModel = SignUpValidationModel();
      validationModel.validationMassagePhoneNumber =
          await checkValidateMobile(event.phone);
      validationModel.validationMassagePassword =
          (event.password.length < 7) ? "Password is Very Short" : null;
      validationModel.validationMassageEmail =
          (!EmailValidator.validate(event.email))
              ? "Please Enter Your Valid Email Address"
              : null;
      validationModel.validationMassageFullName =
          (event.name.isEmpty || event.name.length < 3)
              ? "Please Enter Valid Your Full Name"
              : null;
      if(validationModel.validationMassagePhoneNumber==null&&
      validationModel.validationMassagePassword==null&&
      validationModel.validationMassageEmail==null&&
      validationModel.validationMassageFullName==null) {
        //here register methods
        navigateToWithoutReturn(
          context: event.context,
          screen: event.screen,
        );
        emit(SignUpNavigateToHomeScreenState(validationModel));
      }else{
        emit(SignUpNavigateToHomeScreenState(validationModel));
      }
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  Future<void> _onValidate(SignUpValidatePhoneEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    emit(SignUpInitialState());
    await Future.delayed(const Duration(seconds: 1)).then((value) async {
      await checkValidateMobile(event.signUpPhoneNumber).then((value) {
        emit(SignUpValidatePhoneNumberState(validationMassage: value));
      }).catchError((onError) {
        emit(SignUpErrorState());
      });
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpSubmittedPhoneNumberEvent(
      SignUpSubmittedPhoneNumberEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      emit(SignUpSubmittedPhoneNumberState());
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpPressedClosedEvent(SignUpPressedClosedEvent event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      emit(SignUpPressedClosedState());
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpNavigateToSignInScreenEvent(
      SignUpNavigateToSignInScreenEvent event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      navigateToWithReturn(
        context: event.context,
        screen: event.screen,
      );
      emit(SignUpNavigateToSignInScreenState());
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpValidateFullNameEvents(
      SignUpValidateFullNameEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validationMassage;
      if (event.signUpFullName.toString().isEmpty ||
          event.signUpFullName.toString().length < 3) {
        validationMassage = "Please Enter Valid Your Full Name";
      } else {
        validationMassage = null;
      }
      emit(SignUpValidateFullNameState(validationMassage: validationMassage));
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpSubmittedFullNameEvent(
      SignUpSubmittedFullNameEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validationMassage;
      if (event.signUpFullName.toString().isEmpty ||
          event.signUpFullName.toString().length < 3) {
        validationMassage = "Please Enter Valid Your Full Name";
      } else {
        validationMassage = null;
      }
      emit(SignUpValidateFullNameState(validationMassage: validationMassage));
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpChangedFullNameEvent(
      SignUpChangedFullNameEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validationMassage;
      if (event.signUpFullName.toString().isEmpty ||
          event.signUpFullName.toString().length < 3) {
        validationMassage = "Please Enter Valid Your Full Name";
      } else {
        validationMassage = null;
      }
      emit(SignUpValidateFullNameState(validationMassage: validationMassage));
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpChangedEmailEvent(SignUpChangedEmailEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validateMassage;
      if (!EmailValidator.validate(event.signUpEmail)) {
        validateMassage = "Please Enter Your Valid Email Address";
      } else {
        validateMassage = null;
      }
      emit(SignUpChangedEmailState(validateMassage: validateMassage));
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpChangedPasswordEvent(
      SignUpChangedPasswordEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      String? validationPassword;
      if (event.signUpPassword.toString().length < 7) {
        validationPassword = "Password is Very Short";
      } else {
        validationPassword = null;
      }
      emit(SignUpChangedPasswordState(validateMassage: validationPassword));
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpAlreadyHaveAccountEvent(
      SignUpAlreadyHaveAccountEvent event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      navigateToWithReturn(
          context: event.context,
          screen: event.screen,
          );
      emit(SignUpNavigateToSignInScreenState());
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }
}

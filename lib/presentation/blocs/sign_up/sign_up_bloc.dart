import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/app/constants.dart';
import 'package:gss/domain/models/validation_model.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_state.dart';
import 'package:gss/utils/navigate_with_return.dart';
import 'package:gss/utils/navigate_without_return.dart';

class SignUpBloc extends Bloc<AbstractionSignUpEvent, AbstractionSignUpState> {
  SignUpBloc() : super(SignUpInitialStates()) {
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
    emit(SignUpLoadingStates());
    await Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      ValidationModel validationModel =  ValidationModel();
      validationModel.validationMassagePhoneNumber =await checkValidateMobile(event.phone);
      validationModel.validationMassagePassword = (event.password.length < 7)
              ? "Password is Very Short" : null;
      validationModel.validationMassageEmail = (!EmailValidator.validate(event.email))
              ? "Please Enter Your Valid Email Address" : null;
      validationModel.validationMassageFullName = (event.name.isEmpty || event.name.length < 3)
              ? "Please Enter Valid Your Full Name" : null;
      //here register methods
       navigateToWithoutReturn(
         context: event.context,
         screen: event.screen,
         validate: event.validate,
       );
       emit(SignUpNavigateToHomeScreenStates(validationModel));
    }).catchError((onError) {
      emit(SignUpErrorStates());
    });
  }

  Future<void> _onValidate(SignUpValidatePhoneEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    emit(SignUpInitialStates());
    await Future.delayed(const Duration(seconds: 1)).then((value) async {
      await checkValidateMobile(event.signUpPhoneNumber).then((value) {
        emit(SignUpValidatePhoneNumberStates(validationMassage: value));
      }).catchError((onError) {
        emit(SignUpErrorStates());
      });
    }).catchError((onError) {
      emit(SignUpErrorStates());
    });
  }

  FutureOr<void> _onSignUpSubmittedPhoneNumberEvent(
      SignUpSubmittedPhoneNumberEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      emit(SignUpSubmittedPhoneNumberStates());
    }).catchError((onError) {
      emit(SignUpErrorStates());
    });
  }

  FutureOr<void> _onSignUpPressedClosedEvent(SignUpPressedClosedEvent event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      emit(SignUpPressedClosedStates());
    }).catchError((onError) {
      emit(SignUpErrorStates());
    });
  }

  FutureOr<void> _onSignUpNavigateToSignInScreenEvent(
      SignUpNavigateToSignInScreenEvent event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      navigateToWithReturn(
          context: event.context,
          screen: event.screen,
          validate: event.validate,
      );
      emit(SignUpNavigateToSignInScreenStates());
    }).catchError((onError) {
      emit(SignUpErrorStates());
    });
  }

  FutureOr<void> _onSignUpValidateFullNameEvents(
      SignUpValidateFullNameEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validationMassage;
      if (event.signUpFullName.toString().isEmpty ||event.signUpFullName.toString().length < 3) {
        validationMassage = "Please Enter Valid Your Full Name";
      } else {
        validationMassage = null;
      }
      emit(SignUpValidateFullNameStates(validationMassage: validationMassage));
    }).catchError((onError) {
      emit(SignUpErrorStates());
    });
  }

  FutureOr<void> _onSignUpSubmittedFullNameEvent(
      SignUpSubmittedFullNameEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validationMassage;
      if (event.signUpFullName.toString().isEmpty || event.signUpFullName.toString().length < 3) {
        validationMassage = "Please Enter Valid Your Full Name";
      } else {
        validationMassage = null;
      }
      emit(SignUpValidateFullNameStates(validationMassage: validationMassage));
    }).catchError((onError) {
      emit(SignUpErrorStates());
    });
  }

  FutureOr<void> _onSignUpChangedFullNameEvent(
      SignUpChangedFullNameEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validationMassage;
      if (event.signUpFullName.toString().isEmpty || event.signUpFullName.toString().length < 3) {
        validationMassage = "Please Enter Valid Your Full Name";
      } else {
        validationMassage = null;
      }
      emit(SignUpValidateFullNameStates(validationMassage: validationMassage));
    }).catchError((onError) {
      emit(SignUpErrorStates());
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
      emit(SignUpChangedEmailStates(validateMassage: validateMassage));
    }).catchError((onError) {
      emit(SignUpErrorStates());
    });
  }

  FutureOr<void> _onSignUpChangedPasswordEvent(
      SignUpChangedPasswordEvents event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      String? validationPassword;
      if (event.signUpPassword.toString().length<7) {
        validationPassword= "Password is Very Short";
      }else{
        validationPassword=null;
      }
      emit(SignUpChangedPasswordStates(validateMassage: validationPassword));
    }).catchError((onError) {
      emit(SignUpErrorStates());
    });
  }

  FutureOr<void> _onSignUpAlreadyHaveAccountEvent(
      SignUpAlreadyHaveAccountEvent event,
      Emitter<AbstractionSignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      navigateToWithReturn(
          context: event.context,
          screen: event.screen,
          validate: event.validate);
      emit(SignUpNavigateToSignInScreenStates());
    }).catchError((onError) {
      emit(SignUpErrorStates());
    });
  }
}

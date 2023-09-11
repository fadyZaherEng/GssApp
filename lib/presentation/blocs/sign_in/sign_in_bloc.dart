import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_events.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialStates()) {
    on<SignInSuccessEvent>(_onSignInSuccessEvent);
    on<SignInValidatePhoneNumberEvent>(_onSignInValidatePhoneNumberEvent);
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
      SignInEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingStates());
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInSuccessState());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }
  FutureOr<void> _onSignInValidatePhoneNumberEvent(
      SignInValidatePhoneNumberEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingStates());
    await Future.delayed(const Duration(seconds: 1));
    await checkValidateMobile(event.validatePhoneNumber).then((value) {
      emit(SignInValidatePhoneNumberState(validationMassage: value));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }
}

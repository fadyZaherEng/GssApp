import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_events.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_states.dart';
class RegisterBloc extends Bloc<RegisterEvents,RegisterStates>{
  RegisterBloc():super(InitialRegisterStates()){
    on<SignUpEvents>(_onSignUpEvents);
    on<ValidatePhoneEvents>(_onValidate);
  }
  Future<void> signUp()async{
    //here register methods
  }
  Future<String?> checkValidateMobile(value)async{
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

  FutureOr<void> _onSignUpEvents(SignUpEvents event, Emitter<RegisterStates> emit)async {
    emit(LoadingRegisterStates());
    await Future.delayed(const Duration(seconds: 1))
    .then((value) {
      signUp().then((value) {
        emit(SuccessRegisterStates());
      }).catchError((onError){
        emit(ErrorRegisterStates());
      });
    })
    .catchError((onError){
      emit(ErrorRegisterStates());
    });
  }

  FutureOr<void> _onValidate(ValidatePhoneEvents event, Emitter<RegisterStates> emit)async {
    emit(InitialRegisterStates());
   await Future.delayed(const Duration(seconds: 1))
    .then((value)async {
    await  checkValidateMobile(event.val).then((value) {
        emit(ValidatePhoneStates(res: value));
      }).catchError((onError){
        emit(ErrorRegisterStates());
      });
    })
    .catchError((onError){
      emit(ErrorRegisterStates());
    });
  }
}
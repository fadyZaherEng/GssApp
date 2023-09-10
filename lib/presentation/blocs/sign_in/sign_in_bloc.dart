import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_events.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_states.dart';

/// Change any Login to Sign in , bloc ,event state
class LogInBloc extends Bloc<LogInEvents,LogInStates>{
  LogInBloc():super(InitialLogINStates()){
    on<AppLogInEvent>(_onAppLogInEvent);
   on<ValidatePhoneEventsSignIn>(_onValidatePhoneEventsSignIn);
  }
  /// if we don't need this remove it
  ///
  Future<void> signIn()async{
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

  FutureOr<void> _onAppLogInEvent(AppLogInEvent event, Emitter<LogInStates> emit) async{
    emit(LoadingLogINStates());
    await Future.delayed(const Duration(seconds: 1))
        .then((value) {
      emit(SuccessLogINStates());
    })
        .catchError((onError){
      emit(ErrorLogINStates());
    });
  }

  FutureOr<void> _onValidatePhoneEventsSignIn(ValidatePhoneEventsSignIn event, Emitter<LogInStates> emit)async {
    emit(LoadingLogINStates());
   await Future.delayed(const Duration(seconds: 1));
     await checkValidateMobile(event.val).then((value) {
        emit(ValidatePhoneLoginStates(res: value));
      }).catchError((onError){
        emit(ErrorLogINStates());
      });
  }
}
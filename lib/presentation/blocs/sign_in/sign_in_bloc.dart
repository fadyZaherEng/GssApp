// ignore_for_file: use_build_context_synchronously, avoid_print
import 'dart:async';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gss/data/network/cashe_helper.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_request/LogInRequestModel.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_validation_model.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gss/utils/show_toast.dart';

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
   if(value.toString().length<8){
     return 'Please enter valid mobile number';
   }
    return null;
  }

  FutureOr<void> _onSignInSuccessEvent(
      SignInEvent event, Emitter<AbstractionSignInState> emit) async {
    emit(SignInLoadingState());
    await Future.delayed(const Duration(milliseconds: 100)).then((value)async {
      SignInValidationModel signInValidationModel = SignInValidationModel();
      signInValidationModel.validationMassagePhoneNumber = await checkValidateMobile(event.logInPhone);
      if (event.logInPassword.toString().length <6) {
        signInValidationModel.validationMassagePassword =
        "Password is very Short";
      } else {
        signInValidationModel.validationMassagePassword = null;
      }
     if(signInValidationModel.validationMassagePassword==null&&
         signInValidationModel.validationMassagePhoneNumber==null){
       LogInRequestModel logInRequestModel=LogInRequestModel.fromJson(
           {
             "ip": "",
             "deviceSerial": "e4JZvB7TTPaTtSYYV80xZK:APA91bGn0KTFF8qA8YeGFxCKCjjTXYH_0XAJ2k7O6KifzbZ1dk-FMx1wcEbvbJ60R_XZu4ag1dWmeC-4E0lNlp98I1cVIxqtfQbAW1qAYbwExqp4x_T_M18dY0Xwh2q34XgMOG9atoS9",
             "notificationToken": "e4JZvB7TTPaTtSYYV80xZK:APA91bGn0KTFF8qA8YeGFxCKCjjTXYH_0XAJ2k7O6KifzbZ1dk-FMx1wcEbvbJ60R_XZu4ag1dWmeC-4E0lNlp98I1cVIxqtfQbAW1qAYbwExqp4x_T_M18dY0Xwh2q34XgMOG9atoS9",
             "osversion": "Device model: Android SDK built for x86 ,Android version: 8.0.0 , Api level: 26",
             "appLanguage": "en",
             "appversion": "1.0.8",
             "CurrencyId": 0,  // come from GetCurrency End-Point
             "MeasureUnitId": 0, // come from GetMeasureUnits End-Point
             "CountryId": 1, // Country Id  come from countryList End-Point
             "deviceType": 2,
             "userId": 0,
             "SubscriberId": 2,
             "isWeb": false,
             "data": {
               "mobile":event.logInPhone,//"555555555",
               "password":event.logInPassword//"7654321"
             }
           }
       );
       (await event.logInUseCase.execute(logInRequestModel))
           .fold((failure) {
         // left -> failure
         showToast(message: failure.message, state: ToastState.ERROR);
         emit(SignInErrorState());
       }, (response) {
         // right -> data (success)
         // content
         emit(SignInSuccessState(loginResponseModel: response));
       });
     }
     else{
       emit(SignInNavigateToHomeScreenState(signInValidationModel: signInValidationModel));
     }
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
      signInValidationModel.validationMassagePhoneNumber = await checkValidateMobile(event.phone);
      if (event.password.toString().length < 7) {
        signInValidationModel.validationMassagePassword =
            "Password is very Short";
      } else {
        signInValidationModel.validationMassagePassword = null;
      }
      emit(SignInNavigateToHomeScreenState(signInValidationModel: signInValidationModel));
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
      SignInChangeLangEvent event, Emitter<AbstractionSignInState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      if (SharedHelper.get(key: 'lang') == 'arabic') {
        SharedHelper.save(value: 'english', key: 'lang');
        AppLocalizations.delegate.load(const Locale("en"));
        emit(SignInChangeLangState(const Locale("en")));
        Phoenix.rebirth(event.context);
      } else {
        SharedHelper.save(value: 'arabic', key: 'lang');
        AppLocalizations.delegate.load(const Locale("ar"));
        emit(SignInChangeLangState(const Locale("ar")));
        Phoenix.rebirth(event.context);
      }
    }).catchError((onError) {
      showToast(message: onError.toString(), state: ToastState.ERROR);
      emit(SignInErrorState());
    });
  }
}
//service
//repository
//use case
//bloc
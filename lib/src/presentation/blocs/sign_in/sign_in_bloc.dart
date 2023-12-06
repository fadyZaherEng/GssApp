// ignore_for_file: use_build_context_synchronously, avoid_print, invalid_use_of_visible_for_testing_member
import 'dart:async';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gss/src/core/utils/constants/nums.dart';
import 'package:gss/src/core/utils/show_toast.dart';
import 'package:gss/src/data/sources/local/cashe_helper.dart';
import 'package:gss/src/domain/entities/requests/sign_in_request/sign_in_request_model.dart';
import 'package:gss/src/domain/entities/sign_in_models/sign_in_validation_model.dart';
import 'package:gss/src/domain/usecase/sign_in_validation_use_case.dart';
import 'package:gss/src/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:gss/src/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  FutureOr<void> _onSignInSuccessEvent(
      SignInEvent event, Emitter<AbstractionSignInState> emit) async {
    emit(SignInLoadingState());
    await Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      login(event);
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInValidatePhoneNumberEvent(
      SignInValidatePhoneNumberEvent event,
      Emitter<AbstractionSignInState> emit) async {
    emit(SignInLoadingState());
    await Future.delayed(const Duration(milliseconds: 200));
    SignInValidationUseCase signInValidationUseCase = SignInValidationUseCase();
    await signInValidationUseCase
        .checkValidateMobile(event.validatePhoneNumber)
        .then((value) {
      emit(SignInValidatePhoneNumberState(signInPhoneValidationMassage: value));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  SignInValidationUseCase signInValidationUseCase = SignInValidationUseCase();

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
      emit(SignInChangePasswordStates(
          signInPasswordValidationMassage:
              signInValidationUseCase.validatePassword(event.signInPassword)));
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
          await signInValidationUseCase.checkValidateMobile(event.signInPhone);
      signInValidationModel.validationMassagePassword =
          signInValidationUseCase.validatePassword(event.signInPassword);
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
      SignInChangeLangEvent event, Emitter<AbstractionSignInState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      //  changeLang(event);
      if (SharedHelper.get(key: 'lang') == 'arabic') {
        SharedHelper.save(value: 'english', key: 'lang');
        AppLocalizations.delegate.load(const Locale('en'));
        emit(SignInChangeLangState(const Locale("en")));
        Phoenix.rebirth(event.context);
      } else {
        SharedHelper.save(value: 'arabic', key: 'lang');
        AppLocalizations.delegate.load(const Locale('ar'));
        emit(SignInChangeLangState(const Locale("ar")));
        Phoenix.rebirth(event.context);
      }
    }).catchError((onError) {
      showToast(message: onError.toString(), state: ToastState.ERROR);
      print(onError.toString());
      emit(SignInErrorState());
    });
  }

  void changeLang(SignInChangeLangEvent event) {
    if (SharedHelper.get(key: 'lang') == 'arabic') {
      SharedHelper.save(value: 'english', key: 'lang');
      AppLocalizations.delegate.load(const Locale('en'));
      emit(SignInChangeLangState(const Locale("en")));
      Phoenix.rebirth(event.context);
    } else {
      SharedHelper.save(value: 'arabic', key: 'lang');
      AppLocalizations.delegate.load(const Locale('ar'));
      emit(SignInChangeLangState(const Locale("ar")));
      Phoenix.rebirth(event.context);
    }
  }

  void login(SignInEvent event) async {
    SignInValidationModel signInValidationModel = SignInValidationModel();
    signInValidationModel.validationMassagePhoneNumber =
        await signInValidationUseCase.checkValidateMobile(event.signInPhone);
    signInValidationModel.validationMassagePassword =
        signInValidationUseCase.validatePassword(event.signInPassword);
    if (signInValidationModel.validationMassagePassword == null &&
        signInValidationModel.validationMassagePhoneNumber == null) {
      SignInRequestModel logInRequestModel = SignInRequestModel.fromMap({
        "ip": "",
        "deviceSerial":
            "e4JZvB7TTPaTtSYYV80xZK:APA91bGn0KTFF8qA8YeGFxCKCjjTXYH_0XAJ2k7O6KifzbZ1dk-FMx1wcEbvbJ60R_XZu4ag1dWmeC-4E0lNlp98I1cVIxqtfQbAW1qAYbwExqp4x_T_M18dY0Xwh2q34XgMOG9atoS9",
        "notificationToken":
            "e4JZvB7TTPaTtSYYV80xZK:APA91bGn0KTFF8qA8YeGFxCKCjjTXYH_0XAJ2k7O6KifzbZ1dk-FMx1wcEbvbJ60R_XZu4ag1dWmeC-4E0lNlp98I1cVIxqtfQbAW1qAYbwExqp4x_T_M18dY0Xwh2q34XgMOG9atoS9",
        "osversion":
            "Device model: Android SDK built for x86 ,Android version: 8.0.0 , Api level: 26",
        "appLanguage": "en",
        "appversion": "1.0.8",
        "CurrencyId": 0, // come from GetCurrency End-Point
        "MeasureUnitId": 0, // come from GetMeasureUnits End-Point
        "CountryId": 1, // Country Id  come from countryList End-Point
        "deviceType": 2,
        "userId": 0,
        "SubscriberId": 2,
        "isWeb": false,
        "data": {
          "mobile": event.signInPhone, //"555555555",
          "password": event.signInPassword //"7654321"
        }
      });
      (await event.signInUseCase.execute(logInRequestModel)).fold((failure) {
        // left -> failure
        showToast(message: failure.message, state: ToastState.ERROR);
        emit(SignInErrorState());
      }, (response) {
        // right -> data (success)
        // content
        emit(SignInSuccessState(signInResponseModel: response));
      });
    } else {
      emit(SignInNavigateToHomeScreenState(
          signInValidationModel: signInValidationModel));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_events.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_states.dart';


class LogInBloc extends Bloc<LogInEvents,LogInStates>{
  LogInBloc():super(InitialLogINStates()){
    //login
    on<AppLogInEvent>((event, emit) {
      emit(LoadingLogINStates());
      signIn().then((value) {
        emit(SuccessLogINStates());
      }).catchError((onError){
        emit(ErrorLogINStates());
      });
    });
    //phone
    on<ValidatePhoneEventsSignIn>((event, emit) async{
      emit(LoadingLogINStates());
      checkValidateMobile(event.val).then((value) {
        emit(ValidatePhoneLoginStates(res: value));
      }).catchError((onError){
        emit(ErrorLogINStates());
      });
    });
  }
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
}
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/src/config/themes/dark_theme.dart';
import 'package:gss/src/config/themes/light_theme.dart';
import 'package:gss/src/core/utils/constants/nums.dart';
import 'package:gss/src/data/sources/local/cashe_helper.dart';
import 'package:gss/src/presentation/blocs/theme/theme_event.dart';
import 'package:gss/src/presentation/blocs/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(InitialTheme()) {
    on<GetCurrentThemeEvent>(_onGetCurrentThemeEvent);
    on<ThemeChangedEvent>(_onThemeChangedEvent);
  }

  FutureOr<void> _onGetCurrentThemeEvent(
      GetCurrentThemeEvent event, Emitter<ThemeState> emit) {
    if(event.appTheme==AppTheme.LIGHT){
      emit(LoadThemeState(lightTheme()));
    }else{
      emit(LoadThemeState(darkTheme()));
    }
  }
  //when user click change theme

  FutureOr<void> _onThemeChangedEvent(
      ThemeChangedEvent event, Emitter<ThemeState> emit) {
    if(event.theme==AppTheme.LIGHT){
      SharedHelper.save(value: 'light', key: 'theme');
      emit(LoadThemeState(lightTheme()));
    }else{
      SharedHelper.save(value: 'dark', key: 'theme');
      emit(LoadThemeState(darkTheme()));
    }
  }
}

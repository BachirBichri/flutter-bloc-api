import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/themes/custom_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  int currentThemeIndex = 0;
  ThemeBloc() : super(ThemeInitialState()) {
    on<SwitchThemeEvent>((event, emit) {
      final themes = CustomTheme.themes;
      currentThemeIndex =
          ++currentThemeIndex < themes.length ? currentThemeIndex : 0;

      emit(ThemeSuccessState(CustomTheme.themes[currentThemeIndex]));
    });
  }
}

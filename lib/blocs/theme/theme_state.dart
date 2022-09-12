part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  final ThemeData theme;

  const ThemeState(this.theme);
}

class ThemeInitialState extends ThemeState {
  ThemeInitialState() : super(CustomTheme.themes[0]);
}

class ThemeSuccessState extends ThemeState {
  const ThemeSuccessState(super.theme);
}

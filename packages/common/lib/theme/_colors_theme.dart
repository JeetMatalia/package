part of 'theme.dart';

abstract class _PracticeAppColors {
  static const Color primary = Color.fromRGBO(59, 182, 255, 1.0);
  static const Color secondary = Color(0xFFDEE3E8);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color red = Color(0xffBE2845);
  static const Color outline = Color(0xFFDEE3E8);
  static const Color divider = Color(0xffB3B3B3);
}

const _colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _PracticeAppColors.primary,
  onPrimary: _PracticeAppColors.black,
  secondary: _PracticeAppColors.secondary,
  onSecondary: _PracticeAppColors.black,
  error: _PracticeAppColors.red,
  onError: _PracticeAppColors.red,
  background: _PracticeAppColors.white,
  onBackground: _PracticeAppColors.black,
  surface: _PracticeAppColors.white,
  onSurface: _PracticeAppColors.black,
  outline: _PracticeAppColors.outline,
  tertiary: _PracticeAppColors.divider,
);

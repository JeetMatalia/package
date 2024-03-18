// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

@immutable
class PracticeAppColors extends ThemeExtension<PracticeAppColors> {
  const PracticeAppColors({
    required this.primary,
    required this.primaryD9F,
    required this.whiteF5F5,
    required this.black,
    required this.darkBlue25,
    required this.white,
    required this.grey74,
    required this.blue18,
    required this.grey88,
    required this.lightRed,
    required this.red,
    required this.redEB,
    required this.blue14A,
    required this.greyD9D,
    required this.greyDAD,
    required this.black324,
    required this.grey4B4,
    required this.greyDCD,
    required this.yellow,
    required this.grey6D6,
    required this.greyC2,
    required this.greyB6,
    required this.grey324,
    required this.textBlackColor,
    required this.transparent,
    required this.lightBlueLotus,
    required this.lightCyan,
    required this.appBarBackground,
    required this.greyBD,
    required this.grey33,
    required this.black1B1,
    required this.whiteF2F4F6,
    required this.redStatus,
    required this.greenStatus,
    required this.greyF2,
    required this.green,
    required this.greyDA,
    required this.greyADA,
    required this.greyEDF,
    required this.primaryLight,
  });

  final Color primary;
  final Color primaryD9F;
  final Color whiteF5F5;
  final Color black;
  final Color darkBlue25;
  final Color white;
  final Color grey74;
  final Color blue18;
  final Color grey88;
  final Color lightRed;
  final Color red;
  final Color redEB;
  final Color blue14A;
  final Color greyD9D;
  final Color greyDAD;
  final Color greyADA;
  final Color black324;
  final Color grey4B4;
  final Color greyDCD;
  final Color yellow;
  final Color grey6D6;
  final Color greyC2;
  final Color greyB6;
  final Color grey324;
  final Color textBlackColor;
  final Color transparent;
  final Color lightBlueLotus;
  final Color lightCyan;
  final Color appBarBackground;
  final Color greyBD;
  final Color grey33;
  final Color black1B1;
  final Color whiteF2F4F6;
  final Color redStatus;
  final Color greenStatus;
  final Color greyF2;
  final Color green;
  final Color greyDA;
  final Color greyEDF;
  final Color primaryLight;

  @override
  PracticeAppColors copyWith() {
    // We don't use copyWith for the moment
    // Colors are not well defined enough to maintain this
    throw UnimplementedError();
  }

  @override
  ThemeExtension<PracticeAppColors> lerp(
      ThemeExtension<PracticeAppColors>? other,
      double t,
      ) {
    // We don't use colors lerp for the moment
    // Colors are not well defined enough to maintain this
    if (other == null) return this;

    return t < .5 ? this : other;
  }
}

PracticeAppColors myColorsExtension = const PracticeAppColors(
  primary: Color(0xff00A0BF),
  primaryD9F: Color(0xffD9F1F5),
  whiteF5F5: Color(0xffF5F5F9),
  black: Color(0xff000000),
  darkBlue25: Color(0xff253274),
  white: Color(0xffFFFFFF),
  grey74: Color(0xff747775),
  blue18: Color(0xff1877F2),
  grey88: Color(0xff888888),
  lightRed: Color(0xffEB5757),
  red: Color(0xffFC573B),
  redEB: Color(0xffFC573B),
  blue14A: Color(0xff14A3B9),
  greyD9D: Color(0xffD9D9D9),
  greyDAD: Color(0xffDADADA),
  black324: Color(0xff32475C),
  grey4B4: Color(0xff4B465C),
  greyDCD: Color(0xffDCDCDC),
  yellow: Color(0xffFFC107),
  grey6D6: Color(0xff6D6D6D),
  greyC2: Color(0xffC2C2C2),
  greyB6: Color(0xffB6B6B6),
  grey324: Color(0xff32475C),
  textBlackColor: Color(0xFF191919),
  transparent: Color(0x00000000),
  lightBlueLotus: Color(0x0F615EF0),
  lightCyan: Color(0xFF14A2B9),
  appBarBackground: Color(0xFFFEFEFE),
  greyBD: Color(0xFFBDBDBD),
  grey33: Color(0xFF333333),
  black1B1: Color(0xFF1B1C31),
  whiteF2F4F6: Color(0xFFF2F4F6),
  redStatus: Color(0xFFEB5757),
  greenStatus: Color(0xFF219653),
  greyF2: Color(0xFFF2F4F6),
  green: Color(0xff4CAF50),
  greyDA: Color(0xffDADADA),
  greyADA: Color(0xffADADAD),
  greyEDF: Color(0xffEDF2F7),
  primaryLight: Color(0xff14A2B9),
);

extension PracticeAppColorsExtensions on ThemeData {
  PracticeAppColors get practiceAppColors => extension<PracticeAppColors>()!;
}

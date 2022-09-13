import 'package:flutter/material.dart';

const primaryColor = Colors.teal;
const primaryColorLight = Color(0x33009688);
const primaryColor80 = Color(0xCD009688);
const primaryColorLight80 = Color(0xCDB2DFDB);
const primaryContrastColor = Color(0xFFEEEEEE);
const secondaryColor = Color(0xFF3765C5);
const textColor = Color(0xFF000000);
const textColorContrast = Color(0xFFFFFFFF);
const materialColor = Color(0xFFE5E5E5);
const borderColor = Color(0xFFAAAAAA);
const borderDarkColor = Color(0xFF454545);
const dangerColor = Color(0xFFC40505);
const dangerLightColor = Color.fromARGB(255, 255, 159, 159);
const successColor = Color(0xFF5FBF19);
const warningColor = Color(0xFFD6B62F);
const disabledColor = Color(0xFFC7C7C7);
const navBarUnselected = Color(0xFF626262);
const cardColor = Color(0xFFDBDBDB);

const bodyPadding = 16.0;

const inputBorder =
    OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: borderColor));
const inputErrorBorder =
    OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: dangerColor));

const inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(16, 21, 16, 21),
  fillColor: primaryContrastColor,
  filled: true,
  enabledBorder: inputBorder,
  border: inputBorder,
  disabledBorder: inputBorder,
  errorBorder: inputErrorBorder,
  focusedBorder: inputBorder,
  focusedErrorBorder: inputErrorBorder,
);

var textButtonTextStyle = TextStyle(fontSize: 16, height: 1.187, fontWeight: FontWeight.w500, color: primaryColor);

var textButtonStyle = TextButton.styleFrom(
    primary: primaryColor,
    minimumSize: const Size(double.infinity, 55),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    textStyle: textButtonTextStyle);

var textButtonClearStyle = TextButton.styleFrom(
    padding: EdgeInsets.zero,
    primary: textColor,
    textStyle: bodyTextNormal,
    minimumSize: Size.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    alignment: Alignment.centerLeft);

var outlinedButtonStyle = OutlinedButton.styleFrom(
    primary: textColor,
    minimumSize: const Size(double.infinity, 60),
    side: const BorderSide(color: borderColor),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    alignment: Alignment.centerLeft,
    textStyle: TextStyle(fontSize: 16, height: 1.187, fontWeight: FontWeight.w500));

var elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: primaryColor,
    minimumSize: const Size(double.infinity, 60),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    textStyle: TextStyle(fontSize: 18, height: 1.187, fontWeight: FontWeight.w600));

var header1TextStyle = TextStyle(color: primaryColor, fontSize: 40, height: 1.225, fontWeight: FontWeight.w700);
var header2TextStyle = TextStyle(color: primaryColor, fontSize: 30, height: 1.225, fontWeight: FontWeight.w600);
var header3TextStyle = TextStyle(color: primaryColor, fontSize: 24, height: 1.225, fontWeight: FontWeight.w600);
var header4TextStyle = TextStyle(color: primaryColor, fontSize: 20, height: 1.5, fontWeight: FontWeight.w600);

// default text
var bodyTextSmaller = TextStyle(fontSize: 12, color: textColor);
var bodyTextSmall = TextStyle(fontSize: 14, color: textColor, height: 1.3, fontWeight: FontWeight.w500);
var bodyTextNormal = TextStyle(fontSize: 16, color: textColor, height: 1.3, fontWeight: FontWeight.w500);
var bodyTextBig = TextStyle(fontSize: 18, color: textColor, fontWeight: FontWeight.w500);

var cardText = const TextStyle(fontSize: 16, color: textColor, height: 1.3);
var cardTitle = const TextStyle(fontSize: 17, color: textColor, fontWeight: FontWeight.bold);
var segmentText = const TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

var paddingMainView = const EdgeInsets.fromLTRB(16, 16, 16, 16);
var paddingSmallText = const EdgeInsets.fromLTRB(0, 2, 0, 2);
var iconPadding = const EdgeInsets.fromLTRB(10, 5, 10, 5);
var segmentPadding = const EdgeInsets.fromLTRB(3, 2, 3, 2);

var maxWidth = 600.0;

var baseTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: primaryContrastColor,
        secondary: secondaryColor,
        onSecondary: primaryContrastColor,
        error: dangerColor,
        onError: primaryContrastColor,
        background: primaryContrastColor,
        onBackground: primaryColor,
        surface: materialColor,
        onSurface: primaryColor),
    brightness: Brightness.light,
    scaffoldBackgroundColor: primaryContrastColor,
    textTheme: TextTheme(
      headline1: header1TextStyle,
      headline2: header2TextStyle,
      headline3: header3TextStyle,
      headline4: header4TextStyle,
      bodyText2: bodyTextNormal,
      subtitle1: bodyTextNormal,
    ));

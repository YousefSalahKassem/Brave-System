import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ColorMode {
  light,
  dark,
  change,
}

class ColorsApp{
  static const Color _lightMain = Colors.white;
  static const Color _darkMain = Colors.black;
  static const Color _primary = Color(0XFF01597f);
  static final Color _blueLight = const Color(0XFF55C2F0).withOpacity(.17);
  static const Color _secondaryLight = Color(0XFFF6F6F6);
  static const Color _secondaryDark = Colors.black54;
  static const Color _greyIcon = Color(0XFF8F8F8F);
  static const Color _redButton = Color(0XFFF5576B);
  static final Color _blueTransparent= const Color(0XFF121212).withOpacity(.12);
  static const Color _borderColor = Color(0XFF003654);
  static final Color _shadowPsIcon= const Color(0XFF01597F).withOpacity(.34);
  static const Color _blueKnockout = Color(0XFF003654);


  final RxBool _darkMode= true.obs;


  Color get mainBlue => _materialStyle;
  static const Color _materialStyle = _primary;


  Color get light => _lightMain;
  Color get dark => _darkMain;
  Color get primary => _primary;
  Color get blueLight => _blueLight;
  Color get blueTransparent => _blueTransparent;
  Color get secondaryLight => _secondaryLight;
  Color get secondaryDark => _secondaryDark;
  Color get borderColor => _borderColor;
  Color get googleButton => _redButton;
  Color get shadowPs => _shadowPsIcon;
  Color get greyIcon => _greyIcon;
  Color get blueKnockOut => _blueKnockout;
  bool get isDarkMode => _darkMode.value;


  ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: dark,
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: primary,
        iconColor: primary,
        suffixIconColor: primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 1.5, color: primary),
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 1.5, color: primary),
        ),
      ),
      fontFamily: 'Roboto');

  ThemeData get lightTheme => ThemeData(
      scaffoldBackgroundColor: secondaryLight,
      brightness: Brightness.light,
      cardColor: secondaryLight,
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: primary,
        iconColor: primary,
        suffixIconColor: primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 1.5, color: primary),
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 1.5, color: primary),
        ),
      ),
      fontFamily: 'Roboto');

//switch mode light and dark
  void themeModeSwitch(){
    Get.isDarkMode?Get.changeTheme(lightTheme):Get.changeTheme(darkTheme);
  }
}
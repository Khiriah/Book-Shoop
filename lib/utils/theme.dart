import 'package:flutter/material.dart';

const Color labalColor = Color(0xff99A2A5);
const Color buttonColor = Color(0xff6B7072);
const Color conternierColor = Color(0xffDA6060);
const Color mainColor = Color(0xff99A2A5);
const Color googleColor = Color(0xffDA6060);


class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: conternierColor,
    backgroundColor: conternierColor,
    brightness: Brightness.dark,
  );
}
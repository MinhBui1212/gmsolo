import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color colorPrimary = Color(0xFF0B61AF);
const Color colorWhite = Color(0xFFFFFFFF);
const Color colorBlack = Color(0xFF373435);
const InputDecoration cusTextInputDecoration = InputDecoration(
  border: InputBorder.none,
  hintText: '',
  // ),
);

//size
var defaultBorderRadius = 10.r;
var defaultPaddingScreen = 10.w;
final kDefaultSmallPaddingWidth = 10.w;
final kDefaultPaddingWidth = 20.w;
final kDefaultSmailPaddingHeight = 10.h;
final kDefaultPaddingHeight = 20.h;
const kDefaultPaddingWidget = 10.0;
final kDefaultPaddingWidthWidget = 10.w;
final kDefaultPaddingHeightWidget = 10.h;
final kDefaultBorderRadius = 20.r;
final kSecondBorderRadius = 8.r;
final kTextFieldBorderRadius = 6.r;

const kDefaultMarginWidth = 10.0;

mixin TypeSns {
  static const String openid = 'openid';
  static const String email = 'email';
  static const String profile = 'profile';
  static const String openId = 'openId';
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cuemate/configs/theme/constants.dart';

TextStyle get primaryHeaderTitleStyle {
  return TextStyle(
    fontSize: 16.sp,
    color: colorBlack,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get primaryTitleStyle {
  return TextStyle(
    fontSize: 14.sp,
    color: colorPrimary,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get textTitleStyle {
  return TextStyle(
    fontSize: 14.sp,
    color: Colors.black54,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get labelFieldTextStyle {
  return TextStyle(
    fontSize: 12.sp,
    color: colorBlack,
    fontWeight: FontWeight.normal,
  );
}

TextStyle get placeholderTextStyle {
  return TextStyle(
    fontSize: 12.sp,
    color: Colors.black54,
    fontWeight: FontWeight.normal,
  );
}

TextStyle get labelTextStyle {
  return TextStyle(
    fontSize: 14.sp,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
  );
}

TextStyle get label12TextStyle {
  return TextStyle(
    fontSize: 12.sp,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
  );
}

TextStyle get label10TextStyle {
  return TextStyle(
    fontSize: 10.sp,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
  );
}

TextStyle get questionBtnTextStyle {
  return const TextStyle(
    color: Colors.black54,
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
  );
}

TextStyle get textNomalStyle {
  return TextStyle(
    fontSize: 12.sp,
    color: colorBlack,
    fontWeight: FontWeight.normal,
  );
}

TextStyle get errorTextStyle {
  return TextStyle(fontSize: 10.sp, color: Colors.red);
}

TextStyle get hintTextStyle {
  return TextStyle(fontSize: 12.sp, color: Colors.grey);
}

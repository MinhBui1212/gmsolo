import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cuemate/configs/theme/constants.dart';
import 'package:cuemate/configs/theme/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cuemate/configs/validations/validation.dart';

class CustomTextField extends StatefulWidget with ValidationMixin {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.autofocus = false,
      this.labelText,
      this.hintText,
      this.maxLines,
      this.isPassword,
      this.isNumber,
      this.fillColor,
      this.validate,
      this.validation = const []});
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool autofocus;
  final int? maxLines;
  final bool? isPassword;
  final bool? isNumber;
  final Color? fillColor;
  final List<String> validation;
  final String? Function(String?)? validate;
  @override
  State<CustomTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<CustomTextField> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofocus: widget.autofocus,
      maxLines: widget.isPassword == true ? 1 : widget.maxLines,
      enableSuggestions: true,
      obscureText: widget.isPassword == true ? !isShow : false,
      style: textNomalStyle,
      // autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType:
          widget.isNumber == true ? TextInputType.number : TextInputType.text,
      validator: widget.validate != null || widget.validation.isNotEmpty
          ? (value) {
              String? error = validate(value);
              if (error != null && error.isNotEmpty) {
                return error;
              }
              if (widget.validate != null) {
                return widget.validate!(value);
              }
              return null;
            }
          : null,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText ?? '',
        hintStyle: placeholderTextStyle,
        filled: true,
        fillColor: widget.fillColor ?? Colors.white,
        errorStyle: errorTextStyle,
        suffixIcon: widget.isPassword == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isShow = !isShow;
                  });
                },
                icon: Icon(
                  isShow ? Icons.visibility : Icons.visibility_off,
                  size: 18.sp,
                  color: colorPrimary,
                ))
            : null,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kTextFieldBorderRadius),
            borderSide: const BorderSide(color: colorPrimary)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kTextFieldBorderRadius),
            borderSide: const BorderSide(color: colorPrimary)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kTextFieldBorderRadius),
            borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kTextFieldBorderRadius),
            borderSide: const BorderSide(color: Colors.red)),
      ),
    );
  }

  validate(value) {
    String? error;
    for (var element in widget.validation) {
      switch (element) {
        case ValidationType.required:
          if (!widget.isRequired(value)) {
            error = AppLocalizations.of(context)!
                .msg_required(widget.labelText ?? '');
          }
          break;
        case ValidationType.email:
          if (!widget.isEmailValid(value)) {
            error = AppLocalizations.of(context)!.msg_email_format;
          }
          break;
        case ValidationType.password:
          if (!widget.isPasswordValid(value)) {
            error = AppLocalizations.of(context)!.msg_password_format;
          }
          break;
        default:
          break;
      }
    }
    return error;
  }
}

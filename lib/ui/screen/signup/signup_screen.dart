import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cuemate/configs/theme/text_style.dart';
import 'package:cuemate/configs/validations/validation.dart';
import 'package:cuemate/ui/screen/home/home_screen.dart';
import 'package:cuemate/ui/screen/login/login_screen.dart';
import 'package:cuemate/ui/widget/components.dart';
import 'package:cuemate/ui/widget/custom_bottom_screen.dart';
import 'package:cuemate/ui/widget/custom_text_field.dart';
import 'package:cuemate/ui/widget/label.dart';
import 'package:cuemate/ui/widget/logo_image.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:cuemate/configs/theme/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = 'signup_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double logoSize =
        height * 3 / 15 > width * 1 / 5 ? width * 1 / 5 : height * 3 / 15;
    return WillPopScope(
      onWillPop: () async {
        Navigator.popAndPushNamed(context, HomeScreen.id);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colorWhite,
          body: LoadingOverlay(
            isLoading: _saving,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: logoSize + 40.h,
                    child: Align(
                        child: LogoImage(
                      height: logoSize,
                    )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kDefaultPaddingWidth),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Label(
                                label:
                                    AppLocalizations.of(context)!.signup_title,
                                textAlign: TextAlign.center,
                                textStyle: textTitleStyle),
                            SizedBox(height: 15.h),
                            CustomTextField(
                              labelText: AppLocalizations.of(context)!.email,
                              hintText: AppLocalizations.of(context)!.email,
                              controller: _mailController,
                              validation: const [
                                ValidationType.required,
                                ValidationType.email
                              ],
                            ),
                            SizedBox(height: 25.h),
                            CustomTextField(
                              labelText: AppLocalizations.of(context)!.password,
                              hintText: AppLocalizations.of(context)!.password,
                              controller: _passController,
                              isPassword: true,
                              validation: const [
                                ValidationType.required,
                                ValidationType.password
                              ],
                            ),
                            SizedBox(height: 25.h),
                            CustomTextField(
                              labelText: AppLocalizations.of(context)!
                                  .confirm_password,
                              hintText: AppLocalizations.of(context)!
                                  .confirm_password,
                              controller: _confirmController,
                              isPassword: true,
                              validation: const [ValidationType.required],
                              validate: (value) {
                                if (value != _passController.text) {
                                  return AppLocalizations.of(context)!
                                      .msg_confirm_password_format;
                                }
                                return null;
                              },
                            ),
                            CustomBottomScreen(
                              textButton: AppLocalizations.of(context)!.signup,
                              heroTag: 'signup_btn',
                              question:
                                  AppLocalizations.of(context)!.have_an_account,
                              buttonPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  setState(() {
                                    _saving = true;
                                  });
                                  try {
                                    if (context.mounted) {
                                      signUpAlert(
                                        context: context,
                                        title: AppLocalizations.of(context)!
                                            .signup_success_title,
                                        desc: AppLocalizations.of(context)!
                                            .signup_success_desc,
                                        btnText: AppLocalizations.of(context)!
                                            .signup_success_btn,
                                        onPressed: () {
                                          setState(() {
                                            _saving = false;
                                            Navigator.popAndPushNamed(
                                                context, SignUpScreen.id);
                                          });
                                          Navigator.pushNamed(
                                              context, LoginScreen.id);
                                        },
                                      ).show();
                                    }
                                  } catch (e) {
                                    signUpAlert(
                                      context: context,
                                      onPressed: () {
                                        SystemNavigator.pop();
                                      },
                                      title: AppLocalizations.of(context)!
                                          .signup_error_title,
                                      desc: AppLocalizations.of(context)!
                                          .signup_error_desc,
                                      btnText: AppLocalizations.of(context)!
                                          .signup_error_btn,
                                    );
                                  }
                                }
                              },
                              questionPressed: () async {
                                Navigator.pushNamed(context, LoginScreen.id);
                              },
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

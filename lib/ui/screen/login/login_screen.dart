import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cuemate/configs/global/global.dart';
import 'package:cuemate/configs/theme/text_style.dart';
import 'package:cuemate/configs/theme/constants.dart';
import 'package:cuemate/configs/validations/validation.dart';
import 'package:cuemate/ui/screen/edit_profile/edit_profile_screen.dart';
import 'package:cuemate/ui/screen/home/home_screen.dart';
import 'package:cuemate/ui/widget/components.dart';
import 'package:cuemate/ui/widget/custom_bottom_screen.dart';
import 'package:cuemate/ui/widget/custom_text_field.dart';
import 'package:cuemate/ui/widget/label.dart';
import 'package:cuemate/ui/widget/logo_image.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
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
          return false;
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
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPaddingWidth),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Label(
                                label:
                                    AppLocalizations.of(context)!.login_title,
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
                            CustomBottomScreen(
                              textButton: 'Login',
                              heroTag: 'login_btn',
                              question:
                                  AppLocalizations.of(context)!.forgot_password,
                              buttonPressed: loginPress,
                              questionPressed: forgotPress,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  // click button login
  Future loginPress() async {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      setState(() {
        _saving = true;
      });
      try {
        appCubit.login(_mailController.text, _passController.text);
        if (context.mounted) {
          setState(() {
            _saving = false;
            Navigator.popAndPushNamed(context, LoginScreen.id);
          });
          if (appCubit.state.isFirstLogin) {
            // appCubit.updateFirstLogin();
            Navigator.pushNamed(context, EditProfileScreen.id);
          } else {
            Navigator.pushNamed(context, HomeScreen.id);
          }
        }
      } catch (e) {
        signUpAlert(
          context: context,
          onPressed: () {
            setState(() {
              _saving = false;
            });
            Navigator.popAndPushNamed(context, LoginScreen.id);
          },
          title: AppLocalizations.of(context)!.login_error_title,
          desc: AppLocalizations.of(context)!.login_error_desc,
          btnText: AppLocalizations.of(context)!.login_error_btn,
        ).show();
      }
    }
  }

  forgotPress() {
    signUpAlert(
      onPressed: () {
        SystemNavigator.pop();
      },
      title: AppLocalizations.of(context)!.forgot_password_title,
      desc: AppLocalizations.of(context)!.forgot_password_desc,
      btnText: AppLocalizations.of(context)!.forgot_password_btn,
      context: context,
    ).show();
  }
}

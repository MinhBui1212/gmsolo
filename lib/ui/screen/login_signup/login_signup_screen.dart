import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cuemate/configs/app_path.dart';
import 'package:cuemate/configs/auth_service.dart';
import 'package:cuemate/configs/global/global.dart';
import 'package:cuemate/configs/theme/text_style.dart';
import 'package:cuemate/configs/theme/constants.dart';
import 'package:cuemate/ui/screen/home/home_screen.dart';
import 'package:cuemate/ui/screen/login/login_screen.dart';
import 'package:cuemate/ui/screen/signup/signup_screen.dart';
import 'package:cuemate/ui/widget/components.dart';
import 'package:cuemate/ui/widget/custom_button.dart';
import 'package:cuemate/ui/widget/label.dart';
import 'package:cuemate/ui/widget/logo_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});
  static String id = 'Login_signup_screen';

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double logoSize =
        height * 3 / 15 > width * 1 / 5 ? width * 1 / 5 : height * 3 / 15;
    return SafeArea(
        child: Scaffold(
      backgroundColor: colorWhite,
      body: Column(
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
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Label(
                    label: AppLocalizations.of(context)!.login_signup_title,
                    textAlign: TextAlign.center,
                    textStyle: labelTextStyle),
                SizedBox(height: 15.h),
                Hero(
                  tag: 'login_btn',
                  child: CustomButton(
                    buttonText: AppLocalizations.of(context)!.login,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                ),
                SizedBox(height: 25.h),
                Hero(
                  tag: 'signup_btn',
                  child: CustomButton(
                    buttonText: AppLocalizations.of(context)!.signup,
                    isOutlined: true,
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                  ),
                ),
                SizedBox(height: 25.h),
                Label(
                    label: AppLocalizations.of(context)!.login_by_using,
                    textStyle: label12TextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        AuthService().signInWithFacebook().then(loginSns);
                      },
                      icon: CircleAvatar(
                        radius: 25,
                        child: Image.asset(AppPath.logoFacebook),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        AuthService().signInWithGoogle().then(loginSns);
                      },
                      icon: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(AppPath.logoGoogle),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: 25,
                        child: Image.asset(AppPath.logoLinkedin),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  loginSns(bool isLogined) {
    if (isLogined) {
      appCubit.loginSns();
      Navigator.pushNamed(context, HomeScreen.id);
    } else {
      signUpAlert(
        context: context,
        onPressed: () {
          SystemNavigator.pop();
        },
        title: AppLocalizations.of(context)!.signup_error_title,
        desc: AppLocalizations.of(context)!.signup_error_desc,
        btnText: AppLocalizations.of(context)!.signup_error_btn,
      );
    }
  }
}

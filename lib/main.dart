import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cuemate/configs/global/global.dart';
import 'package:cuemate/ui/app_cubit.dart';
import 'package:cuemate/ui/app_state.dart';
import 'package:cuemate/ui/screen/edit_profile/edit_profile_screen.dart';
import 'package:cuemate/ui/screen/home/home_screen.dart';
import 'package:cuemate/ui/screen/login/login_screen.dart';
import 'package:cuemate/ui/screen/login_signup/login_signup_screen.dart';
import 'package:cuemate/ui/screen/signup/signup_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    appCubit = AppCubit();
    return ScreenUtilInit(
        builder: (context, _) => BlocProvider(
            create: (context) => appCubit,
            child: BlocConsumer<AppCubit, AppState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                        textTheme: const TextTheme(
                      bodyMedium: TextStyle(
                        fontFamily: 'Ubuntu',
                      ),
                    )),
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    initialRoute: HomeScreen.id,
                    routes: {
                      HomeScreen.id: (context) => const HomeScreen(),
                      LoginSignupScreen.id: (context) =>
                          const LoginSignupScreen(),
                      LoginScreen.id: (context) => const LoginScreen(),
                      SignUpScreen.id: (context) => const SignUpScreen(),
                      EditProfileScreen.id: (context) =>
                          const EditProfileScreen(),
                    },
                  );
                })));
  }
}

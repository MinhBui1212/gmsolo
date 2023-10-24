import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cuemate/configs/global/global.dart';
import 'package:cuemate/ui/screen/home/cubit/home_cubit.dart';
import 'package:cuemate/ui/screen/home/cubit/home_state.dart';
import 'package:cuemate/ui/screen/home/widget/booking.dart';
import 'package:cuemate/ui/screen/home/widget/newfeed.dart';
import 'package:cuemate/ui/screen/home/widget/notification/notification.dart';
import 'package:cuemate/ui/screen/home/widget/profile.dart';
import 'package:cuemate/ui/screen/login_signup/login_signup_screen.dart';
import 'package:cuemate/ui/widget/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'Home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (!appCubit.state.isLogined &&
                (_selectedIndex == Booking.id ||
                    _selectedIndex == Profile.id ||
                    _selectedIndex == CustomNotification.id)) {
              return const LoginSignupScreen();
            } else {
              return SafeArea(
                  child: CustomBottomNavigationBar(
                      id: _selectedIndex,
                      child: getChildBody(),
                      onTabSelected: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      }));
            }
          },
        ));
  }

  Widget getChildBody() {
    if (_selectedIndex == NewFeed.id) {
      return NewFeed();
    } else if (_selectedIndex == Profile.id) {
      return const Profile();
    } else if (_selectedIndex == Booking.id) {
      return const Booking();
    } else {
      return const CustomNotification();
    }
  }
}

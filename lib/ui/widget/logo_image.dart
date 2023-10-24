import 'package:flutter/material.dart';
import 'package:cuemate/configs/app_path.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key, this.width = 150, this.height = 150});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(AppPath.logo),
        ),
      )),
    );
  }
}

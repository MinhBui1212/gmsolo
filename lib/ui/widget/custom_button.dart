import 'package:flutter/material.dart';
import 'package:cuemate/configs/theme/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.isOutlined = false,
      required this.onPressed,
      this.width = 280,
      this.isDisabled = false});

  final String buttonText;
  final bool isOutlined;
  final Function onPressed;
  final double width;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Material(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        elevation: 4,
        child: Container(
          width: width,
          padding: const EdgeInsets.fromLTRB(13, 10, 13, 10),
          decoration: BoxDecoration(
            color: isOutlined
                ? colorWhite.withOpacity(isDisabled ? 0.5 : 1)
                : colorPrimary.withOpacity(isDisabled ? 0.5 : 1),
            border: Border.all(
                color: colorPrimary.withOpacity(isDisabled ? 0.5 : 1),
                width: 1),
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isOutlined
                    ? colorPrimary.withOpacity(isDisabled ? 0.5 : 1)
                    : colorWhite.withOpacity(isDisabled ? 0.5 : 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

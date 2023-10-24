import 'package:flutter/material.dart';
import 'package:cuemate/configs/theme/text_style.dart';
import 'package:cuemate/ui/widget/custom_button.dart';

class CustomBottomScreen extends StatelessWidget {
  const CustomBottomScreen({
    super.key,
    required this.textButton,
    required this.question,
    this.heroTag = '',
    required this.buttonPressed,
    required this.questionPressed,
  });
  final String textButton;
  final String question;
  final String heroTag;
  final Function buttonPressed;
  final Function questionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 20,
            ),
            child: GestureDetector(
              onTap: () {
                questionPressed();
              },
              child: Text(
                question,
                style: questionBtnTextStyle,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Hero(
            tag: heroTag,
            child: CustomButton(
              buttonText: textButton,
              onPressed: () {
                buttonPressed();
              },
            ),
          ),
        ),
      ],
    );
  }
}

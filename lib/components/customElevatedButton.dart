import 'package:flutter/material.dart';
import 'package:patientclinicflutter/constants/const.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonLabel;
  final Color buttonColor;
  final Color buttonTextColor;
  final Function()? onPressed;

  const CustomElevatedButton(
      {super.key,
      required this.buttonColor,
      required this.buttonTextColor,
      required this.buttonLabel,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 44,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
          child: TextStyles.regular(
            label: buttonLabel,
            textColor: buttonTextColor,
            textSize: ConstSizes.regularSize,
            textWeight: FontWeight.w600,
          )),
    );
  }
}

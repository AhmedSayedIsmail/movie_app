import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final String text;
  final Function()? onPress;
  final Color buttonColor;
  final Color textColor;
  const CustomRoundButton(
      {Key? key,
      required this.text,
      this.onPress,
      required this.buttonColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          textStyle: TextStyle(fontSize: 18, color: textColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(text),
      ),
    );
  }
}

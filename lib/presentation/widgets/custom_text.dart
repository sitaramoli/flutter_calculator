import 'package:calculator/presentation/resources/color_constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return text == '<'
        ? const Icon(
            Icons.backspace_rounded,
            size: 30,
            shadows: [
              Shadow(
                offset: Offset(3, 3),
                color: ColorConstants.DARK_SHADOW,
                blurRadius: 10,
              ),
            ],
          )
        : Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              shadows: [
                Shadow(
                  offset: Offset(3, 3),
                  color: ColorConstants.DARK_SHADOW,
                  blurRadius: 10,
                ),
              ],
            ),
          );
  }
}

import 'package:calculator/app/utils.dart';
import 'package:calculator/presentation/resources/color_constants.dart';
import 'package:calculator/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.height = 70,
      this.width = 70,
      required this.text,
      required this.onClick})
      : super(key: key);

  final double height;
  final double width;
  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Utils.isOperator(text)
              ? ColorConstants.OPERATOR_BUTTON
              : ColorConstants.NUMBER_BUTTON,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: ColorConstants.DARK_SHADOW,
              offset: Offset(5, 5),
              blurRadius: 10,
            ),
            BoxShadow(
              color: ColorConstants.LIGHT_SHADOW,
              offset: Offset(-5, -5),
              blurRadius: 10,
            ),
          ],
        ),
        child: CustomText(
          text: text,
        ),
      ),
    );
  }
}

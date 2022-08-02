import 'package:calculator/presentation/resources/color_constants.dart';
import 'package:calculator/presentation/state_management/calculator_riverpod.dart';
import 'package:calculator/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.NUMBER_BUTTON,
      body: Column(
        children: [
          Expanded(child: _buildResult()),
          Expanded(flex: 2, child: _buildButtons()),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildButtonRow('AC', '<', '%', '÷'),
          _buildButtonRow('7', '8', '9', 'x'),
          _buildButtonRow('4', '5', '6', '-'),
          _buildButtonRow('1', '2', '3', '+'),
          _buildButtonRow('0', '00', '.', '='),
        ],
      ),
    );
  }

  Widget _buildResult() {
    final calculator = ref.watch(calculatorProvider);
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding:
          EdgeInsets.only(top: height * 0.18, left: 20, right: 20, bottom: 10),
      child: Consumer(builder: (context, ref, child) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          decoration: BoxDecoration(
            color: ColorConstants.NUMBER_BUTTON,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: ColorConstants.DARK_SHADOW,
                blurRadius: 3,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                calculator.expression,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: ColorConstants.BLACK,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                calculator.result,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: ColorConstants.DARK_SHADOW,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildButtonRow(String a, String b, String c, String d) {
    final row = [a, b, c, d];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: row
          .map((text) => CustomButton(
                text: text,
                onClick: () => onButtonClick(text),
              ))
          .toList(),
    );
  }

  void onButtonClick(String buttonText) {
    final calculator = ref.read(calculatorProvider.notifier);
    switch (buttonText) {
      case '=':
        calculator.equals();
        break;
      case 'AC':
        calculator.reset();
        break;
      case '<':
        calculator.delete();
        break;
      default:
        calculator.append(buttonText);
    }
  }
}

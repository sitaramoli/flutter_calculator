import 'package:calculator/app/utils.dart';
import 'package:calculator/domain/models/calculator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, Calculator>(
        (ref) => CalculatorNotifier());

class CalculatorNotifier extends StateNotifier<Calculator> {
  CalculatorNotifier() : super(const Calculator());

  void append(String buttonText) {
    final expression = () {
      if (Utils.isOperator(buttonText) &&
          Utils.isOperatorAtEnd(state.expression)) {
        final newExpression =
            state.expression.substring(0, state.expression.length - 1);
        return newExpression + buttonText;
      } else if (state.append) {
        return state.expression == '0'
            ? buttonText
            : state.expression + buttonText;
      } else {
        return Utils.isOperator(buttonText)
            ? state.expression + buttonText
            : buttonText;
      }
    }();
    state = state.copy(expression: expression, append: true);
    calculate();
  }

  void resetResult() {
    final expression = state.result;
    state = state.copy(expression: expression, append: false);
  }

  void equals() {
    calculate();
    resetResult();
  }

  void calculate() {
    try {
      final expression =
          state.expression.replaceAll('x', '*').replaceAll('÷', '/');
      final exp = Parser().parse(expression);
      final model = ContextModel();
      final result = '${exp.evaluate(EvaluationType.REAL, model)}';
      state = state.copy(result: result);
    } catch (e) {}
  }

  void reset() {
    state = state.copy(expression: '0', result: '0');
  }

  void delete() {
    if (state.expression.isNotEmpty) {
      final newExp = state.expression.substring(0, state.expression.length - 1);
      if (newExp.isEmpty) {
        reset();
      } else {
        state = state.copy(expression: newExp);
        calculate();
      }
    }
  }
}

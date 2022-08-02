class Utils {
  static bool isOperator(String buttonText) {
    final operators = ['+', '-', 'x', '÷', '%'];
    return operators.contains(buttonText);
  }

  static bool isOperatorAtEnd(String expression) {
    if (expression.isNotEmpty) {
      return Utils.isOperator(expression.substring(expression.length - 1));
    } else {
      return false;
    }
  }
}

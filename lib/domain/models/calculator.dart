class Calculator {
  final bool append;
  final String expression;
  final String result;

  const Calculator({
    this.expression = '0',
    this.result = '0',
    this.append = true,
  });

  Calculator copy({bool? append, String? expression, String? result}) =>
      Calculator(
        append: append ?? this.append,
        expression: expression ?? this.expression,
        result: result ?? this.result,
      );
}

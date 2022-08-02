import 'package:calculator/presentation/screens/home.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp._internal();
  static const instance = CalculatorApp._internal();
  factory CalculatorApp() => instance;

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: (settings) => RouteGenerator.getRoute(settings),
      // initialRoute: Routes.home,
      // theme: getAppTheme(),
      home: Home(),
    );
  }
}

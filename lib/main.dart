import 'package:flutter/material.dart';
import 'package:dummy_bmi/screens/Inputpage.dart';

void main() {
  runApp( BMICalculator());
}

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
        home: InputPage()
    );
  }
}

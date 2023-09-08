import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import 'package:dummy_bmi/components/bottom_button.dart';
import 'package:dummy_bmi/calculator_brain.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({required this.bmiResult,required this.interpretation,required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
            givecolor: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  resultText,
                  style: resultTextStyle,
                ),
                Text(
                    bmiResult,
                  style:kBMITextStyle,
                ),
                Text(
                  interpretation,
                  style: kBodyTextStyle,
                ),
                BottomButton(onTap: (){
                  Navigator.pop(context);
                },
                    buttonTitle: 'RECALCULATE',
                ),
              ],
            ),
            ) ,
          ),
        ],
      )
    );
  }
}

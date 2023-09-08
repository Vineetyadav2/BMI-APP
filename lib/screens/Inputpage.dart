import 'package:dummy_bmi/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dummy_bmi/components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'package:dummy_bmi/components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:dummy_bmi/calculator_brain.dart';


Gender ?selectedGender;
 enum Gender{
  male,
  female,
 }
 int height =180;
 int weight =40;
 int age = 30;

class InputPage extends StatefulWidget {

  @override
  State<InputPage> createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator'
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                     setState(() {
                       selectedGender= Gender.male;
                     });
                    },
                    child: ReusableCard(
                      cardChild: iconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                     givecolor: selectedGender== Gender.male? (activeCardColor): (inactiveCardColor),
                    ),
                  ),
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    child: ReusableCard(
                      cardChild: iconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      givecolor: selectedGender== Gender.female? activeCardColor:inactiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
           Expanded(
             child: ReusableCard(
               givecolor: activeCardColor,
               cardChild: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'HEIGHT',
                     style: labelTextStyle,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline:TextBaseline.alphabetic ,
                     children: [
                       Text(
                         height.toString(),
                         style: kNumberTextStyle,
                       ),
                       Text(
                         'cm',
                         style: labelTextStyle,
                       )
                     ],
                   ),
                   SliderTheme(
                     data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                       overlayShape: RoundSliderOverlayShape(
                         overlayRadius: 30.0,
                       ),
                       thumbColor: Color(0xFFEB1555),
                       inactiveTrackColor: Color(0xff8D8E98),
                       activeTrackColor: Colors.white,
                       overlayColor: Color(0x29EB1555),
                     ),
                     child: Slider(
                       value: height.toDouble(),
                       onChanged: (double newvalue){
                         setState(() {
                           height= newvalue.round();
                         });
                       },
                       min: 150,
                       max: 220,
                     ),
                   )
                 ],
               ),
             ),
           ),

          Expanded(
            child: Row(
              children:  [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(icon:FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(icon:FontAwesomeIcons.plus,
                                onPressed: (){
                              setState(() {
                                weight++;
                              });
                                },
                            ),
                          ],
                        ),
                      ],
                    ),
                    givecolor: activeCardColor,
                  ),
                ),
                Expanded(
                  child:ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    givecolor: activeCardColor,
                  ),
                )
              ],
            ),
          ),
          BottomButton(onTap: (){

            CalculatorBrain calc= CalculatorBrain(height: height, weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  bmiResult: calc.calculateBMI().toString(),
                  interpretation:calc.getResult(),
                  resultText: calc.getInterpretation(),
                );
              },
              ),
            );
          },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}








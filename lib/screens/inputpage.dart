import 'package:bmi_calculator/Calculate_BMI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/Reusable.dart';
import 'package:bmi_calculator/components/Icon_Content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/Results.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
@override
_InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCards(
                      colour: (selectedGender == Gender.male) ? kActiveCardColor : kInactiveCardColor,
                    cardChild: cardContent(FontAwesomeIcons.mars,'MALE'),
                      onPress: (){
                        setState(() {
                          selectedGender=Gender.male;
                        });
                      },
                    )
                ),
                Expanded(
                    child: ReusableCards(
                        colour: (selectedGender == Gender.female)? kActiveCardColor : kInactiveCardColor,
                      cardChild: cardContent(FontAwesomeIcons.venus,'FEMALE'),
                      onPress: (){
                          setState(() {
                            selectedGender=Gender.female;
                          });
                      },
                    ),
                ),
              ],
            ),
          ),
          Expanded(
          child: ReusableCards(
            colour: kActiveCardColor,
            cardChild:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor:Colors.white ,
                      inactiveTrackColor: Colors.grey,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 100.0,
                    max:250.0,
                    onChanged: (double chosenHeight){
                      setState(() {
                        height=chosenHeight.round();
                      });
                    },
                  ),
                )
              ],
            ))
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCards(
                        colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child:RoundIconButton(
                                    iconChild: FontAwesomeIcons.minus,
                                    onPressed: (){
                                      setState(() {
                                        weight=weight-1;
                                      });
                              },)),
                              Expanded(
                                  child:RoundIconButton(
                                    iconChild: FontAwesomeIcons.plus,
                                    onPressed:(){
                                      setState(() {
                                        weight=weight+1;
                                      });
                                    },)),
                            ],
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                    child: ReusableCards(colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child:RoundIconButton(
                                      iconChild: FontAwesomeIcons.minus,
                                  onPressed: (){
                                        setState(() {
                                          age=age-1;
                                        });
                                  },)),
                              Expanded(
                                  child:RoundIconButton(
                                    iconChild: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        age=age+1;
                                      });
                                    },
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE BMI',
            onPress: (){
               CalculateBMI calc=CalculateBMI(height: height,weight: weight);
               Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return ResultsPage(
                      bmiResultNumber:calc.CalculateBMI_Func(),
                      bmiResultText:calc.getResult() ,
                      bmiResultInterpretation: calc.getInterpretation() ,
                    );
                  }
              ));
            },
          )
        ],
      )
    );
  }
}




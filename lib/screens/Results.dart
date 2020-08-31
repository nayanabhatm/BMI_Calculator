import 'package:bmi_calculator/components/Reusable.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResultNumber;
  final String bmiResultText;
  final String bmiResultInterpretation;

  ResultsPage({this.bmiResultNumber,this.bmiResultText,this.bmiResultInterpretation});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 15.0),
                alignment:  Alignment.bottomLeft,
                child: Text(
                  'YOUR RESULT',
                  style:kResultsTitle
                  ,),
              ),
            ),
             Expanded(
               flex: 5,
               child: ReusableCards(
                 colour: kActiveCardColor,
                 cardChild: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     Text(bmiResultText.toUpperCase(),style: kResultsTextStyle,),
                     Text(bmiResultNumber,style: kBMINumberStyle,),
                      Text('Normal BMI Range\n18.5 - 25 kg / m^2',style: kBMIResultTextStyle,),
                       Text(bmiResultInterpretation,style: kBMIResultTextStyle,textAlign: TextAlign.center,),
                   ],
                 ),
               ),
             ),
            Expanded(
              child:BottomButton(
                title: 'RE-CALCULATE',
                onPress: (){
                  Navigator.pop(context);
                },
              ),
            )

          ],
        ) ,
      ),
    );
  }
}

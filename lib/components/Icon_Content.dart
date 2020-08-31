import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class cardContent extends StatelessWidget {
  cardContent(this.iconValue,this.textValue);

  final IconData iconValue;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconValue,
          size: 80.0,
        ),
        SizedBox(height: 15.0,),
        Text(
          textValue,
          style: kLabelStyle,
        )
      ],
    );
  }
}


import 'package:flutter/material.dart';

class ReusableCards extends StatelessWidget{
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ReusableCards({@required this.colour,this.cardChild,this.onPress});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }

}
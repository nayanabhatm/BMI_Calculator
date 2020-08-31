import 'dart:math';
import 'package:flutter/material.dart';

class CalculateBMI{
  final int height;
  final int weight;
  double _bmi;

  CalculateBMI({this.height,this.weight});

  String CalculateBMI_Func(){
    _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'OverWeight';
    }else if(_bmi> 18.5){
      return 'NORMAL';
    }else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'You have a higher than normal body weight. Try to Exercise More!';
    }else if(_bmi> 18.5){
      return 'You have a normal body weight. Good Job!';
    }else{
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }

}
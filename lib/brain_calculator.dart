import 'dart:math';

///
/// Underweight = <18.5
//Normal weight = 18.5–24.9
//Overweight = 25–29.9
//Obesity = BMI of 30 or greater

///Very severely underweight		15		0.60
//Severely underweight	15	16	0.60	0.64
//Underweight	16	18.5	0.64	0.74
//Normal (healthy weight)	18.5	25	0.74	1.0
//Overweight	25	30	1.0	1.2
//Obese Class I (Moderately obese)	30	35	1.2	1.4
//Obese Class II (Severely obese)	35	40	1.4	1.6
//Obese Class III (Very severely obese)	40		1.6

class BrainCalculator {
  int weight;
  int height;
  double _bmi;
  BrainCalculator({this.weight, this.height});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight 😗. Eat healthy food 🍲 , drink a lot of water and sweat more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job 😍🥰 keep maintaing it. 😇';
    } else {
      return 'You have a lower than normal body weight 🙂🙂️. Keep focus on your diet. Eat well, be healthy 😊';
    }
  }
}

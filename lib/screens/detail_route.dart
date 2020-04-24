import 'package:bmi_calculator/bmi_cal_arguments.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constant_styles.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BMIArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),
      ),
      body: ResultsPage(
        bmiArguments: args,
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  final BMIArguments bmiArguments;
  ResultsPage({this.bmiArguments});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: kActiveCardColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiArguments.result.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFF2E9F69),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiArguments.resultScore.toString(),
                      style: kTitleTextStyle,
                    ),
                    Text(
                      bmiArguments.resultDescription,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: BottomButton(
              buttonText: 're-calculate',
              onTap: () {
                Navigator.pop(context);
              }),
        )
      ],
    );
  }
}

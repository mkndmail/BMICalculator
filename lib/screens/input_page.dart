import 'dart:math';

import 'package:bmi_calculator/bmi_cal_arguments.dart';
import 'package:bmi_calculator/brain_calculator.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constant_styles.dart';
import 'package:bmi_calculator/components/input_text_widget.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/round_icon_button.dart';
import 'detail_route.dart';

int height = 180;
int weight = 74;
int age = 13;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedCard == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ImageTextWidget(
                      label: 'Male',
                      icon: FontAwesomeIcons.mars,
                    ),
                    function: () {
                      setState(() {
                        selectedCard = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedCard == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ImageTextWidget(
                      label: 'female',
                      icon: FontAwesomeIcons.venus,
                    ),
                    function: () {
                      setState(() {
                        selectedCard = Gender.female;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Height'.toUpperCase(),
                      style: kLabelTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kValueStyle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Color(0xFFFFFFFF),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: kMinHeight,
                      max: kMaxHeight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kValueStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  weight != 0 ? weight-- : weight = 0;
                                });
                              },
                            )),
                            Expanded(
                              child: RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kValueStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  age != 0 ? age-- : age = 0;
                                });
                              },
                            )),
                            Expanded(
                              child: RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              startResultsPage();
            },
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              color: kButtonColor,
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: BottomButton(
                    buttonText: 'calculate your bmi',
                    onTap: () {
                      startResultsPage();
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setTap(Gender gender) {
    setState(() {
      selectedCard = gender;
    });
  }

  void startResultsPage() {
    BrainCalculator brainCalculator =
        BrainCalculator(weight: weight, height: height);
    brainCalculator.calculateBMI();
    Navigator.pushNamed(context, '/results',
        arguments: BMIArguments(
            result: brainCalculator.getResult(),
            resultDescription: brainCalculator.getInterpretation(),
            resultScore: brainCalculator.calculateBMI()));
  }
}

enum Gender { male, female }

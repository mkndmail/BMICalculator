import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant_styles.dart';

const sizedBoxHeight = 15.0;
const iconSize = 80.0;

class ImageTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  ImageTextWidget({this.label, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          label.toUpperCase(),
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

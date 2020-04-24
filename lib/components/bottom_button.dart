import 'package:flutter/material.dart';
import '../constant_styles.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  BottomButton({@required this.buttonText, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        color: kButtonColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonText.toUpperCase(),
            style: kButtonStyle,
          ),
        ),
      ),
    );
  }
}

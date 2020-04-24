import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function onTap;
  final IconData iconData;

  RoundIconButton({@required this.onTap, @required this.iconData});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'constants.dart';

//const labelTextStyle = TextStyle(
//  fontSize: 18.0,
//  color: Color(0xFF8D8E98),
//);

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  IconContent({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon, // init from constructor
          //FontAwesomeIcons.mars,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label, // init from constructor
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

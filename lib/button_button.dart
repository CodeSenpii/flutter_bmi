import 'package:flutter/material.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xFFEB1555), //pink
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
        child: Center(
            child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}

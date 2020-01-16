import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

// lets customizing colors in the appbar, scaffold and accents like buttons
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(
      //primaryColor: Color(0xFF0A0E21),
      //accentColor: Colors.purple,
      //scaffoldBackgroundColor: Color(0xFF0A0E21),
      //textTheme: TextTheme(
      //body1: TextStyle(color: Colors.white),
      //),
      //),
      theme: ThemeData.dark().copyWith(
        // replace theme above
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        //accentColor: Colors.purple,
      ),
      home: InputPage(),
    );
  }
}

//class InputPage extends StatefulWidget {
//  @override
//  _InputPageState createState() => _InputPageState();
//}
//
//class _InputPageState extends State<InputPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('BMI CALCULATOR'),
//      ),
//      body: Center(
//        child: Text('Body Text'),
//      ),
////      floatingActionButton: Theme(// chnage the theme of any widget with wrap
////        data: ThemeData(accentColor: Colors.purple),
////        child: FloatingActionButton(
////          child: Icon(Icons.add),
////        ),
////      ),
//    );
//  }
//}

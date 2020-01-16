import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'button_button.dart';
import 'round_Icon_button.dart';
import 'calculator_brain.dart';

//const activeCardColor = Color(0xFF1D1E33);
//const inactiveCardColor = Color(0xFF111328);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//  Color maleCardColour = inactiveCardColor;
//  Color femaleCardColour = inactiveCardColor;

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 34;

  //Gender gender1;

//  void updateColor({Gender g}) {
//    if (g == Gender.male) {
//      if (maleCardColour == inactiveCardColor) {
//        maleCardColour = Color(activeCardColor); // not defined
//        femaleCardColour = inactiveCardColor;
//      } else
//        maleCardColour = inactiveCardColor; // defined above
//    }
//
//    if (g == Gender.female) {
//      if (femaleCardColour == inactiveCardColor) {
//        femaleCardColour = Color(activeCardColor);
//        maleCardColour = inactiveCardColor;
//      } else
//        femaleCardColour = inactiveCardColor;
//    }
//  }

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
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  //colour: maleCardColour,
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  // upgraded in male with reusable_card
                  onTap: () {
                    print('Female pressed');
                    setState(() {
                      //updateColor(g: Gender.female);
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    //colour: femaleCardColour,
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, label: "FEMALE"),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            //'180',
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          //activeColor: Color(0xFFEB1555),
                          //inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            print(newValue);
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            // using my custom button

                            icon: Icons.remove,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),

//                          FloatingActionButton(
//                            backgroundColor: Color(0xFF4C4F5E),
//                            child: Icon(
//                              Icons.add,
//                              color: Colors.white,
//                            ),
//                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          FloatingActionButton(
                            heroTag: "btn2",
                            onPressed: () {
                              print("Plus");
                              setState(() {
                                weight++;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                // replaced with ReusableCard in others
                child: ReusableCard(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            // using my custom button
                            icon: Icons.remove,

                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          FloatingActionButton(
                            heroTag: "btn1",
                            onPressed: () {
                              print("Plus");
                              setState(() {
                                age++;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          ButtomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain cb =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmiResult: cb.calculateBMI(),
                          resultText: cb.getResults(),
                          interpretation: cb.getInterpretation(),
                        )),
              );
            },
          ),
        ],
      ),
//      body: Container(
//        //color: Color(0xFF1D1E33),
//        margin: EdgeInsets.all(15.0),
//        decoration: BoxDecoration(
//          color: Color(0xFF1D1E33),
//          borderRadius: BorderRadius.circular(10.0),
//        ),
//        height: 200.0,
//        width: 170,
//        child: Center(child: Text('Body Text')),
//      ),
//      floatingActionButton: Theme(// chnage the theme of any widget with wrap
//        data: ThemeData(accentColor: Colors.purple),
//        child: FloatingActionButton(
//          child: Icon(Icons.add),
//        ),
//      ),
    );
  }
}

//class ButtomButton extends StatelessWidget {
//  ButtomButton({@required this.onTap, @required this.buttonTitle});
//
//  final Function onTap;
//  final String buttonTitle;
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: onTap,
//      child: Container(
//        color: Color(0xFFEB1555), //pink
//        margin: EdgeInsets.only(top: 10.0),
//        width: double.infinity,
//        height: 80.0,
//        child: Center(
//            child: Text(
//          buttonTitle,
//          style: TextStyle(
//            fontSize: 30.0,
//            fontWeight: FontWeight.bold,
//          ),
//        )),
//      ),
//    );
//  }
//}

//class IconContent extends StatelessWidget {
//  final IconData icon;
//  final String label;
//
//  IconContent({this.icon, this.label});
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Icon(
//          icon, // init from constructor
//          //FontAwesomeIcons.mars,
//          size: 80.0,
//        ),
//        SizedBox(
//          height: 15.0,
//        ),
//        Text(
//          label, // init from constructor
//          style: TextStyle(
//            fontSize: 18.0,
//            color: Color(0xFF8D8E98),
//          ),
//        ),
//      ],
//    );
//  }
//}

//class ReusableCard extends StatelessWidget {
//  final Color colour;
//  final Widget cardChild;
//
//  ReusableCard({@required this.colour, this.cardChild});
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: cardChild,
//      margin: EdgeInsets.all(10.0),
//      decoration: BoxDecoration(
//        color: colour,
//      ),
//    );
//  }
//}
// make your own button

//class RoundIconButton extends StatelessWidget {
//  RoundIconButton({@required this.icon, @required this.onPress});
//
//  final IconData icon;
//  final Function onPress;
//  @override
//  Widget build(BuildContext context) {
//    return RawMaterialButton(
//      child: Icon(icon),
//      onPressed: onPress,
//      elevation: 6.0,
//      constraints: BoxConstraints.tightFor(
//        width: 56.0,
//        height: 56.0,
//      ),
//      //shape: CircleBorder(),// change button shape here
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.circular(10.0),
//      ),
//      fillColor: Color(0xFF4C4F5E),
//    ); // building block of all buttons
//  }
//}

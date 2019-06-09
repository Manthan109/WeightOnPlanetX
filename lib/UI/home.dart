import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _result = 0.0;
  String _formattedText="";

  void valueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _result = calculateWeight(_weightController.text, 3.71);
          _formattedText="Your Weight on Mars is ${_result.toStringAsFixed(2)}Kg";
          break;
        case 1:
          _result = calculateWeight(_weightController.text, 10.44);
          _formattedText="Your Weight on Saturn is ${_result.toStringAsFixed(2)}Kg";
          break;
        case 2:
          _result = calculateWeight(_weightController.text, 3.7);
          _formattedText="Your Weight on Mercury is ${_result.toStringAsFixed(2)}Kg";
          break;
        case 3:
          _result = calculateWeight(_weightController.text, 11.15);
          _formattedText="Your Weight on Neptune is ${_result.toStringAsFixed(2)}Kg";
          break;
        case 4:
          _result = calculateWeight(_weightController.text, 24.79);
          _formattedText="Your Weight on Jupiter is ${_result.toStringAsFixed(2)}Kg";
          break;
        case 5:
          _result = calculateWeight(_weightController.text, 8.87);
          _formattedText="Your Weight on Venus is ${_result.toStringAsFixed(2)}Kg";
          break;
        case 6:
          _result = calculateWeight(_weightController.text, 8.87);
          _formattedText="Your Weight on Uranus is ${_result.toStringAsFixed(2)}Kg";
          break;
        case 7:
          _result = calculateWeight(_weightController.text, 0.62);
          _formattedText="Your Weight on Pluto is ${_result.toStringAsFixed(2)}Kg";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Weight On Planet X",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          backgroundColor: Colors.black26,
          centerTitle: true,
        ),
        body: new Container(
            alignment: Alignment.topCenter,
            child: ListView(
              padding: const EdgeInsets.all(2.5),
              children: <Widget>[
                new Center(
                    child: Image.asset("images/planet.png",
                        height: 120, width: 400)),
                Container(
                    margin: const EdgeInsets.all(3.0),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Enter Your Wieght On Earth",
                              hintText: "In Kilograms",
                              icon: Icon(Icons.person)),
                        ),
                        Padding(padding: EdgeInsets.all(0.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio<int>(
                              activeColor: Colors.red,
                              value: 0,
                              groupValue: radioValue,
                              onChanged: valueChanged,
                            ),
                            Text(
                              "Mars",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Radio<int>(
                              activeColor: Colors.amberAccent,
                              value: 1,
                              groupValue: radioValue,
                              onChanged: valueChanged,
                            ),
                            Text(
                              "Saturn",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Radio<int>(
                              activeColor: Colors.grey,
                              value: 2,
                              groupValue: radioValue,
                              onChanged: valueChanged,
                            ),
                            Text(
                              "Mercury",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio<int>(
                              activeColor: Colors.blue,
                              value: 3,
                              groupValue: radioValue,
                              onChanged: valueChanged,
                            ),
                            Text(
                              "Neptune",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Radio<int>(
                              activeColor: Colors.orange,
                              value: 4,
                              groupValue: radioValue,
                              onChanged: valueChanged,
                            ),
                            Text(
                              "Jupiter",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Radio<int>(
                              activeColor: Colors.yellowAccent,
                              value: 5,
                              groupValue: radioValue,
                              onChanged: valueChanged,
                            ),
                            Text(
                              "Venus",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio<int>(
                              activeColor: Colors.lightBlueAccent,
                              value: 6,
                              groupValue: radioValue,
                              onChanged: valueChanged,
                            ),
                            Text(
                              "Uranus",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Radio<int>(
                              activeColor: Colors.brown,
                              value: 7,
                              groupValue: radioValue,
                              onChanged: valueChanged,
                            ),
                            Text(
                              "Pluto",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                        ),
                        Text(
                          _formattedText,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0,color: Colors.deepOrange),
                        )
                      ],
                    ))
              ],
            )));
  }

  double calculateWeight(String weight, double gravityConstant) {
    if (weight.toString().isNotEmpty && int.parse(weight) > 0) {
      return (int.parse(weight) / 9.8) * gravityConstant;
    } else {
        _result=0.0;
      }
    }
  }


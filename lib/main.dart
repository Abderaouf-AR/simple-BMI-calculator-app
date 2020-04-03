import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(
      new MaterialApp(
        title: "BMI clculator",
        theme: ThemeData.light(),
        home: BMI_calculator(),
  )
  );
}

class BMI_calculator extends StatefulWidget {
  @override
  _BMI_calculatorState createState() => _BMI_calculatorState();
}

class _BMI_calculatorState extends State<BMI_calculator> {
  final TextEditingController _age_coltroller = new TextEditingController();
  final TextEditingController _height_coltroller = new TextEditingController();
  final TextEditingController _weight_coltroller = new TextEditingController();
  double _bmi=0.0;
  String _result="";

  void RESULT(){
    setState(() {
      String height = _height_coltroller.text;
      String weight = _weight_coltroller.text;
      if( height.isNotEmpty && double.parse(height) > 0.0){
        if( weight.isNotEmpty && double.parse(weight) > 0.0){
          _bmi = double.parse(weight) / ( double.parse(height)*double.parse(height));
          if(_bmi<18.5){
            _result= "Very slim! Take care of your self";
          }else if(_bmi>28.5){
            _result= "Override! very FAT!!!";
          } else {
            _result= "Very good... Try to keep this";
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
//          new Padding(padding: new EdgeInsets.all(6.0)),
          new Image.asset("images/bmi.png", height: 200.0, width: 200.0,),
//          new Padding(padding: new EdgeInsets.all(5.0)),
          Center(
            child: new Container(
              color: Colors.grey.shade300,
              margin: new EdgeInsets.all(5.0),
              alignment: Alignment.topCenter,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextField(
                    controller: _age_coltroller,
                    keyboardType: TextInputType.phone,
                    textDirection: TextDirection.ltr,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new TextField(
                    controller: _height_coltroller,
                    keyboardType: TextInputType.phone,
                    decoration: new InputDecoration(
                      labelText: "Height",
                      icon: new Icon(Icons.accessibility),
                      hintText: "Your height in meters",
                    ),
                  ),
                  new TextField(
                    controller: _weight_coltroller,
                    keyboardType: TextInputType.phone,
                    decoration: new InputDecoration(
                     labelText: "Weight",
                     hintText: "Your Weight in Kilograms",
                     icon: new Icon(Icons.assessment),
                   ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: new GestureDetector(
              child: new Container(
                padding: new EdgeInsets.all(18.0),
                decoration: new BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: new BorderRadius.circular(99.5),
                ),
                child: new Text(" Calculate "),
              ),
              onTap: () {
                RESULT();
              },
            ),
          ),
          new Padding(padding: new EdgeInsets.all(2.0)),
          Center(child: new Text("Your Bmi is $_bmi")),
          Center(child: new Text("$_result")),
          //new FlatButton.icon(onPressed: RESULT(_height_coltroller.text, _weight_coltroller.text), icon: new Icon(Icons.assessment), label: null)
        ],
      ),
      //floatingActionButton: new FloatingActionButton(onPressed: RESULT(_height_coltroller.text, _weight_coltroller.text),),
    );
  }
}

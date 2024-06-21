import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {

  
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String result = "";
  String input = "";
  dynamic num1 = 0;
  dynamic num2 = 0;
  String math = "";

  boxClick(String boxValue) {
    if (boxValue == "C") {
      input = "";
      num1 = 0;
      num2 = 0;
      math = "";
    } else if (boxValue == "+" || boxValue == "-" || boxValue == "÷" || boxValue == "x") {
      if (result.contains(".")){
        num1 = double.parse(result);
        math = boxValue;
        input = "";
      }
      else {
        num1 = int.parse(result);
        math = boxValue;
        input = "";
      }
    } else if (boxValue == ".") {
      if (input.contains(".")) {
        return;
      } else {
        input = input + boxValue;
      }
    } else if (boxValue == "=") {
      if (result.contains(".")){
        num2 = double.parse(result);
      }
      else {
        num2 = int.parse(result);
      }

      if (math == "+") {
        input = (num1 + num2).toString();
        if (input.contains(".") && input.length >10){
          input = input.substring(0,10);
        }
      } else if (math == "-") {
        input = (num1 - num2).toString();
        if (input.contains(".") && input.length >10){
          input = input.substring(0,10);
        }
      } else if (math == "x") {
        input = (num1 * num2).toString();
        if (input.contains(".") && input.length >10){
          input = input.substring(0,10);
        }
      } else if (math == "÷") {
        input = (num1 / num2).toString();
        if (input.contains(".") && input.length >10){
          input = input.substring(0,10);
        }
      }

      num1 = 0;
      num2 = 0;
      math = "";
    } else if (boxValue=="⌫"){
      if (input.isNotEmpty){
        input = input.substring(0,input.length-1);
      }
    }
     else {
      input = input + boxValue;
    }

    setState(() {
      result = input;
    });
  }

Widget buildButton(String boxValue) {

  return GestureDetector(
    
    child : Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 0.1),
      color: Colors.white,
    ),
    width: 97.8,  
    height: 97.8, 
    alignment: Alignment.center,

      child: Text(
        boxValue,
        style: const TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.w200,
        ),
      ),
    ),
    onTap: () => boxClick(boxValue),
  );
}
Widget buildMath(String boxValue) {

  Color boxColor = Colors.white; 
  Color textColor = Colors.black;

  if (boxValue == "+" || boxValue == "-" || boxValue == "x" 
   || boxValue == "÷" || boxValue == "%" || boxValue == "⌫" || boxValue == "C") {

    textColor = Colors.lightBlue;
  } else if (boxValue =="="){
    boxColor = Colors.lightBlue;
    textColor = Colors.white;
  }
  return GestureDetector(
    
    child : Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.1),
        color: boxColor,
      ),
      width: 97.8,  
      height: 97.8, 
      alignment: Alignment.center,

      child: Text(
        boxValue,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.w200,
          color: textColor,
        ),
      ),
    ),
    onTap: () => boxClick(boxValue),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              result,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 95,),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildMath("C"),
                  buildMath("%"),
                  buildMath("⌫"),
                  buildMath("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildMath("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildMath("x"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildMath("÷"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("."),
                  buildButton("0"),
                  buildMath("="),
                ],
              ),
            
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class simpleCalc extends StatefulWidget 
{
  const simpleCalc({super.key});
  @override
  State<simpleCalc> createState() => _simpleCalcState();
}

class _simpleCalcState extends State<simpleCalc> 
{
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  String? _msg;
  double? _result;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double txt = MediaQuery.of(context).textScaleFactor;
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _height,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'height in cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'weight in kg',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
              
              onPressed: calculateBMI,
            ),
            ElevatedButton(
              child: Text(
                "Clear",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: (){
                    _height.clear();
                    _weight.clear();
                    _msg = " ";
                    _result = null;
                    setState(() {
                    });
              },
            ),
            SizedBox(height: 15),
            Text(
              _result == null ? "Enter Value" : "${_result!.toStringAsFixed(2)}" + "\n" + "${_msg}",
              style: TextStyle(
                color: Color.fromARGB(255, 11, 27, 105),
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void calculateBMI() {
    double height = double.parse(_height.text) / 100;
    double weight = double.parse(_weight.text);
    String msg = "";

    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;
    if(result>25)
    {
      msg = "You are overweight";
    }
    else if(result<18)
    {
      msg = "You are underweight";
    }
    else
    {
      msg = "You are healthy";
    }
    _msg = msg;

    setState(() {});
  }
}
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI APP",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
        ),
        //backgroundColor: mainHexColor,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 130,
                          child: TextField(
                            controller: _heightController,
                            style: TextStyle(
                                fontSize: 42, fontWeight: FontWeight.w500),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Height",
                              hintStyle: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(.8)),
                            ),
                          ),
                        ),
                        Container(
                          width: 130,
                          child: TextField(
                            controller: _weightController,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 42, fontWeight: FontWeight.w500),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Weight",
                              hintStyle: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(.8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        double _h = double.parse(_heightController.text);
                        double _w = double.parse(_weightController.text);
                        setState(() {
                          _bmiResult = _w / (_h * _h);
                          if (_bmiResult > 25) {
                            _textResult = "You\'re over weight";
                          } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                            _textResult = "You have normal weight";
                          } else {
                            _textResult = "You\'re under weight";
                          }
                        });
                      },
                      child: Container(
                        child: Text(
                          "Result",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Text(
                        _bmiResult.toStringAsFixed(2),
                        style: TextStyle(fontSize: 90),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Visibility(
                        visible: _textResult.isNotEmpty,
                        child: Container(
                          child: Text(
                            _textResult,
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w400),
                          ),
                        )),
                    SizedBox(
                      height: 95,
                    ),
                  ],
                ),
              ),
            )));
  }
}

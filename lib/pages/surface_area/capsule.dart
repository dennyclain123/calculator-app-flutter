import 'package:flutter/material.dart';
import 'dart:math' as math;

class Capsule extends StatefulWidget {
  @override
  _CapsuleState createState() => _CapsuleState();
}

class _CapsuleState extends State<Capsule> {
  var radius = TextEditingController();
  var aside = TextEditingController();
  num area = 0;
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Capsule Surface Area Calculator",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Surface Area(A) = 2πr(2r+a)",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Radius(r)",
                              style: TextStyle(fontSize: 16),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: 200,
                            child: TextFormField(
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Required";
                                }
                              },
                              controller: radius,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.orange)),
                                  hintText: 'Type here',
                                  contentPadding: EdgeInsets.only(left: 10),
                                  filled: false,
                                  fillColor: Colors.orange),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Side(a)",
                              style: TextStyle(fontSize: 16),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: 200,
                            child: TextFormField(
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Required";
                                }
                              },
                              controller: aside,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.orange)),
                                  hintText: 'Type here',
                                  contentPadding: EdgeInsets.only(left: 10),
                                  filled: false,
                                  fillColor: Colors.orange),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        FlatButton(
                          onPressed: () {
                            bool isVaild = _formkey.currentState.validate();
                            if (!isVaild) {
                              return;
                            }
                            num r = num.parse(radius.text);
                            num a = num.parse(aside.text);
                            setState(() {
                              area = (2*math.pi*r)*((2*r)+a);
                            });
                          },
                          child: Text("Calculate"),
                          textColor: Colors.white,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              radius.clear();
                              aside.clear();
                              area = 0;
                            });
                          },
                          child: Text("Reset"),
                          textColor: Colors.white,
                          color: Colors.orange,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Surface Area = ${area.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 30),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

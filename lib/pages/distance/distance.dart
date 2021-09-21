import 'package:flutter/material.dart';
import 'dart:math' as math;
class Distance extends StatefulWidget {

  @override
  _DistanceState createState() => _DistanceState();
}

class _DistanceState extends State<Distance> {
  var x1 = TextEditingController();
  var x2 = TextEditingController();
  var y1 = TextEditingController();
  var y2 = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  num distance = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Distance Calculator",
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
                      "Distance = √(x2 - x1)² +(y2 - y1)²",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          child: TextFormField(
                            validator: (val){
                              if(val.isEmpty){
                                return "Required";
                              }
                            },
                            controller: x1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                    new BorderSide(color: Colors.orange)),
                                hintText: 'x1',
                                contentPadding: EdgeInsets.only(left: 10),
                                filled: false,
                                fillColor: Colors.orange),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: TextFormField(
                            validator: (val){
                              if(val.isEmpty){
                                return "Required";
                              }
                            },

                            controller: x2,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                    new BorderSide(color: Colors.orange)),
                                hintText: 'x2',
                                contentPadding: EdgeInsets.only(left: 10),
                                filled: false,
                                fillColor: Colors.orange),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          child: TextFormField(
                            validator: (val){
                              if(val.isEmpty){
                                return "Required";
                              }
                            },
                            controller: y1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                    new BorderSide(color: Colors.orange)),
                                hintText: 'y1',
                                contentPadding: EdgeInsets.only(left: 10),
                                filled: false,
                                fillColor: Colors.orange),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: TextFormField(
                            validator: (val){
                              if(val.isEmpty){
                                return "Required";
                              }
                            },

                            controller: y2,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                    new BorderSide(color: Colors.orange)),
                                hintText: 'y2',
                                contentPadding: EdgeInsets.only(left: 10),
                                filled: false,
                                fillColor: Colors.orange),
                          ),
                        ),

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
                            if(!isVaild){
                              return;
                            }
                            num x_one = num.parse(x1.text);
                            num x_two = num.parse(x2.text);
                            num y_one = num.parse(y1.text);
                            num y_two = num.parse(y2.text);
                            setState(() {
                              distance = math.sqrt(((x_two - x_one) * (x_two - x_one)) + ((y_two - y_one) * (y_two - y_one))  );
                            });
                          },
                          child: Text("Calculate"),
                          textColor: Colors.white,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 10,),
                        FlatButton(
                          onPressed: (){
                            setState(() {
                              x1.clear();
                              x2.clear();
                              y1.clear();
                              y2.clear();
                              distance = 0;
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
                        "Distance = ${distance.toStringAsFixed(2)}",
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

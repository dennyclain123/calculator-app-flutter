import 'package:flutter/material.dart';
import 'dart:math' as math;
class Cap extends StatefulWidget {

  @override
  _CapState createState() => _CapState();
}

class _CapState extends State<Cap> {
  var upperRadius = TextEditingController();
  var height = TextEditingController();
  var lowerRadius = TextEditingController();
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
          "Cap Surface Area Calculator",
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
                      "Surface Area(A)=2πRh + πr²",
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
                              "upperRadius(R)",
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
                              validator: (val){
                                if(val.isEmpty){
                                  return "Required";
                                }
                              },

                              controller: upperRadius,
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
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Height(h)",
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
                              validator: (val){
                                if(val.isEmpty){
                                  return "Required";
                                }
                              },

                              controller: height,
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
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "LowerRadius(r)",
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
                              validator: (val){
                                if(val.isEmpty){
                                  return "Required";
                                }
                              },

                              controller: lowerRadius,
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
                            if(!isVaild){
                              return;
                            }
                            num R = num.parse(upperRadius.text);
                            num h = num.parse(height.text);
                            num r = num.parse(lowerRadius.text);
                            setState(() {
                              area = (2*math.pi*r*h) + (math.pi * math.pow(r,2));
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
                              upperRadius.clear();
                              height.clear();
                              lowerRadius.clear();
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

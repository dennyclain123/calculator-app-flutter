import 'package:flutter/material.dart';
import 'dart:math' as math;
class Aside extends StatefulWidget {

  @override
  _AsideState createState() => _AsideState();
}

class _AsideState extends State<Aside> {
  var cside = TextEditingController();
  var bside = TextEditingController();
  num aside = 0;
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pythagoras Theorem: a² + b² = c²",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "a = √c²-b²",
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
                      "c side",
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
                      controller: cside,
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
                      "b side",
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
                      controller: bside,
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
              height: 10,
            ),
            Row(
              children: [
                FlatButton(
                  onPressed: () {
                    bool isVaild = _formkey.currentState.validate();
                    if(!isVaild){
                      return;
                    }
                    num c = num.parse(cside.text);
                    num b = num.parse(bside.text);
                    setState(() {
                      aside = math.sqrt((c * c)-(b*b));
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
                      cside.clear();
                      bside.clear();
                      aside = 0;
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
                "a side = ${aside.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}

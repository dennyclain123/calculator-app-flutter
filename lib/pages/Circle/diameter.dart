import 'package:flutter/material.dart';
import 'dart:math' as math;
class Diameter extends StatefulWidget {

  @override
  _DiameterState createState() => _DiameterState();
}

class _DiameterState extends State<Diameter> {
  var radius = TextEditingController();
  num diameter = 0;
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
              "Diameter = 2r",
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
                      "Radius",
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
                FlatButton(
                  onPressed: () {
                    bool isVaild = _formkey.currentState.validate();
                    if(!isVaild){
                      return;
                    }
                    num r = num.parse(radius.text);
                    setState(() {
                      diameter = 2 * r;
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
                      radius.clear();
                      diameter = 0;
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
                "Diameter = ${diameter.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}

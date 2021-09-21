import 'package:flutter/material.dart';
import 'dart:math' as math;
class SquareRoot extends StatefulWidget {
  @override
  _SquareRootState createState() => _SquareRootState();
}

class _SquareRootState extends State<SquareRoot> {
  var sqroot = TextEditingController();
  num sqRoot = 0;
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Squared Root Calculator",
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
                "√x",
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
                        "Squared Root",
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

                        controller: sqroot,
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
                      num s = num.parse(sqroot.text);
                      setState(() {
                        sqRoot = math.sqrt(s);
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
                        sqroot.clear();
                        sqRoot = 0;
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
                  "Squared Root = ${sqRoot.toStringAsFixed(2)}",
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

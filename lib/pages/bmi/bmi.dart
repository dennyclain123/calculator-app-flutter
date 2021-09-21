import 'package:flutter/material.dart';
class Bmi extends StatefulWidget {

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  var weight = TextEditingController();
  var feet = TextEditingController();
  var inches = TextEditingController();
  String bmi = "";
  String condition = "";
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "BMI Calculator",
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
                      "Weight(lbs) * 703/Height(inch)²",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("Weight (lb)",style: TextStyle(
                      fontSize: 18
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      child: TextFormField(
                        validator: (val){
                          if(val.isEmpty){
                            return "Required";
                          }
                        },
                        controller: weight,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                new BorderSide(color: Colors.orange)),
                            hintText: 'Your Weight',
                            contentPadding: EdgeInsets.only(left: 10),
                            filled: false,
                            fillColor: Colors.orange),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Height (ft)",style: TextStyle(
                        fontSize: 18
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 200,
                            child: TextFormField(
                              validator: (val){
                                if(val.isEmpty){
                                  return "Required";
                                }
                              },
                              controller: feet,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                      new BorderSide(color: Colors.orange)),
                                  hintText: 'Feet',
                                  contentPadding: EdgeInsets.only(left: 10),
                                  filled: false,
                                  fillColor: Colors.orange),
                            ),
                          ),
                          flex: 2,
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            width: 200,
                            child: TextFormField(
                              validator: (val){
                                if(val.isEmpty){
                                  return "Required";
                                }
                              },
                              controller: inches,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                      new BorderSide(color: Colors.orange)),
                                  hintText: 'Inches',
                                  contentPadding: EdgeInsets.only(left: 10),
                                  filled: false,
                                  fillColor: Colors.orange),
                            ),
                          ),
                          flex: 2,
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
                            num w = num.parse(weight.text);
                            num ft = num.parse(feet.text);
                            num inch = num.parse(inches.text);
                            num total = (ft*12)+inch;
                            num bmiNum = w * 703/(total * total);
                            // setState(() {
                            //   bmi = "Your Bmi is ${bmiNum.toStringAsFixed(1)}";
                            // });
                            if(bmiNum < 18.5){
                              setState(() {
                                condition = "You are UnderWeight, try gain your weight";
                                bmi = "Your Bmi is ${bmiNum.toStringAsFixed(1)}";
                              });
                            }else if(bmiNum > 18.5 && bmiNum < 25){
                              setState(() {
                                condition = "You are Normal Weight";
                                bmi = "Your Bmi is ${bmiNum.toStringAsFixed(1)}";
                              });
                            }else if(bmiNum > 25 && bmiNum < 30){
                              setState(() {
                                condition = "You are Over Weight";
                                bmi = "Your Bmi is ${bmiNum.toStringAsFixed(1)}";
                              });
                            }else{
                              setState(() {
                                condition = "You are Obesity, try lose your weight";
                                bmi = "Your Bmi is ${bmiNum.toStringAsFixed(1)}";
                              });
                            }
                          },
                          child: Text("Calculate"),
                          textColor: Colors.white,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 10,),
                        FlatButton(
                          onPressed: (){
                            setState(() {
                              weight.clear();
                              feet.clear();
                              inches.clear();
                              bmi = "";
                              condition = "";
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$bmi",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "$condition",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
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

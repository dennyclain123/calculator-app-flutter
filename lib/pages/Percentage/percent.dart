import 'package:flutter/material.dart';
class Percent extends StatefulWidget {

  @override
  _PercentState createState() => _PercentState();
}

class _PercentState extends State<Percent> {
  var value = TextEditingController();
  var totalvalue = TextEditingController();
  num percent = 0;
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
              "Percent = (Value/Total_Value) * 100",
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
                      "Value",
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
                      controller: value,
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
                      "Total Value",
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
                      controller: totalvalue,
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
                    num v = num.parse(value.text);
                    num t = num.parse(totalvalue.text);
                    setState(() {
                      percent = (v / t) * 100;
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
                      value.clear();
                      totalvalue.clear();
                      percent = 0;
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
                "${percent.toStringAsFixed(0)}% of ${totalvalue.text} = ${value.text}",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}

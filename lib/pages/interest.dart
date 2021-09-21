import 'dart:math';
import 'package:flutter/material.dart';
class Interest extends StatefulWidget {

  @override
  _InterestState createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  // controller
  TextEditingController principalTextEditingController =
  TextEditingController();
  TextEditingController rateofInterestTextEditingController =
  TextEditingController();
  TextEditingController termTextEditingController = TextEditingController();

  // currencices
  var _currencies = ['MM Kyat', 'Dollar', 'Euro'];

  String result = "";
  String _character = "simple";
  String currentValue = "";
  String nv = "";

  @override
  void initState() {
    currentValue = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            //image
            getImage(),

            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: ListTile(
                        title: Text(
                          "Simple Interest",
                          style: TextStyle(fontSize: 16),
                        ),
                        leading: Radio(
                          value: "simple",
                          groupValue: _character,
                          onChanged: (String value) {
                            setState(() {
                              // here it is simple
                              _character = value;
                            });
                          },
                        ),
                      ),
                    )),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: ListTile(
                        title: Text(
                          "Compound Interest",
                          style: TextStyle(fontSize: 16),
                        ),
                        leading: Radio(
                          value: "compound",
                          groupValue: _character,
                          onChanged: (String value) {
                            setState(() {
                              // here it is simple
                              _character = value;
                            });
                          },
                        ),
                      ),
                    )),
                Container(
                  width: 5.0,
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: principalTextEditingController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: "Principal",
                    hintText: "Enter a principal amount e.g, 1099",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: rateofInterestTextEditingController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: "Rate of Interest",
                    hintText: "Enter a rate per year",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      controller: termTextEditingController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Term",
                          hintText: "Enter number of year",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                ),
                Container(
                  width: 10,
                ),

                // dropdown menu
                Expanded(
                  child: DropdownButton<String>(
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: currentValue,
                    onChanged: (String newValue) {
                      _setSelectedValue(newValue);
                      this.nv = newValue;
                      setState(() {
                        this.currentValue = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                      color: Colors.orange,
                      textColor: Colors.white,
                      child: Text(
                        "Calculate".toUpperCase(),
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        this.result = _getEffectiveAmount(this.nv);
                        onDialogOpen(context, this.result);
                      },
                    )),
                Container(
                  width: 10,
                ),
                Expanded(
                    child: RaisedButton(
                      color: Colors.orange,
                      textColor: Colors.white,
                      child: Text(
                        "Reset".toUpperCase(),
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        _reset();
                      },
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _setSelectedValue(String newValue) {
    setState(() {
      this.currentValue = newValue;
    });
  }

  String _getEffectiveAmount(String newValue) {
    String newResult;
    double principal = double.parse(principalTextEditingController.text);
    double rate = double.parse(rateofInterestTextEditingController.text);
    double term = double.parse(termTextEditingController.text);

    double netpayableAmount = 0;
    if (_character == "simple") {
      netpayableAmount = principal + (principal * rate * term) / 100;
    } else if (_character == "compound") {
      netpayableAmount = principal * pow((1 + (rate / 100)), term);
    }

    if (term == 1) {
      newResult =
      "After ${term.toStringAsFixed(0)} year, you will have to pay total amount = ${netpayableAmount.toStringAsFixed(2)} $currentValue";
    } else {
      newResult =
      "After ${term.toStringAsFixed(0)} year, you will have to pay total amount = ${netpayableAmount.toStringAsFixed(2)} $currentValue";
    }
    return newResult;
  }

  void _reset() {
    principalTextEditingController.text = "";
    rateofInterestTextEditingController.text = "";
    termTextEditingController.text = "";
    result = "";
    currentValue = _currencies[0];
  }

  // dialog box

  void onDialogOpen(BuildContext context, String s) {
    var alertDialog = AlertDialog(
      title: Text("NP is selected...."),
      content: Text(s),
      backgroundColor: Colors.green,
      elevation: 8.0,
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(s),
          );
        });
  }
}

Widget getImage() {
  AssetImage assetImage = AssetImage("assets/images/interest.png");
  Image image = Image(
    image: assetImage,
    width: 150,
    height: 150,
  );

  return Container(
    child: image,
    margin: EdgeInsets.all(30),
  );
}


import 'package:flutter/material.dart';
class Volume extends StatefulWidget {

  @override
  _VolumeState createState() => _VolumeState();
}

class _VolumeState extends State<Volume> {
  var length = TextEditingController();
  var width = TextEditingController();
  var height = TextEditingController();
  num volume = 0;
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Volume Calculator",
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
                      "Volume = Length * Width * Height",
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
                              "Length",
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
                              controller: length,
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
                              "Width",
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
                              controller: width,
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
                              "Height",
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
                            num l = num.parse(length.text);
                            num w = num.parse(width.text);
                            num h = num.parse(height.text);
                            setState(() {
                              volume = l * w * h ;
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
                              length.clear();
                              width.clear();
                              height.clear();
                              volume = 0;
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
                        "Volume = ${volume.toStringAsFixed(2)}",
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

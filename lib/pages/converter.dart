import 'package:calculator/pages/Circle/circle.dart';
import 'package:calculator/pages/Mass/mass.dart';
import 'package:calculator/pages/Percentage/percentage.dart';
import 'package:calculator/pages/Rectangle/rectangle.dart';
import 'package:calculator/pages/bmi/bmi.dart';
import 'package:calculator/pages/calculator.dart';
import 'package:calculator/pages/Triangle/triangle.dart';
import 'package:calculator/pages/distance/distance.dart';
import 'package:calculator/pages/pythagoras/pythagoras.dart';
import 'package:calculator/pages/slope/slope.dart';
import 'package:calculator/pages/square_root/square_root.dart';
import 'package:calculator/pages/surface_area/surface.dart';
import 'package:calculator/pages/volume/volume.dart';
import 'package:flutter/material.dart';

class Convert extends StatefulWidget {
  @override
  _ConvertState createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    convert("assets/images/tri.png", "Triangle",Triangle()),
                   convert("assets/images/circle.png", "Circle",Circle()),
                    convert("assets/images/area.png", "Square",Rectangle()),
                  ],
                ),
                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    convert("assets/images/root.png", "Root",SquareRoot()),
                    convert("assets/images/volume.png", "Volume",Volume()),
                    convert("assets/images/mass.png", "Mass",Mass()),

                  ],
                ),
                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    convert("assets/images/speed.png", "Distance",Distance()),
                    convert("assets/images/bmi.png", "BMI",Bmi()),
                    convert("assets/images/percent (1).png", "Percent",Percentage()),
                  ],
                ),
                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    convert("assets/images/pytha.png", "Pythagoras",Pythagoras()),
                    convert("assets/images/slope.png", "Slope",Slope()),
                    convert("assets/images/surface.png", "Surface Area",Surface()),
                  ],
                ),

              ],
            ),
          )),
    );
  }
  InkWell convert(String img, String text, Widget page){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => page
        ));
      },
      child: Column(
        children: [
          Container(
              width: 40,
              height: 40,
              child: Image.asset(img)),
          Text(text,style: TextStyle(fontSize: 18),)
        ],
      ),
    );
  }
}

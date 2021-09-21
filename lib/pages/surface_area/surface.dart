import 'package:calculator/pages/surface_area/ball.dart';
import 'package:calculator/pages/surface_area/cap.dart';
import 'package:calculator/pages/surface_area/capsule.dart';
import 'package:calculator/pages/surface_area/cone.dart';
import 'package:calculator/pages/surface_area/cube.dart';
import 'package:calculator/pages/surface_area/cylinder.dart';
import 'package:calculator/pages/surface_area/rectangular.dart';
import 'package:calculator/pages/surface_area/square_pyramid.dart';
import 'package:flutter/material.dart';

class Surface extends StatefulWidget {
  @override
  _SurfaceState createState() => _SurfaceState();
}

class _SurfaceState extends State<Surface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Surface Area Categories",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
      body: SafeArea(
        child: GridView(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5
          ),
          children: [
            surface("assets/images/ball.png", "Ball Surface Area",Ball()),
            surface("assets/images/cone.png", "Cone Surface Area",Cone()),
            surface("assets/images/cube.png", "Cube Surface Area",Cube()),
            surface("assets/images/cylinder.png", "Cylinder Surface Area",Cylinder()),
            surface("assets/images/prism.png", "Rectangle Surface Area",Rectangular()),
            surface("assets/images/capsule.png", "Capsule Surface Area",Capsule()),
            surface("assets/images/cap.png", "Cap Surface Area",Cap()),
            surface("assets/images/square-pyramid.png", "Square Pyramid Surface Area",Pyramid()),
          ],
        ),
      ),
    );
  }
  Container surface(img, text,Widget page){
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => page
          ));
        },
        child: Card(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(10),
                child: Image.asset(img,fit: BoxFit.fill,),
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}

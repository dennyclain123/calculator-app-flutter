import 'package:calculator/pages/Rectangle/diagonal.dart';
import 'package:calculator/pages/Rectangle/length.dart';
import 'package:calculator/pages/Rectangle/perimeter.dart';
import 'package:calculator/pages/Rectangle/rectangle_area.dart';
import 'package:calculator/pages/Rectangle/width.dart';
import 'package:flutter/material.dart';
class Rectangle extends StatefulWidget {

  @override
  _RectangleState createState() => _RectangleState();
}

class _RectangleState extends State<Rectangle> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Rectangle Calculator",style: TextStyle(
            fontSize: 18,
            color: Colors.black54
        ),),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white24,
          indicatorWeight: 2.0,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.orange,
          labelStyle: TextStyle(fontSize: 14),
          tabs: [
            Tab(child: Text("Area"),),
            Tab(child: Text("Length"),),
            Tab(child: Text("Width"),),
            Tab(child: Text("Diagon"),),
            Tab(child: Text("Peri"),),
          ],
        ),
      ),
      body: SafeArea(
          child: TabBarView(
            controller: tabController,
            children: [
              RectangleArea(),
              Length(),
              Width(),
              Diagonal(),
              Perimater()

            ],
          )
      ),
    );
  }
}

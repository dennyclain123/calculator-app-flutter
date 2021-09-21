import 'package:calculator/pages/Triangle/area.dart';
import 'package:calculator/pages/Triangle/base.dart';
import 'package:calculator/pages/Triangle/height.dart';
import 'package:calculator/pages/Triangle/perimeter.dart';
import 'package:flutter/material.dart';

class Triangle extends StatefulWidget {
  @override
  _TriangleState createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
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
      title: Text("Triangle Calculator",style: TextStyle(
        fontSize: 18,
        color: Colors.black54
      ),),
      bottom: TabBar(
        controller: tabController,
        indicatorColor: Colors.white24,
        indicatorWeight: 2.0,
        unselectedLabelColor: Colors.black38,
        labelColor: Colors.orange,
        labelStyle: TextStyle(fontSize: 15),
        tabs: [
          Tab(child: Text("Area"),),
          Tab(child: Text("Height"),),
          Tab(child: Text("Base"),),
          Tab(child: Text("Perimeter"),),
        ],
      ),
    ),
      body: SafeArea(
          child: TabBarView(
            controller: tabController,
            children: [
              Area(),
              Height(),
              Base(),
              TrianglePerimater()
            ],
          )
      ),
    );

  }
}

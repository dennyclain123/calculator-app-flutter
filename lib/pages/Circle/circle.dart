import 'package:calculator/pages/Circle/area.dart';
import 'package:calculator/pages/Circle/circumference.dart';
import 'package:calculator/pages/Circle/diameter.dart';
import 'package:flutter/material.dart';
class Circle extends StatefulWidget {

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
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
        title: Text("Circle Calculator",style: TextStyle(
            fontSize: 18,
            color: Colors.black54
        ),),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white24,
          indicatorWeight: 2.0,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.orange,
          labelStyle: TextStyle(fontSize: 17),
          tabs: [
            Tab(child: Text("Area"),),
            Tab(child: Text("Diameter"),),
            Tab(child: Text("Circum"),),
          ],
        ),
      ),
      body: SafeArea(
          child: TabBarView(
            controller: tabController,
            children: [
              CircleArea(),
              Diameter(),
              Circum()
            ],
          )
      ),
    );
  }
}

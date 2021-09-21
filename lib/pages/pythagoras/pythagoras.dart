import 'package:calculator/pages/pythagoras/aside.dart';
import 'package:calculator/pages/pythagoras/bside.dart';
import 'package:calculator/pages/pythagoras/cside.dart';
import 'package:flutter/material.dart';
class Pythagoras extends StatefulWidget {

  @override
  _PythagorasState createState() => _PythagorasState();
}

class _PythagorasState extends State<Pythagoras> with SingleTickerProviderStateMixin{
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
        title: Text("Pythagoras Theorem Formula",style: TextStyle(
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
            Tab(child: Text("Hypotenuse"),),
            Tab(child: Text("a side"),),
            Tab(child: Text("b side"),),
          ],
        ),
      ),
      body: SafeArea(
          child: TabBarView(
            controller: tabController,
            children: [
              Cside(),
              Aside(),
              Bside(),
            ],
          )
      ),
    );

  }
}

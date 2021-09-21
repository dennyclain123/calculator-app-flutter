import 'package:calculator/pages/Percentage/percent.dart';
import 'package:calculator/pages/Percentage/total_value.dart';
import 'package:calculator/pages/Percentage/value.dart';
import 'package:flutter/material.dart';
class Percentage extends StatefulWidget {

  @override
  _PercentageState createState() => _PercentageState();
}

class _PercentageState extends State<Percentage> with SingleTickerProviderStateMixin {
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
        title: Text("Percentage Calculator",style: TextStyle(
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
            Tab(child: Text("Percent"),),
            Tab(child: Text("Value"),),
            Tab(child: Text("Total Value"),),
          ],
        ),
      ),
      body: SafeArea(
          child: TabBarView(
            controller: tabController,
            children: [
              Percent(),
              Value(),
              TotalValue()
            ],
          )
      ),
    );
  }
}

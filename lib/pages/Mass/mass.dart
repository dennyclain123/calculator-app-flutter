import 'package:calculator/pages/Mass/density.dart';
import 'package:calculator/pages/Mass/mass_mass.dart';
import 'package:flutter/material.dart';
class Mass extends StatefulWidget {

  @override
  _MassState createState() => _MassState();
}

class _MassState extends State<Mass> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
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
        title: Text("Mass Calculator",style: TextStyle(
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
            Tab(child: Text("Mass"),),
            Tab(child: Text("Density"),),
          ],
        ),
      ),
      body: SafeArea(
          child: TabBarView(
            controller: tabController,
            children: [
              MassCalculate(),
              Density(),
            ],
          )
      ),
    );
  }
}

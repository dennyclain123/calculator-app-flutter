import 'package:calculator/pages/calculator.dart';
import 'package:calculator/pages/converter.dart';
import 'package:calculator/pages/interest.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
            Container(
              padding: EdgeInsets.only(right: 10),
                width: 50,
                height: 50,
                child: Image.asset("assets/images/calculator.png")
            ),
        ],
        bottom: TabBar(
          controller: tabController,
          // indicator: BoxDecoration(
          //   color: Colors.orange,
          //   borderRadius: BorderRadius.circular(10)
          // ),
          indicatorColor: Colors.white24,
          indicatorWeight: 2.0,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.orange,
          labelStyle: TextStyle(fontSize: 20),
          tabs: [
            Tab(
              child: Text("Calculator",style: GoogleFonts.oswald(),),
            ),
            Tab(
              child: Text("Interest",style: GoogleFonts.oswald(),),
            ),
            Tab(
              child: Text("Others",style: GoogleFonts.oswald(),),
            ),

          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: [
            SimpleCalculator(),
            Interest(),
            Convert(),
          ],
        )
      ),
    );
  }
}

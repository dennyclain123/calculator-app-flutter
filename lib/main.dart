import 'package:calculator/pages/calculator.dart';
import 'package:calculator/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main(){
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: GoogleFonts.oswaldTextTheme(
          Theme.of(context).textTheme
        )
      ),
      home: Home(),
    );
  }
}


import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/ABM/costpmerDetails.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:taxinvoice/Quotation1.dart';
//import 'package:taxinvoice/login.dart';
//import 'package:taxinvoice/report.dart';

import 'Dashboard.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final background = SizedBox(
      width: 300,
      height: 300,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/e-invoice.png',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 400, bottom: 20),
              child: Text(
                'TAX INVOICE',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    backgroundColor: Colors.black),
              ),
            ),
            //Open Sans font
          ),
        ),
      ));
  //final description = Text ("Stay organized and in control of your finances easy-to-use ",style: TextStyle(fontFamily: "OpenSans",fontSize: 24,color:Colors.white),);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyLogin()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      background,
      //description
    ]));

    // )),
  }
}

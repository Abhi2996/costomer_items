import 'package:flutter/material.dart';
import 'package:project/ABM/costpmerDetails.dart';
import 'package:project/customer.dart';
import 'package:project/invoice%20demo.dart';
import 'package:project/invoice_page.dart';
import 'package:project/modalItem.dart';
import 'package:project/report.dart';
import 'package:project/transaction%20details.dart';
import 'invoice exp.dart';

import 'debit.dart';
import 'invoice.dart';
import 'item.dart';
import 'login.dart';
//import 'package:taxinvoice/navigation.dart';

import 'report.dart';

import 'company.dart';
import 'debit.dart';
import 'invoice.dart';
import 'login.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  // final greenOpacity = Container(
  //   color: Color.fromARGB(197, 233, 140, 249),
  // );
  List<Item> _item = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Stack(
        children: <Widget>[
          // Container(
          //   height: size.height * 2,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           alignment: Alignment.topCenter,
          //           image: Image.network(
          //                   'https://mars-metcdn-com.global.ssl.fastly.net/content/uploads/sites/101/2019/04/30162428/Top-Header-Background.png')
          //               .image)
          //               ),
          // ),
          SafeArea(
              //background,
              //greenOpacity,

              child: Column(
            children: <Widget>[
              Container(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 45,
                      child: Icon(
                        Icons.person_2_sharp,
                        color: Color(0xffCCCCCC),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 0.1,
                        ),
                        Text(
                          "Soujanya",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontStyle: FontStyle.normal,
                              letterSpacing: 1.5),
                        ),
                        Text('9880438931',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                letterSpacing: 1.5)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Dashboard",
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(height: 25),
              Expanded(
                  child: GridView
                      .count(crossAxisCount: 2, mainAxisSpacing: 10, children: <
                          Widget>[
                InkWell(
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Image.asset(
                          'assets/company.jpg',
                          scale: 12,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Company',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.blueGrey),
                        )
                      ])),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CompanyForm()));
                  },
                ),
                InkWell(
                  child: Card(
                      color: Colors.white,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/customer.png',
                              scale: 8,
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            Text(
                              'Customer',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.blueGrey),
                            )
                          ])),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CostomerDetails()),
                    );
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => CustomerForm()));
                  },
                ),
                InkWell(
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Image.asset(
                          'assets/bank.jpg',
                          scale: 9,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Bank',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                              color: Colors.blueGrey),
                        )
                      ])),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionDetailForm()));
                  },
                ),
                InkWell(
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Image.asset(
                          'assets/invoice.jpg',
                          scale: 7.5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Invoice',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                                color: Colors.blueGrey)),
                      ])),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InvoicePage()));
                  },
                ),
                InkWell(
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Image.asset('assets/item.jpg', scale: 3),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Items',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Colors.blueGrey))
                      ])),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ItemTable()));
                  },
                ),
                InkWell(
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Image.asset(
                          'assets/track.jpg',
                          scale: 6.5,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Track',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Colors.blueGrey))
                      ])),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                ),
              ])),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyLogin()));
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                      child: Text(
                    'Home',
                    style: TextStyle(fontSize: 20),
                  )),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

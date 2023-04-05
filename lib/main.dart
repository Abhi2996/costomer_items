// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/ABM/costpmerDetails.dart';
import 'package:project/customer.dart';
import 'package:project/invoice_page.dart';
import 'DashBoard.dart';

import 'item.dart';
import 'report.dart';

import 'company.dart';
import 'Splash_screen.dart';
import 'debit.dart';
import 'invoice.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'splashscreen',
      home: /*CostomerDetails() */ MyDashboard(),
    );
  }
}
// class SplashScreen extends StatefulWidget {
//   // const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   SplashScreenState createState() => SplashScreenState(); 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.amber,
//         child: Center(child: Text('hello',style:TextStyle(
//           fontSize:20,
//           fontWeight: FontWeight.bold,
//           color: Colors.black
//          ))),
//       ),
//     );
//   }

// }//    

 
// class SplashScreenState extends State<SplashScreen>{
//    @override
//   void initState(){
//     super.initState();
//     splash();
//   }
//   Future<Timer>splash() async {
//    return Timer(Duration(seconds:4),onDoneLoading); 
//   }

// onDoneLoading(){
//   Navigator.pushNamedAndRemoveUntil(context as BuildContext ,'/home', (route) => false);
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset("assets/invoice.jpg")
//         ],)
//     );
    
//   } 
// }


  

  
  
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    
      
//         drawer: Drawer(child: ListView(
//     // Important: Remove any padding from the ListView.
//     padding: EdgeInsets.zero,
//     children: [
//       const DrawerHeader(
//         decoration: BoxDecoration(
//           color: Colors.blue,
        
//         ),
//         child: Text('Tax Invoice System'),
//       ),
//       ListTile(
//         title: const Text('Invoice'),
//         //static const IconData receipt = IconData(0xe50c, fontFamily: 'MaterialIcons');
//         onTap: () {
//           // Update the state of the app.
//           // ...
//         },
//       ),
//       ListTile(
//         title: const Text('Payment'),
//         onTap: () {
//           // Update the state of the app.
//           // ...
//         },
//       ),
//       ListTile(
//         title: const Text('Profile'),
//         onTap: () {
//           // Update the state of the app.
//           // ...
//         },
//       ),
//     ],
//   ),
// ));}
  

        
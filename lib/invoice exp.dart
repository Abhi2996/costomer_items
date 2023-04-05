// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'db_helper.dart';
// import 'modalCompany.dart';
// import 'DashBoard.dart';

// class InvoicePage extends StatefulWidget {
//   const InvoicePage({super.key});

//   @override
//   State<InvoicePage> createState() => _InvoicePageState();
// }

// class _InvoicePageState extends State<InvoicePage> {
//   final String companyName= '';
  
// final TextEditingController xyzController = TextEditingController() ;
  
// final TextEditingController ADDController = TextEditingController() ;
  
// // final TextEditingController PhoneController = TextEditingController() ;
  
// // final TextEditingController IDController = TextEditingController() ;
  
// // final TextEditingController COPHONEController = TextEditingController() ;
  
// // final TextEditingController EMAILController = TextEditingController() ;

//   String result = "";
//   String _message = '';
// //  final String companyName = '';
//   String companyAddress = '';
//   String companyPhone = '';
//   String companyID = '';
//   String contactphone = '';
//   String email = '';
//   @override
//   Widget build(BuildContext context) {
//     //var companyName;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(title: Text('Invoice Form')),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.white,
//           child: Column(
//             children: [

//               Container(
//                 decoration: BoxDecoration(color: Colors.white),
//                 child: Center(
//                   child: Row(
//                     children: [
//                       // Image.asset(
//                       //   'assets/logo1.jpg',
//                       //   width: 150,
//                       //   height: 130,
//                       // ),
                
//                       SizedBox(width: 30),
                
//                       SizedBox(
//                         width: 150,
//                         height: 150,
//                         child: InkWell(
//                           // onTap: () async {
//                           //   print("tapped");
//                           //   final query = 'SELECT * FROM users';
//                           //   final result = await DatabaseHelper.rawQuery(query);
//                           //   print(result);
                      
//                           //   final companyName = result[0]['coname'];
//                           //   print(companyName);
                      
                            
//                           // },
//                           child: ListTile(
//                           //   onTap: () async {
//                           //   print("tapped");
//                           //   final query = 'SELECT * FROM users';
//                           //   final result = await DatabaseHelper.rawQuery(query);
//                           //   print(result);
                      
//                           //  final companyName = result[0]['coname'];
//                           //   print(companyName);
//                           //   },
                      
                            
//                           // },
//                             title: TextFormField(
//                               controller: xyzController,
//                                onTap: () async {
//                             print("tapped");
//                             final query = 'SELECT * FROM users';
//                             final result = await DatabaseHelper.rawQuery(query);
//                             print(result);
                      
//                            final companyName = result[0]['coname'];
//                            xyzController.text = companyName;
//                             print(companyName);
//                             },
                      
//                             style: TextStyle(
//                                     fontStyle: FontStyle.italic,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 25,
//                                     fontFamily: 'OpenSans'),
//                                 textAlign: TextAlign.start,),
//                                 subtitle: Text("Mlore\n9880438931\nc1\n90876756456\nsuj@gmail.com"),
                            
                              
//                           //       onTap: () async {
//                           //   print("tapped");
//                           //   final query = 'SELECT * FROM users';
//                           //   final result = await DatabaseHelper.rawQuery(query);
//                           //   print(result);
                      
//                           //   final companyName = result[0]['coname'];
//                           //   //xyzController.text = companyName;
                      
//                           //   print(companyName);
                      
                            
//                           // },
//                           //controller: xyzController,
                                
                                
                              
//                             ),
                            
//                           //     child: TextFormField(
//                           //       minLines: 1,
//                           //       maxLines: 4,
//                           //       // "${companyName},\n$companyAddress\n$companyPhone\n$companyID\n$contactphone",
//                           //       //companyName,
//                           //       onTap: () async {
//                           //   print("tapped");
//                           //   final query = 'SELECT * FROM users';
//                           //   final result = await DatabaseHelper.rawQuery(query);
//                           //   print(result);
                      
//                           //   // final companyADD = result[1]['coadd'];
//                           //   // final companyPhone=result[3]['cophone'];
//                           //   // final company_ID =result[3]['companyID'];
//                           //   // final contactPHONE = result[4]['contactphone'];
//                           //   // final email_id =result[5]['email'];
                      
                      
//                           //   // ADDController.text = companyName;
//                           //   // PhoneController.text = companyPhone;
//                           //   // IDController.text =company_ID;
//                           //   // COPHONEController.text = contactPHONE;
//                           //   // EMAILController.text = email_id;
                      
                      
                      
                      
//                           //   // print(companyADD);
//                           //   // print(companyPhone);
//                           //   // print(company_ID);
//                           //   // print(contactPHONE);
//                           //   // print(email_id);
                      
                            
//                           // },
//                           //       style: TextStyle(
//                           //         fontStyle: FontStyle.normal,
//                           //         fontWeight: FontWeight.normal,
//                           //         fontFamily: 'OpenSans',
//                           //         fontSize: 15,
//                           //       ),
//                           //       textAlign: TextAlign.start,
//                           //     ),
                      
//                             ),
//                       ),
//                     ]
//                         ),
//                 ),
              
//                     ),
                
                
              
//               Container(
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       Divider(
//                         color: Colors.black,
//                         thickness: 2,
//                       ),
//                       ListTile(
                         
//                         title: Text(
//                           "INVOICE\n",
//                           style: TextStyle(
//                               fontSize: 25,
//                               fontFamily: 'OpenSans',
//                               fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Text(
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'OpenSans',
//                               fontWeight: FontWeight.bold),
//                           "Invoice No:\nInvoice Date:",
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         child: ListTile(
//                           title: Text(
//                             "Soujanya",
//                             style: TextStyle(
//                                 fontFamily: 'OpenSans',
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Text(
//                             "Surathkal,\nMangalore\n9448084123\nsujusoujanya@gmail.com",
//                             style:
//                                 TextStyle(fontFamily: 'OpenSans', fontSize: 15),
//                           ),
//                         ),
//                       )
//                     ],
//                   )),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   color: Colors.white,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         DataTable(
//                           columns: const <DataColumn>[
//                             DataColumn(
//                               label: Text(
//                                 'Description',
//                                 style: TextStyle(
//                                     fontFamily: 'OpenSans',
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Price',
//                                 style: TextStyle(
//                                     fontFamily: 'OpenSans',
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Quantity',
//                                 style: TextStyle(
//                                     fontFamily: 'OpenSans',
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 'Total',
//                                 style: TextStyle(
//                                     fontFamily: 'OpenSans',
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                           rows: const <DataRow>[
//                             DataRow(
//                               cells: <DataCell>[
//                                 DataCell(Text('Keyboard',
//                                     style: TextStyle(
//                                         fontFamily: 'OpenSans',
//                                         fontWeight: FontWeight.normal))),
//                                 DataCell(Text('Rs.200',
//                                     style: TextStyle(
//                                         fontFamily: 'OpenSans',
//                                         fontWeight: FontWeight.normal))),
//                                 DataCell(Text("2",
//                                     style: TextStyle(
//                                         fontFamily: 'OpenSans',
//                                         fontWeight: FontWeight.normal))),
//                                 DataCell(Text("Rs.400",
//                                     style: TextStyle(
//                                         fontFamily: 'OpenSans',
//                                         fontWeight: FontWeight.normal))),
//                               ],
//                             ),
//                             DataRow(
//                               cells: <DataCell>[
//                                 DataCell(Text('Monitor',
//                                     style: TextStyle(
//                                         fontFamily: 'OpenSans',
//                                         fontWeight: FontWeight.normal))),
//                                 DataCell(Text('Rs.10,000',
//                                     style: TextStyle(
//                                         fontFamily: 'OpenSans',
//                                         fontWeight: FontWeight.normal))),
//                                 DataCell(Text('1',
//                                     style: TextStyle(
//                                         fontFamily: 'OpenSans',
//                                         fontWeight: FontWeight.normal))),
//                                 DataCell(Text("Rs,10,000",
//                                     style: TextStyle(
//                                         fontFamily: 'OpenSans',
//                                         fontWeight: FontWeight.normal)))
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     ListTile(
//                       title: Text(
//                         "PAYMENT METHOD\n",
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontFamily: 'OpenSans',
//                             fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         "Bank Name: \nBank Address: \nA/c no: \nIFSc: \n",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontFamily: 'OpenSans',
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     ListTile(title: Text("TERMS & CONDITIONS\n")),
//                   ],
//                 ),
//               )
//             ]
//           ),
//         )));
      
    
//   }
// }

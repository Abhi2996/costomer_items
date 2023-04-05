import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/ABM/Models/Costomer.dart';
import 'package:project/ABM/database/MyDatabase.dart';
import 'package:project/modalCustomer.dart';
import 'db_helper.dart';
import 'modalItem.dart';
import 'modalTransaction.dart';
import 'transaction details.dart';
import 'modalCompany.dart';
import 'DashBoard.dart';

class InvoicePage extends StatefulWidget {
  final Customer? customers1;
  final COSTOMER? cOSTOMER;
  const InvoicePage(
      {super.key,
      this.customers1,
      this.transactions,
      this.items,
      this.cOSTOMER});

  final Transactions? transactions;
  final Item? items;

//

//

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final String companyName = '';

  final TextEditingController xyzController = TextEditingController();

  final TextEditingController ADDController = TextEditingController();

  final TextEditingController PhoneController = TextEditingController();

  final TextEditingController IDController = TextEditingController();

  final TextEditingController COPHONEController = TextEditingController();

  final TextEditingController EMAILController = TextEditingController();
  final TextEditingController itemName = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController BNAME = TextEditingController();
  final TextEditingController BADD = TextEditingController();
  final TextEditingController BACC = TextEditingController();
  final TextEditingController BIFSC = TextEditingController();

  String result = "";
  String _message = '';
//  final String companyName = '';
  String companyAddress = '';
  String companyPhone = '';
  String companyID = '';
  String contactphone = '';
  String email = '';

//

  bool isLoading = false;
  List<Items> _items = List.empty(growable: true);
  //List<Items> _items = [];

  final MyDataBase _myDataBase = MyDataBase();
  @override
  //totest

  getDataFromDb() async {
    await _myDataBase.initializedDatabase();
    List<Map<String, Object?>> map = await _myDataBase
        .getBillByFlat_nolist('${widget.cOSTOMER?.costomer_id}');
    _items = [];
    for (int i = 0; i < map.length; i++) {
      _items.add(Items.fromMap(map[i]));
    }
  }

  //
  //
  // getDataFromDb() async {
  //   await _myDataBase.initializedDatabase();
  //   List<Map<String, Object?>> map = await _myDataBase.getBillreportlist();
  //   billReports = [];
  //   for (int i = 0; i < map.length; i++) {
  //     billReports.add(BillReport.fromMap(map[i]));
  //   }
  // }

  ///Refreshing list view
  Future<void> _refreshData() async {
    // Call a method to retrieve the updated data
    try {
      List<Items> updatedData = await getDataFromDb();

      // Call setState() to rebuild the widget with the updated data
      setState(() {
        _items = updatedData;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Try Again: \n$e  :bug!!')));
    }
  }

//

  @override
  Widget build(BuildContext context) {
    //var companyName;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Invoice Form')),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Row(children: [
                  Image.asset(
                    'assets/logo1.jpg',
                    width: 150,
                    height: 120,
                  ),
                  SizedBox(width: 50),
                  SizedBox(
                    width: 150,
                    height: 120,
                    child: InkWell(
                      // onTap: () async {
                      //   print("tapped");
                      //   final query = 'SELECT * FROM users';
                      //   final result = await DatabaseHelper.rawQuery(query);
                      //   print(result);

                      //   final companyName = result[0]['coname'];
                      //   print(companyName);

                      // },
                      child: ListTile(
                        onTap: () async {
                          print("tapped");
                          final query = 'SELECT * FROM users';
                          final result = await DatabaseHelper.rawQuery(query);
                          print(result);

                          final companyName = result[0]['coname'];
                          print(companyName);
                        },

                        // },
                        //change...................................................
                        // title: Text('${widget.customers1?.amt}',
                        title: Text('SM Softwares',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                fontFamily: 'OpenSans'),
                            textAlign: TextAlign.start),
                        subtitle: Text(
                            '\nBunts Hostel\nMangalore\n9880438931\nsm@gmail.com',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                fontFamily: 'OpenSans')),

                        //       onTap: () async {
                        //   print("tapped");
                        //   final query = 'SELECT * FROM users';
                        //   final result = await DatabaseHelper.rawQuery(query);
                        //   print(result);

                        //   final companyName = result[0]['coname'];
                        //   //xyzController.text = companyName;

                        //   print(companyName);

                        // },
                        //controller: xyzController,
                      ),

                      //     child: TextFormField(
                      //       minLines: 1,
                      //       maxLines: 4,
                      //       // "${companyName},\n$companyAddress\n$companyPhone\n$companyID\n$contactphone",
                      //       //companyName,
                      //       onTap: () async {
                      //   print("tapped");
                      //   final query = 'SELECT * FROM users';
                      //   final result = await DatabaseHelper.rawQuery(query);
                      //   print(result);

                      //   // final companyADD = result[1]['coadd'];
                      //   // final companyPhone=result[3]['cophone'];
                      //   // final company_ID =result[3]['companyID'];
                      //   // final contactPHONE = result[4]['contactphone'];
                      //   // final email_id =result[5]['email'];

                      //   // ADDController.text = companyName;
                      //   // PhoneController.text = companyPhone;
                      //   // IDController.text =company_ID;
                      //   // COPHONEController.text = contactPHONE;
                      //   // EMAILController.text = email_id;

                      //   // print(companyADD);
                      //   // print(companyPhone);
                      //   // print(company_ID);
                      //   // print(contactPHONE);
                      //   // print(email_id);

                      // },
                      //       style: TextStyle(
                      //         fontStyle: FontStyle.normal,
                      //         fontWeight: FontWeight.normal,
                      //         fontFamily: 'OpenSans',
                      //         fontSize: 15,
                      //       ),
                      //       textAlign: TextAlign.start,
                      //     ),
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ///////////////////////////////////////////////////==
                  //////////////////==
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      "INVOICE\n",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                      "Invoice No:\nInvoice Date:",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ListTile(
                      title: Text(
                        'Customer Info:\n${widget.customers1?.cuname.toString()}',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        children: [
                          Text("name:${widget.cOSTOMER?.Cname}")
                          /*
                            Text(cOSTOMER
                              'Address: ${widget.customers1?.cuadd.toString()}\nPhone: ${widget.cOSTOMER?..mobileno.toString()}\nEmail: ${widget.customers1?.cuemail.toString()}\nAmount Paid: ${widget.customers1?.amt}',
                              style:
                                  TextStyle(fontFamily: 'OpenSans', fontSize: 15),
                            ),
                            */
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // DataTable(
                      //   columns: const <DataColumn>[

                      //     DataColumn(
                      //       label: Text(
                      //         'Item',
                      //         style: TextStyle(
                      //             fontFamily: 'OpenSans',
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //     DataColumn(
                      //       label: Text(
                      //         'Item Name',
                      //         style: TextStyle(
                      //             fontFamily: 'OpenSans',
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //     DataColumn(
                      //       label: Text(
                      //         'Price',
                      //         style: TextStyle(
                      //             fontFamily: 'OpenSans',
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ],
                      //   rows: const <DataRow>[
                      //     DataRow(
                      //       cells: <DataCell>[
                      //         DataCell(Text('',
                      //             style: TextStyle(
                      //                 fontFamily: 'OpenSans',
                      //                 fontWeight: FontWeight.normal))),
                      //         DataCell(Text('Rs.200',
                      //             style: TextStyle(
                      //                 fontFamily: 'OpenSans',
                      //                 fontWeight: FontWeight.normal))),
                      //         DataCell(Text("2",
                      //             style: TextStyle(
                      //                 fontFamily: 'OpenSans',
                      //                 fontWeight: FontWeight.normal))),
                      //         DataCell(Text("Rs.400",
                      //             style: TextStyle(
                      //                 fontFamily: 'OpenSans',
                      //                 fontWeight: FontWeight.normal))),
                      //       ],
                      //     ),
                      //     DataRow(
                      //       cells: <DataCell>[
                      //         DataCell(Text('Monitor',
                      //             style: TextStyle(
                      //                 fontFamily: 'OpenSans',
                      //                 fontWeight: FontWeight.normal))),
                      //         DataCell(Text('Rs.10,000',
                      //             style: TextStyle(
                      //                 fontFamily: 'OpenSans',
                      //                 fontWeight: FontWeight.normal))),
                      //         DataCell(Text('1',
                      //             style: TextStyle(
                      //                 fontFamily: 'OpenSans',
                      //                 fontWeight: FontWeight.normal))),
                      //         DataCell(Text("Rs,10,000",
                      //             style: TextStyle(
                      //                 fontFamily: 'OpenSans',
                      //                 fontWeight: FontWeight.normal)))
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      DataTable(
                          // Datatable widget that have the property columns and rows.
                          columns: [
                            // Set the name of the column
                            DataColumn(
                              label: Text('ID'),
                            ),
                            DataColumn(
                              label: Text('Name'),
                            ),
                            DataColumn(
                              label: Text('LastName'),
                            ),
                            DataColumn(
                              label: Text('Age'),
                            ),
                          ],
                          rows: [
                            // Set the values to the columns
                            DataRow(cells: [
                              DataCell(Text("${widget.items?.itemid}")),
                              DataCell(Text("Alex")),
                              DataCell(Text("Anderson")),
                              DataCell(Text("18")),
                            ]),
                            DataRow(cells: [
                              DataCell(Text("2")),
                              DataCell(Text("John")),
                              DataCell(Text("Anderson")),
                              DataCell(Text("24")),
                            ]),
                          ]),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "PAYMENT METHOD\n",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Bank Name:${widget.transactions?.bname} \nBank Address:${widget.transactions?.badd} \nA/c no:${widget.transactions?.bacc} \nIFSc:${widget.transactions?.bifsc} \n",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ListTile(title: Text("TERMS & CONDITIONS\n")),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

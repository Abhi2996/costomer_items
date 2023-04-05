import 'package:flutter/material.dart';
import 'package:project/ABM/Models/Costomer.dart';
import 'package:project/ABM/database/MyDatabase.dart';
import 'package:project/ABM/itemslistCostomer.dart';
import 'package:project/DisplayItem.dart';
import 'package:project/customer.dart';
import 'package:project/invoice.dart';
import 'package:project/invoice_page.dart';
import 'package:project/item.dart';

class CostomerDetails extends StatefulWidget {
  const CostomerDetails({super.key});

  @override
  State<CostomerDetails> createState() => _CostpmerDetailsState();
}

class _CostpmerDetailsState extends State<CostomerDetails> {
  // final List<String> customers = [
  //   'Customer A',
  //   'Customer B',
  //   'Customer C',
  //   'Customer D',
  //   'Customer E',
  // ];
  List<COSTOMER> costomer = [];

  final MyDataBase _myDataBase = MyDataBase();

  getDataFromDb() async {
    await _myDataBase.initializedDatabase();
    List<Map<String, Object?>> map = await _myDataBase.getFlatOwnerlist();
    costomer = [];
    for (int i = 0; i < map.length; i++) {
      costomer.add(COSTOMER.fromMap(map[i]));
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
      List<COSTOMER> updatedData = await getDataFromDb();

      // Call setState() to rebuild the widget with the updated data
      setState(() {
        costomer = updatedData;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Try Again: \n$e  :bug!!')));
    }
  }

  @override
  void initState() {
    getDataFromDb();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Customer List'),
            IconButton(
                onPressed: () {
                  setState(() {
                    _refreshData();
                  });
                },
                icon: Icon(Icons.refresh))
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: costomer.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              // Function to execute on long press
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete Item?'),
                    content: Text('Are you sure you want to delete this item?'),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop(true);
                          String _costomer = await costomer[index].Cname;
                          await _myDataBase
                              .deleteFlatOwnerlist(costomer[index]);
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text('${_costomer.toUpperCase()}Deleted')));
                          }
                        },
                        child: Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Perform delete operation here
                          Navigator.of(context).pop(false);
                          ;
                        },
                        child: Text('No'),
                      ),
                    ],
                  );
                },
              );

              print('Card $index is tapped');
            },
            child: Card(
              elevation: 11,
              child: ListTile(
                title: Column(
                  children: [
                    Text(costomer[index].Cname),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemTable(
                                      costomer: costomer[index],
                                    )),
                          );
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    //navigate to item invoice
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InvoicePage(
                                cOSTOMER: costomer[index],
                              )),
                    );
                    ////////////////
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => CostameritemList()),
                    // );
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // COSTOMER costomer = COSTOMER(
          //   Cname: "abhi",
          //   mobileno: "999000",
          //   email: "a@gmail.com",
          // );
          // await _myDataBase.insertFlatOwnerlist(costomer);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CustomerForm()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

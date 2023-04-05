import 'package:flutter/material.dart';
import 'package:project/ABM/Models/Costomer.dart';
import 'package:project/ABM/database/MyDatabase.dart';
import 'package:project/DisplayItem.dart';
import 'package:project/customer.dart';
import 'package:project/invoice.dart';
import 'package:project/invoice_page.dart';
import 'package:project/item.dart';

class CostameritemList extends StatefulWidget {
  final COSTOMER? costomer;
  const CostameritemList({super.key, this.costomer});

  @override
  State<CostameritemList> createState() => _CostpmerDetailsState();
}

class _CostpmerDetailsState extends State<CostameritemList> {
  bool isLoading = false;
  //List<Items> _items = List.empty(growable: true);
  List<Items> _items = [];

  final MyDataBase _myDataBase = MyDataBase();
  @override
  //totest

  // getDataFromDb() async {
  //   await _myDataBase.initializedDatabase();
  //   List<Map<String, Object?>> map = await _myDataBase
  //       .getBillByFlat_nolist('${widget.costomer?.costomer_id}');
  //   _items = [];
  //   for (int i = 0; i < map.length; i++) {
  //     _items.add(Items.fromMap(map[i]));
  //   }
  // }

  //
  //
  getDataFromDb() async {
    await _myDataBase.initializedDatabase();
    List<Map<String, Object?>> map = await _myDataBase.getBillreportlist();
    _items = [];
    for (int i = 0; i < map.length; i++) {
      _items.add(Items.fromMap(map[i]));
    }
  }

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
  void initState() {
    getDataFromDb();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('C Items List'),
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
        itemCount: _items.length,
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
                          // Navigator.of(context).pop(true);
                          // String _costomer = await costomer[index].Cname;
                          // await _myDataBase
                          //     .deleteFlatOwnerlist(costomer[index]);
                          // if (mounted) {
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content:
                          //           Text('${_costomer.toUpperCase()}Deleted')));
                          // }
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
                    Text("${_items[index].iname}"),
                    IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => ItemTable(
                          //             costomer: costomer[index],
                          //           )),
                          // );
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    // navigate to item invoice
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => InvoicePage(
                    //             cOSTOMER: costomer[index],
                    //           )),
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

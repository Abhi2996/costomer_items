import 'package:flutter/material.dart';



import 'package:project/invoice_page.dart';

import 'db_helper.dart';
import 'package:project/modalItem.dart';
import 'package:project/item.dart';

class DisplayItem extends StatefulWidget {
  const DisplayItem({super.key});

  @override
  State<DisplayItem> createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
  List<Item> _item = [];

@override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final itm = await DatabaseHelper.getItems();
    setState(() {
      _item = itm.cast<Item>();
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Items'),
        ),
        body: ListView.builder(
          itemCount: _item.length,
          itemBuilder: (context, index) {
            final user3 = _item[index];
            
            return ListTile(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemTable(items: user3),
                  ),
                );
                if (result != null) {
                  final updatedItem = result['user3'] as Item;
                  final user3Id = result['id3'] as int;
                  await DatabaseHelper.updateItem(user3Id, updatedItem as Item);
                  await _fetchItems();
                }
              },
              // title: Text(user.coname),
              // subtitle: Text('${user.coadd}/n, ${user.cophone}/n,${user.qnum}/n,${user.qdate}/n,${user.gstnum}/n'),
              title: Card(
                color: Color.fromARGB(255, 240, 211, 221),
                child: Column(
                children: [
                  SizedBox(height: 30,),
                  Column(
                    children: [
                      Text('Item id:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 10),
             
                     Text('${user3.itemid}',style:const TextStyle(fontSize: 20)),
                    ],
                  ),
                
                  SizedBox(height: 10),
                
                  Column(
                    children: [
                      Text('Item Name:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 10),
             
                     Text('${user3.iname}',style:const TextStyle(fontSize: 20)),
                    ],
                  ),
                
                  SizedBox(height: 10),
                
                  Column(
                    children: [
                      Text('Quantity:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                
                      SizedBox(width: 20),
                      Text('${user3.quantity}',style:TextStyle(fontSize: 20)),
                   ],
                  ),
                
                  SizedBox(height: 10),
                
                  Column(
                    children: [
                      Text('Price:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user3.price}',style:TextStyle(fontSize: 20),),
                    ],
                  ),
                
                  SizedBox(height: 10),
                
                Column(
                    children: [
                      Text('Customer Name:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user3.custname}',style:TextStyle(fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 10),
                  
                
                  Column(
                    children: [
                      Text('Customer ID:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user3.custID}',style:TextStyle(fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 10),
                   Column(
                    children: [
                    
                      //////////////////////////////
                       IconButton(
                icon: Icon(Icons.payment),
                onPressed: () async {
                  final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvoicePage(items: _item[index],),
                  ),
                );
                
                },
              )
                    ],
                  ),
                 
                 
                
                 // SizedBox(height: 50),
                
                  // add other desired attributes here
                 ] ),
              ),
  



              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  bool confirmDelete = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirm Delete"),
                        content:
                            Text("Are you sure you want to delete this user?"),
                        actions: [
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.pop(context, false),
                          ),
                          TextButton(
                            child: Text("Delete"),
                            onPressed: () => Navigator.pop(context, true),
                          ),
                        ],
                      );
                    },
                  );
                  if (confirmDelete != null && confirmDelete) {
                    
                    await DatabaseHelper.deleteItems(user3.id3!);
                    await _fetchItems();
                  }
                },
              ));

             
   } )






    );
  }
}
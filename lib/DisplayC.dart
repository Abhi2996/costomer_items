import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/customer.dart';
import 'package:project/invoice_page.dart';
import 'package:project/modalItem.dart';

import 'db_helper.dart';
import 'modalCustomer.dart';

class DisplayCustomer extends StatefulWidget {
  const DisplayCustomer({super.key});

  @override
  State<DisplayCustomer> createState() => _DisplayCustomerState();
}

class _DisplayCustomerState extends State<DisplayCustomer> {
  List<Customer> _customer = [];

@override
  void initState() {
    super.initState();
    _fetchCustomers();
  }

  Future<void> _fetchCustomers() async {
    final cust = await DatabaseHelper.getCustomers();
    setState(() {
      _customer = cust;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Customers'),
        ),
        body: ListView.builder(
          itemCount: _customer.length,
          itemBuilder: (context, index) {
            final user1 = _customer[index];
             List<Item> _item = [];
            return ListTile(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerForm(customers1: user1),
                  ),
                );
                if (result != null) {
                  final updatedCustomer = result['user1'] as Customer;
                  final user1Id = result['id1'] as int;
                  await DatabaseHelper.updateCustomer(user1Id, updatedCustomer as Customer);
                  await _fetchCustomers();
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
                      Text('Customer ID:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 10),
             
                     Text('${user1.customerId}',style:const TextStyle(fontSize: 20)),
                    ],
                  ),
                
                  SizedBox(height: 10),
                
                  Column(
                    children: [
                      Text('Customer Name:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 10),
             
                     Text('${user1.cuname}',style:const TextStyle(fontSize: 20)),
                    ],
                  ),
                
                  SizedBox(height: 10),
                
                  Column(
                    children: [
                      Text('Customer Address:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                
                      SizedBox(width: 20),
                      Text('${user1.cuadd}',style:TextStyle(fontSize: 20)),
                   ],
                  ),
                
                  SizedBox(height: 10),
                
                  Column(
                    children: [
                      Text('Customer Phone:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user1.cuphone}',style:TextStyle(fontSize: 20),),
                    ],
                  ),
                
                  SizedBox(height: 10),
                
                Column(
                    children: [
                      Text('Customer Email:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user1.cuemail}',style:TextStyle(fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 10),
                  //  Column(
                  //   children: [
                  //     Text('COMPANY ID:',style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  // fontSize: 20.0,
                  // color: Colors.black,),),
                  //     SizedBox(width: 20),
                  //     Expanded(child: Text('${user1.company_id}',style:TextStyle(fontSize: 20),)),
                  //   ],
                  // ),
                  Column(
                    children: [
                      Text('Item ID:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user1.itemID}',style:TextStyle(fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 10),
                   Column(
                    children: [
                      Text('Amount:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user1.amt}',style:TextStyle(fontSize: 20),),
                      //////////////////////////////
                       IconButton(
                icon: Icon(Icons.payment),
                onPressed: () async {
                  final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvoicePage(/*customers1: user1,*/items: _item[index]),
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
                    
                    await DatabaseHelper.deleteCustomer(user1.id1!);
                    await _fetchCustomers();
                  }
                },
              ));

             
   } )






    );
  }
}
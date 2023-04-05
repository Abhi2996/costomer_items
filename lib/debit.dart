// import 'package:flutter/material.dart';

// class Item {
//   String ID;
//   String name;
//   int quantity;
//   double price;

//   Item(this.ID, this.name, this.quantity, this.price);
// }

// class ItemTable extends StatefulWidget {
//   @override
//   _ItemTableState createState() => _ItemTableState();
// }

// class _ItemTableState extends State<ItemTable> {
//   List<Item> _items = [];
//   TextEditingController _itemID = TextEditingController();
//   TextEditingController _itemNameController = TextEditingController();
//   TextEditingController _quantityController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//   TextEditingController _customerID = TextEditingController();
//   TextEditingController _customerName = TextEditingController();

//   void _addItem() {
//     String ID = _itemID.text;
//     String name = _itemNameController.text;
//     int quantity = int.parse(_quantityController.text);
//     double price = double.parse(_priceController.text);

//     setState(() {
//       _items.add(Item(ID, name, quantity, price));
//     });
//     _itemID.clear();
//     _itemNameController.clear();
//     _quantityController.clear();
//     _priceController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(title: Text('Item Table')),
//         body: Column(children: [
//           Padding(
//               padding: EdgeInsets.all(10),
//               child: Container(
//                 child: Column(children: [
//                   TextFormField(
//                     controller: _customerName,
//                     decoration: InputDecoration(
//                         labelText: 'Customer Name',
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: Colors.black)),
//                         hintText: 'Enter Customer Name',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: _customerID,
//                     decoration: InputDecoration(
//                         labelText: 'Customer ID',
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: Colors.black)),
//                         hintText: 'Enter Customer ID',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: _itemNameController,
//                     decoration: InputDecoration(
//                         labelText: 'Item ID',
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: Colors.black)),
//                         hintText: 'Enter item ID',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: _itemNameController,
//                     decoration: InputDecoration(
//                         labelText: 'Item Name',
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: Colors.black)),
//                         hintText: 'Enter item name',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: _quantityController,
//                     decoration: InputDecoration(
//                         labelText: 'Item Quantity',
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: Colors.black)),
//                         hintText: 'Enter item qunatity ',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: _priceController,
//                     decoration: InputDecoration(
//                         labelText: 'Item Price',
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: Colors.black)),
//                         hintText: 'Enter item price ',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   SizedBox(
//                     height: 100,
//                   ),
//                   ElevatedButton(
//                     onPressed: _addItem,
//                     child: Text('Add Item'),
//                   ),
//                 ]),
//               )),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _items.length,
//               itemBuilder: (BuildContext context, int index) {
//                 Item item = _items[index];
//                 return ListTile(
//                   title: Text(item.name),
//                   subtitle: Text(
//                       '${item.quantity} x ${item.price} = ${item.quantity * item.price}'),
//                 );
//               },
//             ),
//           ),
//         ]));
//   }
// }



// // TextFormField(
// //               controller: _customerName,
// //               decoration: InputDecoration(
// //                   focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                       borderSide: BorderSide(color: Colors.black)),
// //                   hintText: 'Enter the Name',
// //                   labelText: 'Name',
// //                   icon: Icon(Icons.person),
// //                   border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(10))),
// //               // validator: (value) =>
// //               //     value!.isEmpty ? 'Please enter customer name' : null,
// //               // onSaved: (value) =>
// //               //     _customerName = value! as TextEditingController,
// //             ),
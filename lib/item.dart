import 'package:flutter/material.dart';
import 'package:project/ABM/Models/Costomer.dart';
import 'package:project/ABM/database/MyDatabase.dart';
import 'package:project/DisplayItem.dart';

import 'DisplayBank.dart';
import 'db_helper.dart';
import 'modalItem.dart';

class ItemTable extends StatefulWidget {
  final MyDataBase? myDataBase;
  const ItemTable({super.key, this.items, this.costomer, this.myDataBase});
  final Item? items;
  final COSTOMER? costomer;
  @override
  _ItemTableState createState() => _ItemTableState();
}

class _ItemTableState extends State<ItemTable> {
  List<Item> _items = [];
  TextEditingController _itemID = TextEditingController();
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _customerID = TextEditingController();
  TextEditingController _customerName = TextEditingController();

  //
  final MyDataBase _myDataBase = MyDataBase();
  // void _addItem() {
  //   String ID = _itemID.text;
  //   String name = _itemNameController.text;
  //   int quantity = int.parse(_quantityController.text);
  //   double price = double.parse(_priceController.text);

  //   setState(() {
  //     _items.add(Item(ID, name, quantity, price));
  //   });}
  // _itemID.clear();
  // _itemNameController.clear();
  // _quantityController.clear();
  // _priceController.clear();

  void addItems() async {
    final items = Items(
        iname: _itemNameController.text,
        qty: int.parse(_quantityController.text),
        price: double.tryParse(_priceController.text),
        costomer_id: int.parse(_customerID.text));
    await widget.myDataBase!.insertReportlist(items);
  }

  @override
  void initState() {
    super.initState();

    _itemID = TextEditingController(
        text: widget.items?.id3 != null ? widget.items!.id3.toString() : '');

    _itemNameController =
        TextEditingController(text: widget.items?.iname ?? '');
    _priceController = TextEditingController(
        text:
            widget.items?.price != null ? widget.items!.price.toString() : '');

    _quantityController = TextEditingController(
        text: widget.items?.quantity != null
            ? widget.items!.quantity.toString()
            : '');
    _customerName = TextEditingController(text: widget.items?.custname ?? '');
    _customerID = TextEditingController(text: widget.items?.custID ?? '');
  }

  @override
  void dispose() {
    _itemID.dispose();
    _itemNameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _customerName.dispose();
    _customerID.dispose();

    super.dispose();
  }

  void _handleSubmit() async {
    final user3 = Item(
      id3: widget.items?.id3,
      itemid: _itemID.text,
      // use the id of the user being edited, if provided
      iname: _itemNameController.text,
      quantity: int.tryParse(_quantityController.text) ?? 0,
      price: double.tryParse(_priceController.text) ?? 0,
      custname: _customerName.text,
      custID: _customerID.text,
    );
    bool shouldProceed = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(widget.items == null
                  ? 'Add User'
                  : '   User ${widget.items!.itemid}?'),
              content: Text(widget.items == null
                  ? 'Are you sure you want to add this user?'
                  : 'Are you sure you want to update ${widget.items!.itemid}?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Yes')),
              ],
            ));

    if (shouldProceed) {
      int result;
      if (widget.items == null) {
        result = await DatabaseHelper.addItem(user3);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          _customerID.clear();
          _customerName.clear();
          _itemNameController.clear();
          _priceController.clear();
          _quantityController.clear();
          _itemID.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to add user.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        result = await DatabaseHelper.updateItem(user3.id3!, user3);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User updated successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          _itemID.clear();
          _itemNameController.clear();
          _quantityController.clear();
          _priceController.clear();
          _customerName.clear();
          _customerID.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to update user.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ///
    _customerID.text = "${widget.costomer?.costomer_id}";
    ////
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Item Table')),
        body: Column(children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Column(children: [
                  TextFormField(
                    controller: _customerName,
                    decoration: InputDecoration(
                        labelText: 'Customer Name',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Enter Customer Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _customerID,
                    decoration: InputDecoration(
                        labelText: 'Customer ID',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Enter Customer ID',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _itemID,
                    decoration: InputDecoration(
                        labelText: 'Item ID',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Enter item ID',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _itemNameController,
                    decoration: InputDecoration(
                        labelText: 'Item Name',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Enter item name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _quantityController,
                    decoration: InputDecoration(
                        labelText: 'Item Quantity',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Enter item qunatity ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(
                        labelText: 'Item Price',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Enter item price ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //_handleSubmit;
                      setState(() {
                        addItems();
                      });
                    },
                    child: Text('Submit'),
                  ),
                ]),
              )),
          SizedBox(
            width: 4,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DisplayItem()));
            },
            child: Text("see data inserted "),
          ),
        ]));
  }
}



// TextFormField(
//               controller: _customerName,
//               decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: Colors.black)),
//                   hintText: 'Enter the Name',
//                   labelText: 'Name',
//                   icon: Icon(Icons.person),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10))),
//               // validator: (value) =>
//               //     value!.isEmpty ? 'Please enter customer name' : null,
//               // onSaved: (value) =>
//               //     _customerName = value! as TextEditingController,
//             ),

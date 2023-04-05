import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/DisplayBank.dart';
import 'package:project/modalCompany.dart';
import 'package:project/modalTransaction.dart';

import 'DashBoard.dart';
import 'db_helper.dart';

class TransactionDetailForm extends StatefulWidget {
  const TransactionDetailForm({super.key, this.transactions});
  final Transactions? transactions;

  @override
  State<TransactionDetailForm> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetailForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _bankName = TextEditingController();
  TextEditingController _bankAddress = TextEditingController();
  TextEditingController _bankAccountNumber = TextEditingController();
  TextEditingController _bankIFSCCode = TextEditingController();

  @override
  void initState() {
    super.initState();

    _bankName = TextEditingController(text: widget.transactions?.bname ?? '');
    _bankAddress = TextEditingController(text: widget.transactions?.badd ?? '');
    _bankAccountNumber =
        TextEditingController(text: widget.transactions?.bacc ?? '');
    _bankIFSCCode =
        TextEditingController(text: widget.transactions?.bifsc ?? '');
  }

  @override
  void dispose() {
    _bankName.dispose();
    _bankAddress.dispose();
    _bankAccountNumber.dispose();
    _bankIFSCCode.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    final user2 = Transactions(
      bname: _bankName.text,
      badd: _bankAddress.text,
      bacc: _bankAccountNumber.text,
      bifsc: _bankIFSCCode.text,
    );

    bool shouldProceed = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(widget.transactions == null
                  ? 'Add User'
                  : 'Update User ${widget.transactions!.bname}?'),
              content: Text(widget.transactions == null
                  ? 'Are you sure you want to add this user?'
                  : 'Are you sure you want to update ${widget.transactions!.bname}?'),
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
      if (widget.transactions == null) {
        result = await DatabaseHelper.addTransaction(user2);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          _bankName.clear();
          _bankAddress.clear();
          _bankAccountNumber.clear();
          _bankIFSCCode.clear();
          //_gstnum.clear();
          // _quotationumController.clear();
          // _quotationDateController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to add user.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }
  }
  // } else {
  //   result = await DatabaseHelper.updateUser(user2.id2!, user2);
  //   if (result != null && result > 0) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('User updated successfully!'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //     // Clear the form fields after adding/updating the user
  //     _bankName.clear();
  //   _bankAddress.clear();
  //   _bankAccountNumber.clear();
  //   _bankIFSCCode.clear();

  //     //_gstnum.clear();
  //     // _quotationumController.clear();
  //     // _quotationDateController.clear();
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Failed to update user.'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Bank Details")),
        body: ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Text(
              'Bank Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
                   SizedBox(height: 16.0),
            TextFormField(
              controller: _bankName,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter the Bank Name',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  icon: Icon(Icons.person)),
              // validator: (value) =>
              //     value!.isEmpty ? 'Please enter bank name' : null,
              // onSaved: (value) =>
              //     _bankName = value! as TextEditingController
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _bankAddress,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter the Address',
                  labelText: 'Bank Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  icon: Icon(Icons.location_city)),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter bank address' : null,
              onSaved: (value) =>
                  _bankAddress = value! as TextEditingController,
           ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _bankAccountNumber,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter Account Number',
                  labelText: 'Bank Account Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  icon: Icon(Icons.account_circle)),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter bank account number' : null,
              keyboardType: TextInputType.number,
              onSaved: (value) =>
                  _bankAccountNumber = value! as TextEditingController,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _bankIFSCCode,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: 'Enter IFSC ',
                  labelText: 'Bank IFSC ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  icon: Icon(Icons.account_circle)),
              // validator: (value) =>
              //     value!.isEmpty ? 'Please enter bank IFSC code' : null,
              // onSaved: (value) =>
              //     _bankIFSCCode = value! as TextEditingController,
            ),
            SizedBox(height: 32.0),
              SizedBox(height: 32.0),
              Row(children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyDashboard()));
                    },
                    icon: Icon(Icons.arrow_back_ios_outlined)),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    
                  onPressed: _handleSubmit,
                    
                  
                  child: Text("Submit"),
                ),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () { 
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DispalyBank()));
                  },
                  child: Text("see data inserted "),
                ),
                
   
   
          ])])
      ]));
  }
}



                


         







  























       

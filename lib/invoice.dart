import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:taxinvoice/DashBoard.dart';

import 'DashBoard.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({Key? key}) : super(key: key);

  @override
  _InvoiceFormState createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {

 String _invoiceNumber = '';
  String _invoiceDate = '';
  void _generateInvoice() {
    print("Generating invoice");
    setState(() {
      _invoiceNumber = _generateInvoiceNumber();
      _invoiceDate = _generateInvoiceDate();

      
    });
  }
  String _generateInvoiceNumber() {
    // Get today's date
    final now = DateTime.now();
     final formatter = DateFormat('yyyyMMdd');
    final formattedDate = formatter.format(now);
     final rand = Random();
    final randomNum = rand.nextInt(9000) + 1000;

    // Combine the date and random number to form the invoice number
    final invoiceNum = '$formattedDate$randomNum';
     return invoiceNum;
  }

    String _generateInvoiceDate() {
    // Get today's date
    final now = DateTime.now();

    // Format date as yyyy-MM-dd
    final formatter = DateFormat('yyyy-MM-dd');
    final formattedDate = formatter.format(now);

    return formattedDate;
  }

    
  


  TextEditingController _companyName = TextEditingController();
  TextEditingController _companyAddress = TextEditingController();
  TextEditingController _companyPhone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _contactphone = TextEditingController();
  TextEditingController _customerName = TextEditingController();
  TextEditingController _customerAddress = TextEditingController();
  TextEditingController _customerPhone = TextEditingController();
  TextEditingController _customeremail = TextEditingController();

  TextEditingController _invoiceNumberController = TextEditingController();
  TextEditingController _invoiceDateController = TextEditingController();

  var _formKey;
   @override
  void initState() {
    super.initState();
    _generateInvoice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                
            decoration: InputDecoration(
              labelText: 'Invoice Number',
            ),
            initialValue: _invoiceNumber,
            readOnly: true,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Invoice Date',
            ),
            initialValue: _invoiceDate,
            readOnly: true,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            child: Text('Generate Invoice'),
            onPressed: _generateInvoice,
          ),
          SizedBox(
            height: 25,
          ),
               Text(
          'Company Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
          controller: _companyName,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              hintText: 'Enter the Comapany Name',
              labelText: 'Name',
              icon: Icon(Icons.person),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10))),
          ),
           SizedBox(height: 16.0),
          TextFormField(
          controller: _companyAddress,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              hintText: 'Enter the company Address',
              labelText: 'Address',
              icon: Icon(Icons.location_city),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10))),
          ),
                  SizedBox(height: 16.0),
          TextFormField(
          controller: _companyPhone,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              hintText: 'Enter the company phone',
              labelText: 'Phone',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              icon: Icon(Icons.phone)),),
               SizedBox(height: 16.0),
          TextFormField(
          controller: _email,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              hintText: 'Enter the company  Email',
              labelText: 'Email',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              icon: Icon(Icons.email)),),
              SizedBox(height: 16.0),
          TextFormField(
          controller: _contactphone,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)),
              hintText: 'Enter the alternate number',
              labelText: 'Additional Conatact number ',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              icon: Icon(Icons.phone_android)),),
              SizedBox(height: 25,),
              Text(
            'Customer Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 16.0),
          
          SizedBox(
            height: 13,
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _customerName,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter the customer Name',
                labelText: 'Name',
                icon: Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            // validator: (value) =>
            //     value!.isEmpty ? 'Please enter customer name' : null,
            // onSaved: (value) =>
            //     _customerName = value! as TextEditingController,
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _customerAddress,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter the customer Address',
                labelText: 'Address',
                icon: Icon(Icons.location_city),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            // validator: (value) =>
            //     value!.isEmpty ? 'Please enter customer name' : null,
            // onSaved: (value) =>
            //     _customerName = value! as TextEditingController,
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _customerPhone,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter the customer phone',
                labelText: 'Phone',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.phone)),),
            // validator: (value) =>
            //     value!.isEmpty ? 'Please enter customer phone number' : null,
            // keyboardType: TextInputType.phone,
            // onSaved: (value) =>
            //     _customerPhone = value! as TextEditingController,
          // ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _customeremail,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter Customer Email',
                labelText: 'Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.phone)),),
          SizedBox(width: 30),
              // SizedBox(height: 16),
              // Text(
              //   'Quotation Number',
              //   style: TextStyle(fontSize: 16),
              // ),
              // TextField(
              //   controller: _quotationNumberController,
              //   decoration: InputDecoration(
              //     hintText: 'Enter quotation number',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // SizedBox(height: 16),
              // Text(
              //   'Quotation Date',
              //   style: TextStyle(fontSize: 16),
              // ),
              // TextField(
              //   controller: _quotationDateController,
              //   decoration: InputDecoration(
              //     hintText: 'Enter quotation date',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              SizedBox(height: 16),
              Center(
                child: Row(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyDashboard()));
                      },
                      icon: Icon(Icons.arrow_back_ios_outlined)),
                  SizedBox(
                    width: 200,
                  ),
                  //   Center(
                  //   child: IconButton(
                  //     // onPressed: () {

                  //     //   if (_formKey.currentState!.validate()) {
                  //     //     _formKey.currentState!.save();

                  //     //     //TODO: Add your code to save form data to database or send data to server

                  //     //   }
                  //     // },
                  //     icon: Icon(Icons.save_alt_outlined),
                  //   ),
                  // ),

                  //IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  
  





import 'package:flutter/material.dart';
import 'package:project/DisplayC.dart';
import 'package:project/customer.dart';
import 'displayQ.dart';

import 'package:table_calendar/table_calendar.dart';
import 'DashBoard.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'modalCompany.dart';

import 'DashBoard.dart';
import 'db_helper.dart';

class CompanyForm extends StatefulWidget {
  //changes
  final Company? user;
  const CompanyForm({Key? key, this.user}) : super(key: key);

  @override
  _QuotationTaxInvoiceFormState createState() =>
      _QuotationTaxInvoiceFormState();
}

class _QuotationTaxInvoiceFormState extends State<CompanyForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _companyName = TextEditingController();
  TextEditingController _companyAddress = TextEditingController();
  TextEditingController _companyPhone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _contactphone = TextEditingController();
  TextEditingController _companyID = TextEditingController();
  // TextEditingController _quotationumController = TextEditingController();
  // TextEditingController _quotationDateController = TextEditingController();

  // ------------------------------------------------------------------------
//TextEditingController _quotationDateController = TextEditingController();
//------------------------------------------------------------------------------
// Define the calendar format, selected date, and focused date

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

//changes
    _companyName = TextEditingController(text: widget.user?.coname ?? '');
    _companyAddress = TextEditingController(text: widget.user?.coadd ?? '');
    _companyPhone = TextEditingController(text: widget.user?.cophone ?? '');
    _email = TextEditingController(text: widget.user?.email ?? '');
    _companyID = TextEditingController(
        text: widget.user?.companyID != null
            ? widget.user!.companyID.toString()
            : '');

    // _quotationumController =TextEditingController(text: widget.user?.qnum ?? '');
    // _quotationDateController =TextEditingController(text: widget.user?.qdate ?? '');
    _contactphone = TextEditingController(text: widget.user?.coname ?? '');

    //-----------------------------------------------------------
    // this._Category.add({"id": 1, "label": "Hardware"});
    // this._Category.add({"id": 2, "label": "Software"});
    //---------------------------------------------------------------
  }

//changes---
  @override
  void dispose() {
    _companyName.dispose();
    _companyAddress.dispose();
    _companyPhone.dispose();
    _email.dispose();
    _companyID.dispose();
    // _gstnum.dispose();
    // _quotationumController.dispose();
    // _quotationDateController.dispose();
    _contactphone.dispose();

    super.dispose();
  }

  void _handleSubmit() async {
    final user = Company(
      id: widget.user?.id, // use the id of the user being edited, if provided
      coname: _companyName.text,
      coadd: _companyAddress.text,
      cophone: _companyPhone.text,
      email: _email.text,
      companyID: int.tryParse(_companyID.text) ?? 0,
      contactphone: _contactphone.text,

      //gstnum: _gstnum.text,
      // qnum: _quotationumController.text,
      // qdate: _quotationDateController.text,
    );
    bool shouldProceed = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(widget.user == null
                  ? 'Add User'
                  : 'Update User ${widget.user!.coname}?'),
              content: Text(widget.user == null
                  ? 'Are you sure you want to add this user?'
                  : 'Are you sure you want to update ${widget.user!.coname}?'),
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
      if (widget.user == null) {
        result = await DatabaseHelper.addUser(user);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User added successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          _companyName.clear();
          _companyAddress.clear();
          _companyPhone.clear();
          _email.clear();
          _companyID.clear();
          _contactphone.clear();

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
      } else {
        result = await DatabaseHelper.updateUser(user.id!, user);
        if (result != null && result > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User updated successfully!'),
              duration: Duration(seconds: 2),
            ),
          );
          // Clear the form fields after adding/updating the user
          _companyName.clear();
          _companyAddress.clear();
          _companyPhone.clear();
          _email.clear();
          _companyID.clear();
          _contactphone.clear();

          //_gstnum.clear();
          // _quotationumController.clear();
          // _quotationDateController.clear();
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

  // } else {
  //   result = await DatabaseHelper.updateUser(user.id!, user);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comapany Form'),
      ),
      body: ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            // onTap: () async {
            //   print("Tapped");

            //   final query = 'SELECT * FROM users';
            //   final result = await DatabaseHelper.rawQuery(query
            //   //  [
            //   //   _companyName.text,
            //   //   _companyAddress.text,
            //   //   _companyPhone.text,
            //   //   _email.text,
            //   //   _contactphone.text
            //   // ]
            //   );
             // print(result);
             // Text(result);
            //   if (result.isNotEmpty) {
            //     setState(() {
            //       for (var row in result) {
            //         var companyName = row['coname'];
            //          var companyAddress = row['coadd'];
            //          var companyPhone = row['cophone'];
            //          var email = row['coemail'];
            //         var companyID= row['companyID'];
            //         var contactphone = row['contactphone'];
            //       }
            //     });
            //   } else {
            //     setState(() {
            //       _companyID.text = '';
            //     });
            //   }
            // },
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter the Name',
                labelText: 'Name',
                icon: Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            //-------------------------------------------------------------------------------------------------
            // validator: (value) =>
            //     value!.isEmpty ? 'Please enter companyname' : null,
            // onSaved: (value) =>
            //     _companyName = value! as TextEditingController,
            //--------------------------------------------------------------------------------------------------------
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _companyAddress,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter the Address',
                labelText: 'Address',
                icon: Icon(Icons.location_city),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            // validator: (value) =>
            //     value!.isEmpty ? 'Please enter company name' : null,
            // onSaved: (value) =>
            //     _companyAddress = value! as TextEditingController,
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _companyPhone,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter the phone',
                labelText: 'Phone',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.phone)),
            // validator: (value) => value!.isEmpty
            //     ? 'Please enter company phone number'
            //     : null,
            // keyboardType: TextInputType.phone,
            // onSaved: (value) =>
            //     _companyPhone = value! as TextEditingController,
          ),

          SizedBox(height: 16.0),
          TextFormField(
            controller: _email,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter the Email',
                labelText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.email)),
            // validator: (value) => value!.isEmpty
            //     ? 'Please enter company phone number'
            //     : null,
            // keyboardType: TextInputType.phone,
            // onSaved: (value) =>
            //     _companyPhone = value! as TextEditingController,
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _companyID,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter the Company ID',
                labelText: 'ID',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.numbers)),
            // validator: (value) => value!.isEmpty
            //     ? 'Please enter company phone number'
            //     : null,
            // keyboardType: TextInputType.phone,
            // onSaved: (value) =>
            //     _companyPhone = value! as TextEditingController,
          ),

          SizedBox(height: 16.0),
          TextFormField(
            controller: _contactphone,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)),
                hintText: 'Enter the alternate number',
                labelText: 'Additional Contact number ',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                icon: Icon(Icons.phone_android)),
            // validator: (value) => value!.isEmpty
            //     ? 'Please enter company phone number'
            //     : null,
            // keyboardType: TextInputType.phone,
            // onSaved: (value) =>
            //     _companyPhone = value! as TextEditingController,
          ),

          // SizedBox(height: 16.0),
          // TextFormField(
          //   controller: _gstnum,
          //   decoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           borderSide: BorderSide(color: Colors.black)),
          //       hintText: 'Enter the GST number',
          //       labelText: 'GSTIN',
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10)),
          //       icon: Icon(Icons.numbers)),
          //   // validator: (value) => value!.isEmpty
          //   //     ? 'Please enter company phone number'
          //   //     : null,
          //   // keyboardType: TextInputType.phone,
          //   // onSaved: (value) =>
          //   //     _companyPhone = value! as TextEditingController,
          // ),

//               SizedBox(height: 16),
//                 TextFormField(
//                   controller: _quotationumController,
//                   decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide(color: Colors.black)),
//                       hintText: 'Enter the Quotation Number',
//                       labelText: 'Quotation Number',
//                       icon: Icon(Icons.receipt_long_rounded),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   validator: (value) =>
//                       value!.isEmpty ? 'Please enter Quotation Number' : null,
//                   onSaved: (value) =>
//                       _quotationumController= value as TextEditingController,
//                 ),
//                 SizedBox(height: 16),
//                 GestureDetector(
//   onTap: () async {
//     final DateTime? selectedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2021),
//       lastDate: DateTime(2025),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             primaryColor: Colors.blue,
//             accentColor: Colors.blue,
//             colorScheme: ColorScheme.light(primary: Colors.blue),
//             buttonTheme: ButtonThemeData(
//               textTheme: ButtonTextTheme.primary,
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (selectedDate != null) {
//       _quotationDateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
//       setState(() {
//         _selectedDate = selectedDate;
//         _focusedDate = selectedDate;
//       });
//     }
//   },
//   child: AbsorbPointer(
//     child: TextFormField(
//       controller: _quotationDateController,
//       decoration: InputDecoration(
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.black),
//         ),
//         hintText: 'Enter the Quotation Date',
//         labelText: 'Quotation Date',
//         icon: Icon(Icons.calendar_today_rounded),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       validator: (value) => value!.isEmpty ? 'Please enter Quotation Date' : null,
//     ),
//   ),
// ),

          SizedBox(height: 32.0),
          SizedBox(height: 32.0),
          Row(children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyDashboard()));
                },
                icon: Icon(Icons.arrow_back_ios_outlined)),
            SizedBox(
              width: 30,
            ),
            //TextButton(
            //onPressed: () {
            //if (_formKey.currentState!.validate()) {
            // _formKey.currentState!.save();

            //TODO: Add your code to save form data to database or send data to server
            //changes--------------------------
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text('Form data saved successfully.'),
            //   ),
            // );
            //--------------------------------------------
            //}
            //},
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
                    MaterialPageRoute(builder: (context) => Displaydatabase()));
              },
              child: Text("see data inserted "),
            ),
          ]),

          //changes-------------------------------

          //changes-----------------------------
        ]),

        //IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))
      ]),
    );
  }
}

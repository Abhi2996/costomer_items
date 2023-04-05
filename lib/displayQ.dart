import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'company.dart';
import 'modalCompany.dart';

class Displaydatabase extends StatefulWidget {
  const Displaydatabase({super.key});

  @override
  State<Displaydatabase> createState() => _DisplaydatabaseState();
}

class _DisplaydatabaseState extends State<Displaydatabase> {
List<Company> _company = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final users = await DatabaseHelper.getUsers();
    setState(() {
      _company = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: ListView.builder(
          itemCount: _company.length,
          itemBuilder: (context, index) {
            final user = _company[index];
            return ListTile(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyForm(user: user),
                  ),
                );
                if (result != null) {
                  final updatedUser = result['user'] as Company;
                  final userId = result['id'] as int;
                  await DatabaseHelper.updateUser(userId, updatedUser);
                  await _fetchUsers();
                }
              },
              // title: Text(user.coname),
              // subtitle: Text('${user.coadd}/n, ${user.cophone}/n,${user.qnum}/n,${user.qdate}/n,${user.gstnum}/n'),
              title: Card(
                color: Color.fromARGB(255, 236, 192, 206),
                child: Column(
                children: [
                  SizedBox(height: 30,),
                
                  Column(
                    children: [
                      Text('Company Name:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                    ]),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Text('${user.coname}',style:TextStyle(fontSize: 20)),
                        ],
                      ),
                    
                  
                
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Company Address:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                    ]),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Text('${user.coadd}',style:TextStyle(fontSize: 20)),
                        ],
                      ),
                   
                  
                
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Company Phone:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                    ]),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Text('${user.cophone}',style:TextStyle(fontSize: 20),),
                        ],
                      ),
                    
                  
                
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Comapny Email:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),]),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Text('${user.email}',style:TextStyle(fontSize: 20)),
                        ],
                      ),
                    
                  
                  
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Additional Contact Phone:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                    ]),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Text('${user.contactphone}',style:TextStyle(fontSize: 20)),
                        ],
                      ),
                    
                  
                
                  // SizedBox(height: 30),
                
                  // Column(
                  //   children: [
                  //     Text('Quotation Date:',style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  // fontSize: 20.0,
                  // color: Colors.black,),),
                  //     SizedBox(width: 20),
                  //     Text('${user.qdate}',style:TextStyle(fontSize: 20)),
                  //   ],
                  // ),
                
                  SizedBox(height: 50),
                
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
                    await DatabaseHelper.deleteUser(user.id!);
                    await _fetchUsers();
                  }
                },
              ));

             
   } ));
          }
        
  }


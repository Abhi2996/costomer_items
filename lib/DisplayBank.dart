import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'db_helper.dart';
import 'modalTransaction.dart';
import 'transaction details.dart';


class DispalyBank extends StatefulWidget {
  const DispalyBank({super.key});

  @override
  State<DispalyBank> createState() => _DispalyBankState();
}

class _DispalyBankState extends State<DispalyBank> {
    List<Transactions> _bank = [];

    @override
  void initState() {
    super.initState();
    _fetchBdetails();
  }
   Future<void> _fetchBdetails() async {
    final bdetails= await DatabaseHelper.getDetails();
    setState(() {
      _bank = bdetails;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
          title: Text('Users'),
        ),
        body: ListView.builder(
          itemCount: _bank.length,
          itemBuilder: (context, index) {
            final user2 = _bank[index];
            return ListTile(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionDetailForm(transactions: user2),
                  ),
                );
                // if (result != null) {
                //   final updatedUser = result['user2'] as Transactions;
                //   final userId = result['id2'] as int;
                //   await DatabaseHelper.updateUser(userId, updatedUser);
                //   await _fetchBdetails();
                // }
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
                      Text('Bank Name:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 10),
             
                     Text('${user2.bname}',style:const TextStyle(fontSize: 20)),
                    ],
                  ),
                
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Bank Address:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                
                      SizedBox(width: 20),
                      Text('${user2.badd}',style:TextStyle(fontSize: 20)),
                   ],
                  ),
                
                  SizedBox(height: 30),
                
                  Column(
                    children: [
                      Text('Bank Acc number:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user2.bacc}',style:TextStyle(fontSize: 20),),
                    ],
                  ),
                
                  SizedBox(height: 30),
                
                Column(
                    children: [
                      Text('IFSC:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,),),
                      SizedBox(width: 20),
                      Text('${user2.bifsc}',style:TextStyle(fontSize: 20),),
                    ],
                  ),
                 
                
                  SizedBox(height: 50),
                
                  // add other desired attributes here
                 ] ),
              ),
  

                
            );})
    );
  }
}
import 'dart:async';
import 'package:project/modalInvoice.dart';
import 'package:project/modalItem.dart';
import 'package:sqflite/sqlite_api.dart';

import 'customer.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:project/modalCustomer.dart';
import 'modalCompany.dart';
import 'company.dart';
import 'package:project/modalTransaction.dart';
import 'modalInvoice.dart';

class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(""" 
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
          
        coname TEXT,
        coadd TEXT,
        cophone TEXT,
        email TEXT,
        companyID INTEGER,
        contactphone TEXT
        )
    """);
    //CUSTOMER TABLE---------------------------------------------------

    await database.execute(""" 
      CREATE TABLE customers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,  
        customerId INTEGER,
        cuname TEXT,
        cuadd TEXT,
        cuphone TEXT,
        cuemail TEXT,
        itemID TEXT,
        itemName TEXT,
        quantity INTEGER
      
        amt REAL
        )
    """);
    //Transaction table----------------------------------------------------------
    await database.execute("""
      CREATE TABLE bankdetails(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bname TEXT,
        badd TEXT,
        bacc TEXT,
        bifsc TEXT
      )
    """);

    await database.execute(""" 
      CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        itemid TEXT, 
        iname TEXT,
        quantity INTEGER,
        price REAL,
        custname TEXT,
        custID TEXT
        )
    """);

    
  }

  static Future<sql.Database> db() async {
    // database creation ....
    return sql.openDatabase(
      'tax.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        //var result =await database.query('users',orderBy: '$coname ASC');
        await createTables(database);
      },
    );
  }

  static Future<int> addUser(Company company) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('users', company.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Company>> getUsers() async {
    //fetching data to display details.....
    final dbClient = await db();

    final List<Map<String, dynamic>> maps = await dbClient.query('users');

    return List.generate(maps.length, (i) {
      return Company(
        id: maps[i]['id'],

        coname: maps[i]['coname'],
        coadd: maps[i]['coadd'],
        cophone: maps[i]['cophone'],
        email: maps[i]['email'],
        companyID: maps[i]['companyID'],
        contactphone: maps[i]['contactphone'],

        // gstnum: maps[i]['gstnum'],
        // qnum: maps[i]['qnum'],
        // qdate: maps[i]['qdate'],
      );
    });
  }

  static Future<int> updateUser(int id, Company company) async {
    final dbClient = await db();
    return dbClient.update(
      'users',
      company.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> deleteUser(int id) async {
    final dbClient = await db();
    return await dbClient.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
// static Future<List<Map<String, dynamic>>> rawQuery(String query, List<String> list) async {
//   final dbClient = await db();
//   print(db());

//   return dbClient.rawQuery(query,list);
// }

  static Future<List<Map<String, dynamic>>> rawQuery(String query) async {
    final dbClient = await db();

    print(db());

    return dbClient.rawQuery(query);
  }

//Customer details......................................................

  static Future<int> addCustomer(Customer customer) async {
    final dbClient = await db();
    return dbClient.insert('customers', customer.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Customer>> getCustomers() async {
    final dbClient = await db();
    final List<Map<String, dynamic>> maps = await dbClient.query('customers');

    return List.generate(maps.length, (i) {
      return Customer(
        id1: maps[i]['id'],
        customerId: maps[i]['customerId'],
        cuname: maps[i]['cuname'],
        cuadd: maps[i]['cuadd'],
        cuphone: maps[i]['cuphone'],
        cuemail: maps[i]['cuemail'],
        itemID: maps[i]['itemID'],
        itemName: maps[i]['itemName'],
        quantity: maps[i]['quantity'],
        amt: maps[i]['amt'],
      );
    });
  }

  static Future<int> updateCustomer(int id1, Customer customer) async {
    final dbClient = await db();
    return dbClient.update(
      'customers',
      customer.toMap(),
      where: 'id = ?',
      whereArgs: [id1],
    );
  }

  static Future<int> deleteCustomer(int id1) async {
    final dbClient = await db();
    return await dbClient.delete(
      'customers',
      where: 'id = ?',
      whereArgs: [id1],
    );
  }

//Transaction database operations------------------------------------

  static Future<int> addTransaction(Transactions transaction) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('bankdetails', transaction.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Transactions>> getDetails() async {
    //fetching data to display details.....
    final dbClient = await db();
    final List<Map<String, dynamic>> maps =
        await dbClient.query('bankdetails');

    return List.generate(maps.length, (i) {
      return Transactions(
        id2: maps[i]['id'],
        bname: maps[i]['bname'],
        badd: maps[i]['badd'],
        bacc: maps[i]['bacc'],
        bifsc: maps[i]['bifsc'],
      );
    });
  }
//-----------------------------Items details-----------------------------
static Future<int> addItem(Item item) async {
    // insert data to table
    final dbClient = await db();
    return dbClient.insert('items', item.toMap(),
        conflictAlgorithm:
            sql.ConflictAlgorithm.replace); // add conflictAlgorithm
  }

  static Future<List<Item>> getItems() async {
    //fetching data to display details.....
    final dbClient = await db();

    final List<Map<String, dynamic>> maps = await dbClient.query('items');

    return List.generate(maps.length, (i) {
      return Item(
        id3: maps[i]['id'],
        itemid: maps[i]['itemid'],

        iname: maps[i]['iname'],
        quantity: maps[i]['quantity'],
        price: maps[i]['price'],
        custname: maps[i]['custname'],
        custID: maps[i]['custID'],
        

        // gstnum: maps[i]['gstnum'],
        // qnum: maps[i]['qnum'],
        // qdate: maps[i]['qdate'],
      );
    });
  }

  static Future<int> updateItem(int id3, Item item) async {
    final dbClient = await db();
    return dbClient.update(
      'items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [id3],
    );
  }

  static Future<int> deleteItems(int id3) async {
    final dbClient = await db();
    return await dbClient.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id3],
    );
  }
}

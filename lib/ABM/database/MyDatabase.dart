import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:project/ABM/Models/Costomer.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
  static final MyDataBase _myDataBase = MyDataBase._privateConstructor();
  MyDataBase._privateConstructor();

  static late Database _database;
  factory MyDataBase() => _myDataBase;

  static String tableName = 'costomer_info';
  static final String columnId = 'costomer_id';
  final String columnCName = 'Cname';
  final String columnMobileNo = 'mobileno';
  final String columnEmailId = 'email';
  final String columnBillReports = 'itemslist';

  //

  final String billReportTable = 'items_table';
  final String billReportColumnId = 'id';
  final String billReportColumname = 'iname';
  final String billReportColumnqty = 'qty';
  final String billReportColumnprice = 'price';

  static final String billReportColumncostomer_id = 'costomer_id';
  final String billReportForeignKey =
      'FOREIGN KEY ($billReportColumncostomer_id) REFERENCES $tableName ($columnId) ON DELETE CASCADE';

  Future<void> initializedDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/flat_owner_info.db';
    _database = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT,'
          '$columnCName TEXT,'
          ' $columnMobileNo TEXT,'
          '$columnEmailId TEXT, $columnBillReports TEXT)');

      db.execute('CREATE TABLE $billReportTable ('
          /* '$billReportColumnId INTEGER PRIMARY KEY,'*/
          '$billReportColumnId INTEGER PRIMARY KEY AUTOINCREMENT,'
          '$billReportColumname REAL,'
          '$billReportColumnqty INTEGER,'
          '$billReportColumnprice REAL,'
          '$billReportColumncostomer_id INTEGER,'
          '$billReportForeignKey'
          ')');
    });
  }

/*Future<void> initializedDatabase() async {
  Directory directory = await getApplicationDocumentsDirectory();
  String path = '${directory.path}/flat_owner_info.db';
  _database = await openDatabase(path, version: 1, onCreate: (db, version) {
    db.execute('CREATE TABLE $tableName ($coloumId INTEGER PRIMARY KEY,'
        '$coloumName TEXT, $coloumDoorNo INTEGER, $coloumMobileNo TEXT,'
        '$coloumEmailId TEXT)');
    db.execute('CREATE TABLE bill_report ('
        'id INTEGER PRIMARY KEY,'
        'rentalBill REAL,'
        'otherBill REAL,'
        'totalBill REAL,'
        'flat_id INTEGER,'
        'FOREIGN KEY (flat_id) REFERENCES $tableName ($coloumId)'
        ' ON DELETE CASCADE'
        ')');
  });
}
*/

  Future<List<Map<String, Object?>>> getFlatOwnerlist() async {
    List<Map<String, Object?>> result =
        await _database.query(tableName, orderBy: columnCName);
    return result;
  }

  Future<int> insertFlatOwnerlist(COSTOMER costomer) async {
    int rowsInserted = await _database.insert(tableName, costomer.toMap());
    return rowsInserted;
  }

  Future<int> updateFlatOwnerlist(COSTOMER tenant) async {
    int rowsUpdate = await _database.update(tableName, tenant.toMap(),
        where: '$columnId=?', whereArgs: [tenant.costomer_id]);
    return rowsUpdate;
  }

  Future<int> deleteFlatOwnerlist(COSTOMER tenant) async {
    int rowsdeleted = await _database.delete(tableName,
        where: '$columnId=?', whereArgs: [tenant.costomer_id]);
    return rowsdeleted;
  }

  Future<int> countFlatOwnerlist() async {
    List<Map<String, Object?>> result =
        await _database.rawQuery('SELECT COUNT(*) FROM $tableName');
    int count = Sqflite.firstIntValue(result) ?? 0;
    return count;
  }

  Future<List<Map<String, Object?>>> searchFlatOwnerlist(
      String costomer_id) async {
    List<Map<String, Object?>> result = await _database.query(tableName,
        where: '$columnId LIKE ?', whereArgs: ['%$costomer_id%']);
    return result;
  }

///////BILL REPORTS------------------

  Future<List<Map<String, Object?>>> getBillByFlat_nolist(
      String costomer_id) async {
    List<Map<String, Object?>> result = await _database.query(billReportTable,
        where: '$billReportColumncostomer_id LIKE ?',
        whereArgs: ['%$costomer_id%']);
    return result;
  }

  Future<List<Map<String, Object?>>> getBillreportlist() async {
    List<Map<String, Object?>> result =
        await _database.query(billReportTable, orderBy: billReportColumnId);
    return result;
  }

  Future<List<Map<String, dynamic>>> query(String table,
      {required String where, required List<int> whereArgs}) async {
    final Database db = await _database;
    return await db.query(table);
  }

//
  Future<int> insertReportlist(Items items) async {
    int rowsInserted = await _database.insert(billReportTable, items.RtoMap());
    return rowsInserted;
  }

  Future<void> insertBillReport(int id, String iname, int qty, double price,
      int costomer_id, Set<int> set) async {
    final db = await _database;
    await db.insert('items_table', {
      'iname': iname,
      'qty': qty,
      'price': price,
      'costomer_id': costomer_id,
    });
  }

  Future<void> updateBillReport(
    int id,
    String iname,
    int qty,
    double price,
    int costomer_id,
  ) async {
    final db = await _database;
    await db.update(
        'items_table',
        {
          'iname': iname,
          'qty': qty,
          'price': price,
          'costomer_id': costomer_id
        },
        where: 'id = ?',
        whereArgs: [id]);
  }
}






/*

import 'dart:io';

import 'package:flat_management_two/Models/tenant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
  static final MyDataBase _myDataBase = MyDataBase._privateConstructor();
  //provide constroctor
  MyDataBase._privateConstructor();
//database
  static late Database _database;
  factory MyDataBase() {
    return _myDataBase;
  }
  //variables
  final String tableName = 'flat_owner_info';
  final String coloumId = 'flat_id';
  final String coloumName = 'name';
  final String coloumDoorNo = "door_no";
  final String coloumMobileNo = "mobileno";
  final String coloumEmailId = "email";
  //
  //init database
  initializedDatabase() async {
    //Get path where to store database

    Directory directory = await getApplicationDocumentsDirectory();
    //path
    String path = '${directory.path}flat_owner_info.db';
    //create database
    _database = await openDatabase(path, version: 1, onCreate: (db, version) {
      //
      db.execute(
          'CREATE TABLE $tableName ($coloumId INTEGER PRIMARY KEY, $coloumName TEXT, $coloumDoorNo INTEGER, $coloumMobileNo TEXT,$coloumEmailId TEXT)');
      //
    });
  }

//CRUD
//READ
  Future<List<Map<String, Object?>>> getFlatOwnerlist() async {
    //
    //List<Map<String,Object?>> result=await _database.rawQuery('SELECT * FROM $tableName');
    List<Map<String, Object?>> result =
        await _database.query(tableName, orderBy: coloumName);
    return result;

    //
  }

  //Insert
  Future<int> insertFlatOwnerlist(Tenant tenant) async {
    //

    int rowsInserted = await _database.insert(tableName, tenant.toMap());
    return rowsInserted;

    //
  }

//Update/edit
  Future<int> UpdateFlatOwnerlist(Tenant flat_member) async {
    //

    int rowsUpdate = await _database.update(tableName, flat_member.toMap(),
        where: '$coloumId=?', whereArgs: [flat_member.flat_no]);
    return rowsUpdate;

    //
  }

  //Delete
  Future<int> deleteFlatOwnerlist(Tenant tenant) async {
    //

    int rowsdeleted = await _database
        .delete(tableName, where: '$coloumId=?', whereArgs: [tenant.flat_no]);
    return rowsdeleted;

    //
  }

  //Count
  Future<int> countFlatOwnerlist() async {
    //

    List<Map<String, Object?>> result =
        await _database.rawQuery('SELECT COUNT(*) FROM $tableName');
    int count = Sqflite.firstIntValue(result) ?? 0;
    return count;

    //
  }

  ///
  ///text search
  Future<List<Map<String, Object?>>> searchFlatOwnerlist(String flatNo) async {
    List<Map<String, Object?>> result = await _database
        .query(tableName, where: '$coloumId LIKE ?', whereArgs: ['%$flatNo%']);
    return result;
  }

  /////
}
*/
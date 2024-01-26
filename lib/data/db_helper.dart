import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:pet_shop/data/models/cart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _database;

  static const String idCart = 'idCart';
  static const String email = 'email';
  static const String petId = 'petId';
  static const String petName = 'petName';
  static const String petPrice = 'petPrice';
  static const String quantity = 'quantity';
  static const String petImage = 'petImage';
  static const String tableName = 'tblCart';
  static const String dbName = 'cart.db';

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDatabase();
      return _database;
    }
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

// creating database table
  // _onCreate(Database db, int version) async {
  //   await db.execute(
  //       'CREATE TABLE cart(id INTEGER PRIMARY KEY, productId VARCHAR UNIQUE, productName TEXT, initialPrice INTEGER, productPrice INTEGER, quantity INTEGER, unitTag TEXT, image TEXT)');
  // }

  _onCreate(Database db, int version) async {
    //tạo database
    await db.execute("CREATE TABLE $tableName "
        "($idCart INTEGER PRIMARY KEY AUTOINCREMENT, "
        "$email TEXT NOT NULL, "
        "$petId NUMBER NOT NULL, "
        "$quantity NUMBER NOT NULL, "
        "$petImage TEXT NOT NULL, "
        "$petName TEXT NOT NULL, "
        "$petPrice NUMBER NOT NULL"
        ")");
  }

// inserting data into the table
  Future<Cart> insert(Cart cart) async {
    var dbClient = await database;
    await dbClient!.insert(tableName, cart.toMap());
    return cart;
  }

// getting all the items in the list from the database
  Future<List<Cart>> getDataCart(String emailUser) async {
    var dbClient = await database;
    //List<Map> maps = await dbClient?.query(TABLE, columns: [ID, NAME]);
    List<Map<String, dynamic>>? maps =
        await dbClient?.rawQuery("SELECT * FROM $tableName "
            "WHERE $email = \"$emailUser\"");
    List<Cart> myCart = [];
    if (maps!.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        myCart.add(Cart.fromMap(maps[i]));
      }
    }
    for (Cart cart in myCart) {
      debugPrint('my cart ${cart.petId}');
    }
    return myCart;
  }

  Future<Cart> save(Cart myCart) async {
    // int? result = 0;
    var dbClient = await database;
    await dbClient?.insert(tableName, myCart.toMap());
    return myCart;
  }

//   Future<int> updateQuantity(Cart cart) async {
//     var dbClient = await database;
//     return await dbClient!.update('cart', cart.quantityMap(),
//         where: "productId = ?", whereArgs: [cart.productId]);
//   }

// deleting an item from the cart screen
  Future<int> deleteCartItem({
    required String emailUser,
    required int petIdDelete,
  }) async {
    var dbClient = await database;

    getDataCart(email);

    return await dbClient!.delete(tableName,
        where: "$email = \"$emailUser\" AND $petId = $petIdDelete");
  }

  Future<bool> checkPetInCart(String emailUser, int petIdCheck) async {
    var dbClient = await database;
    //List<Map> maps = await dbClient?.query(TABLE, columns: [ID, NAME]);
    List<Map<String, dynamic>>? maps =
        await dbClient?.rawQuery("SELECT * FROM $tableName "
            "WHERE $email = \"$emailUser\" AND $petId = $petIdCheck");
    if (maps!.isNotEmpty) {
      return true;
    }
    return false;
  }
}

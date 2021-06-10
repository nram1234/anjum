import 'dart:io';

import 'package:anjum/DB/tabelname/insert_visit_DB.dart';
import 'package:anjum/DB/tabelname/sales_order_cart_promotions.dart';
import 'package:anjum/DB/tabelname/sales_order_invoice_request_stock_items.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

import 'myModel.dart';

import 'tabelname/insert_cheque_tabel.dart';
import 'tabelname/insert_journeys_DB.dart';
import 'tabelname/item_tabel.dart';
import 'tabelname/make_older.dart';
import 'tabelname/sales_order_request_details.dart';
import 'tabelname/sales_order_requests.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      return _db = await initDb();
    }
  }

  initDb() async {
    Directory directionality = await getApplicationDocumentsDirectory();
    String path = join(directionality.path, "anjum.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''

CREATE TABLE  $sales_order_request_details_tabelname  (
   $sales_order_request_details_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
   $sales_order_request_details_user_id INTEGER   NOT NULL,
   $sales_order_request_details_sales_order_request_id INTEGER   NOT NULL,
   $sales_order_request_details_employee_id  INTEGER  NOT NULL,
   $sales_order_request_details_store_id  INTEGER  NOT NULL,
   $sales_order_request_details_item_id  INTEGER  NOT NULL,
   $sales_order_request_details_category_id  INTEGER  NOT NULL,
   $sales_order_request_details_measurement_unit_id INTEGER  NOT NULL,
   $sales_order_request_details_base_price_per_unit REAL  NOT NULL  ,
   $sales_order_request_details_bonus  INTEGER   ,
   $sales_order_request_details_quantity INTEGER   ,
   $sales_order_request_details_total_price  REAL  ,
   $sales_order_request_details_total_tax  REAL  ,
   $sales_order_request_details_total_price_before_tax  REAL   ,
   $sales_order_request_details_total_price_with_tax REAL   ,
  $sales_order_request_details_request_status TEXT  NOT NULL ,
     $sales_order_request_details_tax_type  TEXT  NOT NULL  ,
   $sales_order_request_details_created_at TEXT   NOT NULL  ,
   $sales_order_request_details_updated_at  TEXT  NOT NULL    ,
   $sales_order_request_details_Item_Discount  REAL
)
      ''');
//
        await db.execute('''

CREATE TABLE  $sales_order_requests_tabelname  (
   $sales_order_requests_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL  ,
  $sales_order_requests_user_id INTEGER  ,
  $sales_order_requests_request_level INTEGER,
 $sales_order_requests_request_type TEXT,
 $sales_order_requests_employee_id INTEGER NOT NULL,
  $sales_order_requests_customer_id INTEGER NOT NULL,
  $sales_order_requests_store_id  INTEGER ,
  $sales_order_requests_supervisor_id  INTEGER NOT NULL,
  $sales_order_requests_salesmanager_id  INTEGER  ,
  $sales_order_requests_no_of_items  TEXT,
  $sales_order_requests_supervisor_note TEXT,
  $sales_order_requests_salesmanager_note  TEXT,
  $sales_order_requests_total_price_without_tax_discount  REAL,
  $sales_order_requests_total_tax  REAL,
  $sales_order_requests_total_discount  REAL,
  $sales_order_requests_total_price REAL,
  $sales_order_requests_request_status  TEXT,
  $sales_order_requests_salesmanager_status  TEXT,
  $sales_order_requests_supervisor_status  TEXT,
  $sales_order_requests_is_successfully_submitted  INTEGER,
  $sales_order_requests_created_at  INTEGER,
  $sales_order_requests_updated_at INTEGER
)
      ''');

        await db.execute('''

CREATE TABLE  $sales_order_invoice_request_stock_items_tabelname  (
    $sales_order_invoice_request_stock_items_id  INTEGER PRIMARY KEY AUTOINCREMENT  ,
   $sales_order_invoice_request_stock_items_sales_order_request_id  INTEGER  ,
   $sales_order_invoice_request_stock_items_user_id  INTEGER  ,
   $sales_order_invoice_request_stock_items_store_id  INTEGER,
   $sales_order_invoice_request_stock_items_item_id  INTEGER,
   $sales_order_invoice_request_stock_items_measurement_unit_id INTEGER,
   $sales_order_invoice_request_stock_items_quantity  TEXT  ,
   $sales_order_invoice_request_stock_items_created_at INTEGER,
   $sales_order_invoice_request_stock_items_updated_at INTEGER
)
      ''');

        await db.execute('''

CREATE TABLE  $sales_order_cart_promotions_tabelname (
    $sales_order_cart_promotions_id  INTEGER PRIMARY KEY AUTOINCREMENT  ,
  $sales_order_cart_promotions_sales_order_cart_id  INTEGER  ,
  $sales_order_cart_promotions_discount_type  TEXT,
  $sales_order_cart_promotions_discount_percentage  REAL  ,
  $sales_order_cart_promotions_discount_amount  REAL ,
  $sales_order_cart_promotions_promotion_id  INTEGER  ,
  $sales_order_cart_promotions_promotion_type  TEXT,
  $sales_order_cart_promotions_promotion_bonus_item_id  INTEGER,
  $sales_order_cart_promotions_promotion_bonus_quantity  INTEGER  ,
  $sales_order_cart_promotions_created_at  INTEGER NOT NULL ,
  $sales_order_cart_promotions_updated_at  INTEGER
);
      ''');
//
//         await db.execute('''
// CREATE TABLE  $make_older_tabelname (
//     $make_older_id  INTEGER PRIMARY KEY AUTOINCREMENT ,
//     $make_older_user_id  INTEGER ,
//     $make_older_request_level  INTEGER ,
//     $make_older_requestType  TEXT ,
//     $make_older_employeeId  INTEGER ,
//     $make_older_customerId  INTEGER ,
//     $make_older_storeId  INTEGER ,
//     $make_older_supervisorId  INTEGER ,
//     $make_older_salesmanagerId  INTEGER ,
//     $make_older_noOfItems  INTEGER ,
//     $make_older_supervisorNote  TEXT ,
//     $make_older_salesmanagerNote  TEXT ,
//     $make_older_totalPriceWithoutTaxDiscount  TEXT ,
//     $make_older_totalTax  REAL ,
//     $make_older_totalDiscount  INTEGER ,
//     $make_older_totalPrice  INTEGER ,
//     $make_older_requestStatus  TEXT
//
// )
// ''');
//
//         await db.execute('''
//
// CREATE TABLE  $item_tabelname (
//     $item_older_id  INTEGER ,
//   $item_itemId  INTEGER ,
//   $item_categoryId   INTEGER ,
//   $item_measurementUnitId  INTEGER ,
//   $item_basePricePerUnit  REAL ,
//   $item_bonus  REAL ,
//   $item_quantity  REAL ,
//   $item_taxType  TEXT ,
//   $item_totalTax  REAL ,
//   $item_totalPriceBeforeTax  REAL ,
//   $item_totalPriceWithTax  REAL ,
//   $item_totalPrice  REAL
// )
//       ''');
        await db.execute('''

CREATE TABLE  $insert_cheque_tabelname (
    $insert_cheque_Column_user_id  INTEGER ,
  $insert_cheque_Column_employee_id  INTEGER ,
  $insert_cheque_Column_customer_id   INTEGER ,
  $insert_cheque_Column_supervisor_id  INTEGER ,
  $insert_cheque_Column_salesmanager_id  INTEGER ,
  $insert_cheque_Column_payment_type  TEXT ,
  $insert_cheque_Column_amount  REAL ,
  $insert_cheque_Column_customer_name  TEXT ,
  $insert_cheque_Column_salesman_name  TEXT ,
  $insert_cheque_Column_payment_date  TEXT ,
  $insert_cheque_Column_payment_no  REAL ,
  $insert_cheque_Column_reference_no  TEXT,
  $insert_cheque_Column_bank_id  INTEGER ,
  $insert_cheque_Column_branch_id  INTEGER ,
  $insert_cheque_Column_drawer_name  TEXT ,
  $insert_cheque_Column_cheque_no  REAL,
    $insert_cheque_Column_due_date  TEXT ,
  $insert_cheque_Column_note  TEXT 
)
      ''');

        await db.execute('''

CREATE TABLE  $insert_visit_DB_tabelname (
    $insert_visit_DB_Column_user_id  TEXT ,
  $insert_visit_DB_Column_employee_id  TEXT ,
  $insert_visit_DB_Column_customer_id   TEXT ,
  $insert_visit_DB_Column_start_lat  TEXT ,
  $insert_visit_DB_Column_start_lang  TEXT ,
  $insert_visit_DB_Column_end_lat  TEXT ,
  $insert_visit_DB_Column_end_lang  TEXT ,
  $insert_visit_DB_Column_start_date  TEXT ,
  $insert_visit_DB_Column_end_date  TEXT ,
  $insert_visit_DB_Column_current_visit_status  TEXT ,
  $insert_visit_DB_Column_visit_type  TEXT 
)
      ''');
        await db.execute('''

CREATE TABLE  $insert_journeys_DB_tabelname (
    $insert_journeys_DB_Column_user_id  TEXT ,
  $insert_journeys_DB_Column_employee_id  TEXT ,
  $insert_journeys_DB_Column_customer_id   TEXT ,
  $insert_journeys_DB_Column_start_lat  TEXT ,
  $insert_journeys_DB_Column_start_lang  TEXT ,
  $insert_journeys_DB_Column_end_lat  TEXT ,
  $insert_journeys_DB_Column_end_lang  TEXT ,
  $insert_journeys_DB_Column_start_date  TEXT ,
  $insert_journeys_DB_Column_end_date  TEXT ,
  $insert_journeys_DB_Column_current_visit_status  TEXT ,
  $insert_journeys_DB_Column_visit_type  TEXT 
)
      ''');
      },
    );
  }

  //=========================================
  Future<int> insert_insert_journeys(Insert_journeys_DB item) async {
    int id;
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      await txn
          .insert(insert_journeys_DB_tabelname, item.toJson(),
              conflictAlgorithm: ConflictAlgorithm.replace)
          .then((value) {
        id = value;
      });
    });
    return id;
  }

  Future<List<Insert_journeys_DB>> get_All_item_in_insert_journeys(
      int id) async {
    var dbClient = await db;
    List<Insert_journeys_DB> data = [];
    List<Map> maps = await dbClient.query(insert_journeys_DB_tabelname,
        where: '$insert_journeys_DB_Column_user_id=?',
        whereArgs: [id]).then((value) {
      for (int i = 0; i < value.length; i++) {
        data.add(Insert_journeys_DB.fromJson(value[i]));
      }
    });
    return data;
  }

  Future delete_item_in_insert_journeys(int id) async {
    var dbClient = await db;
    return await dbClient.query(insert_journeys_DB_tabelname,
        where: '$insert_visit_DB_Column_user_id=?', whereArgs: [id]);
  }

//==============================================

  //=========================================
  Future<int> insert_insert_visit(Insert_visit_DB item) async {
    int id;
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      await txn
          .insert(insert_visit_DB_tabelname, item.toJson(),
              conflictAlgorithm: ConflictAlgorithm.replace)
          .then((value) {
        id = value;
      });
    });
    return id;
  }

  Future<List<Insert_visit_DB>> get_All_item_in_insert_visit(int id) async {
    var dbClient = await db;
    List<Insert_visit_DB> data = [];
    List<Map> maps = await dbClient.query(insert_visit_DB_tabelname,
        where: '$insert_visit_DB_Column_user_id=?',
        whereArgs: [id]).then((value) {
      for (int i = 0; i < value.length; i++) {
        data.add(Insert_visit_DB.fromJson(value[i]));
      }
    });
    return data;
  }

  Future delete_item_in_insert_visit(int id) async {
    var dbClient = await db;
    return await dbClient.query(insert_visit_DB_tabelname,
        where: '$insert_visit_DB_Column_user_id=?', whereArgs: [id]);
  }

//==============================================

  //=========================================
  Future<int> insert_insert_cheque({@required Insert_cheque_DB item}) async {
    int id;
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      await txn
          .insert(insert_cheque_tabelname, item.toJson(),
              conflictAlgorithm: ConflictAlgorithm.replace)
          .then((value) {
        id = value;
      });
    });
    return id;
  }

  Future<List<Insert_cheque_DB>> get_All_item_in_insert_cheque() async {
    var dbClient = await db;
    List<Insert_cheque_DB> data = [];
    List<Map> maps =
        await dbClient.query(insert_cheque_tabelname).then((value) {
      for (int i = 0; i < value.length; i++) {
        data.add(Insert_cheque_DB.fromJson(value[i]));
      }
    });
    return data;
  }

  Future delete_item_in_insert_cheque(int id) async {
    var dbClient = await db;
    return await dbClient.query(insert_cheque_tabelname,
        where: '$insert_cheque_Column_customer_id=?', whereArgs: [id]);
  }

//==============================================
//   Future <int>insert_item_tabel(Item_Database item) async {
//     int id;
//     var dbClient = await db;
//     await   dbClient.transaction((txn) async{
//        await txn.insert(item_tabelname, item.toJson(),
//           conflictAlgorithm: ConflictAlgorithm.replace).then((value) {
//           id=value;
//       });
//     });
//     return id;  }
//
//   Future<List<Item_Database>> get_All_item_in_olderlist_(int id) async {
//     var dbClient = await db;
//     List<Item_Database> data = [];
//     List<Map> maps = await dbClient
//         .query(item_tabelname, where: '$item_older_id=?', whereArgs: [id]).then((value) {
//       for (int i = 0; i < value.length; i++) {
//               data.add(Item_Database.fromJson(value[i]));
//             }
//     });
// return data;
//   }

  // Future<List<Item_Order__Db_json>> get_All_item_in_olderlist_(int id) async {
  //   List<Item_Order__Db_json> data = [];
  //
  //   var dbClient = await db;
  //   // List<Map>maps = await
  //   await   dbClient.query(item_tabelname).then((value) {
  //     for (int i = 0; i < value.length; i++) {
  //       data.add(Item_Order__Db_json.fromJson(value[i]));
  //     }
  //   });
  //
  //   return data;
  // }

  // Future delete_item_in_olderlist_byId(int id) async {
  //   var dbClient = await db;
  //   return await dbClient
  //       .query(item_tabelname, where: '$item_itemId=?', whereArgs: [id]);
  // }

//==============================================
//==============================================
//   Future   insert_make_older_(ListOrder item) async {
//     int id;
//     var dbClient = await db;
//     await  dbClient.insert(make_older_tabelname, item.toJson(),conflictAlgorithm: ConflictAlgorithm.replace).then((value) {
//       //print(value);
//        id=value;
//
//     });
//
//     // dbClient.transaction((txn) {
//     //    txn.insert(make_older_tabelname, item.toJson(),
//     //       conflictAlgorithm: ConflictAlgorithm.replace);
//     // }).then((value) {
//     //   id=value;
//     // });
//     return id;
//    }
//
//   Future<Make_Order__Db_json> get_make_older(int id) async {
//     var dbClient = await db;
//     List<Map> maps = await dbClient
//         .query(make_older_tabelname, where: '$item_itemId=?', whereArgs: [id]);
//     if (maps.length > 0) {
//       return Make_Order__Db_json.fromJson(maps.first);
//     } else {
//       return null;
//     }
//   }
//
//   Future<List<ListOrder>> get_All_make_older_() async {
//     List<ListOrder> data = [];
//
//     var dbClient = await db;
//     // List<Map>maps = await
//     dbClient.query(make_older_tabelname).then((value) {
//       for (int i = 0; i < value.length; i++) {
//         data.add(ListOrder.fromJson(value[i]));
//       }
//     });
//
//     return data;
//   }
//
//   Future delete_make_older_byId(int id) async {
//     var dbClient = await db;
//     return await dbClient.query(make_older_tabelname,
//         where: '$item_older_id=?', whereArgs: [id]);
//   }

  //==============================================

//ادخل داتا في تيبول  sales_order_invoice_request_stock_items
  Future insert_sales_order_cart_promotions(
      Sales_Order_Cart_Promotions_Model
          sales_order_cart_promotions_model) async {
    var dbClient = await db;
    dbClient.transaction((txn) async {
      return await txn.insert(sales_order_cart_promotions_tabelname,
          sales_order_cart_promotions_model.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future update_sales_order_cart_promotions(
      Sales_Order_Cart_Promotions_Model
          sales_order_cart_promotions_model) async {
    var dbClient = await db;
    return await dbClient.update(sales_order_cart_promotions_tabelname,
        sales_order_cart_promotions_model.toJson(),
        where: '$sales_order_cart_promotions_id=?',
        whereArgs: [sales_order_cart_promotions_model.id]);
  }

  Future<Sales_Order_Cart_Promotions_Model> get_sales_order_cart_promotions(
      int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(sales_order_cart_promotions_tabelname,
        where: '$sales_order_cart_promotions_id=?', whereArgs: [id]);
    if (maps.length > 0) {
      return Sales_Order_Cart_Promotions_Model.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Sales_Order_Cart_Promotions_Model>>
      get_All_sales_order_cart_promotions() async {
    List<Sales_Order_Cart_Promotions_Model> data = [];

    var dbClient = await db;
    // List<Map>maps = await
    await dbClient.query(sales_order_cart_promotions_tabelname).then((value) {
      for (int i = 0; i < value.length; i++) {
        data.add(Sales_Order_Cart_Promotions_Model.fromJson(value[i]));
      }
    });

    return data;
    //
    //
    // return maps.isNotEmpty ? maps.map((data) =>
    //     Sales_Order_Request_Details_Model.fromJson(data)).toList() :[];
    //
    //
  }

  Future delete_sales_order_cart_promotions(int id) async {
    var dbClient = await db;
    return await dbClient.query(sales_order_cart_promotions_tabelname,
        where: '$sales_order_cart_promotions_id=?', whereArgs: [id]);
  }

//==========================================================================================

//ادخل داتا في تيبول  sales_order_invoice_request_stock_items
  Future insert_sales_order_invoice_request_stock_items(
      Sales_Order_Invoice_Request_Stock_Items_Model
          sales_order_invoice_request_stock_items_model) async {
    var dbClient = await db;
    dbClient.transaction((txn) async {
      return await txn.insert(sales_order_invoice_request_stock_items_tabelname,
          sales_order_invoice_request_stock_items_model.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future update_sales_order_invoice_request_stock_items(
      Sales_Order_Invoice_Request_Stock_Items_Model
          sales_order_invoice_request_stock_items_model) async {
    var dbClient = await db;
    return await dbClient.update(
        sales_order_invoice_request_stock_items_tabelname,
        sales_order_invoice_request_stock_items_model.toJson(),
        where: '$sales_order_invoice_request_stock_items_id=?',
        whereArgs: [sales_order_invoice_request_stock_items_model.id]);
  }

  Future<Sales_Order_Invoice_Request_Stock_Items_Model>
      get_sales_order_invoice_request_stock_items(int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(
        sales_order_invoice_request_stock_items_tabelname,
        where: '$sales_order_invoice_request_stock_items_id=?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Sales_Order_Invoice_Request_Stock_Items_Model.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Sales_Order_Invoice_Request_Stock_Items_Model>>
      get_All_sales_order_invoice_request_stock_items() async {
    List<Sales_Order_Invoice_Request_Stock_Items_Model> data = [];

    var dbClient = await db;
    // List<Map>maps = await
    await dbClient
        .query(sales_order_invoice_request_stock_items_tabelname)
        .then((value) {
      for (int i = 0; i < value.length; i++) {
        data.add(
            Sales_Order_Invoice_Request_Stock_Items_Model.fromJson(value[i]));
      }
    });

    return data;
    //
    //
    // return maps.isNotEmpty ? maps.map((data) =>
    //     Sales_Order_Request_Details_Model.fromJson(data)).toList() :[];
    //
    //
  }

  Future delete_sales_order_invoice_request_stock_items(int id) async {
    var dbClient = await db;
    return await dbClient.query(
        sales_order_invoice_request_stock_items_tabelname,
        where: '$sales_order_invoice_request_stock_items_id=?',
        whereArgs: [id]);
  }

//==========================================================================================
//ادخل داتا في تيبول  Sales_Order_Request_Details
  Future insert_Sales_Order_Request_Details(
      Sales_Order_Request_Details_Model
          sales_order_request_details_model) async {
    var data;
    await db.then((value) {
      value.transaction((txn) {
        data = txn.insert(sales_order_request_details_tabelname,
            sales_order_request_details_model.toJson());
      });
    });
    return data;
  }

  Future update_Sales_Order_Request_Details(
      Sales_Order_Request_Details_Model
          sales_order_request_details_model) async {
    var dbClient = await db;
    return await dbClient.update(sales_order_request_details_tabelname,
        sales_order_request_details_model.toJson(),
        where: 'sales_order_request_details_id=?',
        whereArgs: [sales_order_request_details_model.id]);
  }

  Future<Sales_Order_Request_Details_Model> get_Sales_Order_Request_Details(
      int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(sales_order_request_details_tabelname,
        where: '$sales_order_request_details_id=?', whereArgs: [id]);
    if (maps.length > 0) {
      return Sales_Order_Request_Details_Model.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Sales_Order_Request_Details_Model>>
      get_All_Sales_Order_Request_Details() async {
    List<Sales_Order_Request_Details_Model> data = [];

    var dbClient = await db;
    // List<Map>maps = await
    await dbClient.query(sales_order_request_details_tabelname).then((value) {
      for (int i = 0; i < value.length; i++) {
        data.add(Sales_Order_Request_Details_Model.fromJson(value[i]));
      }
    });

    return data;
    //
    //
    // return maps.isNotEmpty ? maps.map((data) =>
    //     Sales_Order_Request_Details_Model.fromJson(data)).toList() :[];
    //
    //
  }

  Future delete_Sales_Order_Request_Details(int id) async {
    var dbClient = await db;
    return await dbClient.query(sales_order_request_details_tabelname,
        where: '$sales_order_request_details_id=?', whereArgs: [id]);
  }

//==========================================================================================
//ادخل داتا في تيبول  insert_sales_order_requests
  Future<int> insert_sales_order_requests(
      Sales_Order_Requests_Model sales_order_requests_model) async {
    int data;
     var dbClient = await db;
    // await db.then((value) {
    //   value.transaction((txn)   async {
    //     await    txn
    //         .insert(
    //           sales_order_requests_tabelname,
    //           sales_order_requests_model.toJson(),
    //           conflictAlgorithm: ConflictAlgorithm.replace,
    //         )
    //         .then((value) {
    //        data=value;
    //      });
    //   });
    // });

    await  dbClient.insert(sales_order_requests_tabelname,  sales_order_requests_model.toJson(),
           conflictAlgorithm: ConflictAlgorithm.replace,).then((value) {
      data=value;
    });
    return data;
  }

  Future update_sales_order_requests(
      Sales_Order_Requests_Model sales_order_requests_model) async {
    var dbClient = await db;
    return await dbClient.update(
        sales_order_requests_tabelname, sales_order_requests_model.toJson(),
        where: '$sales_order_requests_id=?',
        whereArgs: [sales_order_requests_model.id]);
  }

  Future<Sales_Order_Requests_Model> get_sales_order_requests(int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(sales_order_requests_tabelname,
        where: '$sales_order_requests_id=?', whereArgs: [id]);
    if (maps.length > 0) {
      return Sales_Order_Requests_Model.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Sales_Order_Requests_Model>>
      get_All_sales_order_requests() async {
    List<Sales_Order_Requests_Model> data = [];

    var dbClient = await db;
    // List<Map>maps = await
    await dbClient.query(sales_order_requests_tabelname).then((value) {
      for (int i = 0; i < value.length; i++) {
        data.add(Sales_Order_Requests_Model.fromJson(value[i]));
      }
    });

    return data;
    //
    //
    // return maps.isNotEmpty ? maps.map((data) =>
    //     Sales_Order_Request_Details_Model.fromJson(data)).toList() :[];
    //
    //
  }

  Future delete_sales_order_requests(int id) async {
    var dbClient = await db;
    return await dbClient.query(sales_order_requests_tabelname,
        where: '$sales_order_requests_id=?', whereArgs: [id]);
  }

  Future close() async {
    await db.then((value) {
      if (value.isOpen) {
        value.close();
      }
    });
  }
}

import 'dart:io';

import 'package:anjum/DB/tabelname/sales_order_cart_promotions.dart';
import 'package:anjum/DB/tabelname/sales_order_invoice_request_stock_items.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

import 'myModel.dart';
import 'tabelname/sales_order_request_details.dart';
import 'tabelname/sales_order_requests.dart';

class DatabaseHelper {

static final DatabaseHelper _instance=DatabaseHelper.internal();
DatabaseHelper.internal();
factory DatabaseHelper()=>_instance;
static Database _db;
Future<Database> get db async{
  if(_db!=null){
    return _db;
  }else{
  return  _db= await initDb();
  }



}







   initDb() async {

  Directory directionality= await getApplicationDocumentsDirectory();
    String path = join( directionality.path, "anjum.db");
  return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {

      await db.execute('''

CREATE TABLE  $sales_order_request_details_tabelname  (
   $sales_order_request_details_id INTEGER NOT NULL,
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
     
     
     
   $sales_order_request_details_created_at INTEGER   NOT NULL  ,
   $sales_order_request_details_updated_at  INTEGER  NOT NULL    ,
   $sales_order_request_details_Item_Discount  REAL
)
      ''');
//
      await db.execute('''

CREATE TABLE  $sales_order_requests_tabelname  (
   $sales_order_requests_id INTEGER  ,
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
    $sales_order_invoice_request_stock_items_id  INTEGER NOT NULL,
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
    $sales_order_cart_promotions_id  INTEGER NOT NULL,
  $sales_order_cart_promotions_sales_order_cart_id  INTEGER NOT NULL,
  $sales_order_cart_promotions_discount_type  TEXT,
  $sales_order_cart_promotions_discount_percentage  REAL  ,
  $sales_order_cart_promotions_discount_amount  REAL ,
  $sales_order_cart_promotions_promotion_id  INTEGER  ,
  $sales_order_cart_promotions_promotion_type  TEXT,
  $sales_order_cart_promotions_promotion_bonus_item_id  INTEGER,
  $sales_order_cart_promotions_promotion_bonus_quantity  INTEGER  ,
  $sales_order_cart_promotions_created_at  INTEGER NOT NULL ,
  $sales_order_cart_promotions_updated_at  INTEGER
)
      ''');

    },);
  }

//ادخل داتا في تيبول  sales_order_invoice_request_stock_items
  Future  insert_sales_order_cart_promotions(Sales_Order_Cart_Promotions_Model
  sales_order_cart_promotions_model) async {
    var dbClient = await  db;
    dbClient.transaction((txn)   {


      return  txn.insert(sales_order_cart_promotions_tabelname,
          sales_order_cart_promotions_model.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);

    });

  }

  Future update_sales_order_cart_promotions(Sales_Order_Cart_Promotions_Model
  sales_order_cart_promotions_model) async {
    var dbClient = await  db;
    return await dbClient.update(sales_order_cart_promotions_tabelname,
        sales_order_cart_promotions_model.toJson(),
        where: '$sales_order_cart_promotions_id=?',
        whereArgs: [sales_order_cart_promotions_model.id]);
  }

  Future<Sales_Order_Cart_Promotions_Model> get_sales_order_cart_promotions(

      int   id) async {
    var dbClient = await  db;
    List<Map>maps = await
    dbClient.query(sales_order_cart_promotions_tabelname,

        where: '$sales_order_cart_promotions_id=?',
        whereArgs: [ id]);
    if (maps.length > 0) {
      return Sales_Order_Cart_Promotions_Model.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<
      Sales_Order_Cart_Promotions_Model>> get_All_sales_order_cart_promotions(
      ) async {
    List<
        Sales_Order_Cart_Promotions_Model> data=[];

    var dbClient = await  db;
    // List<Map>maps = await
    dbClient.query(sales_order_cart_promotions_tabelname).then((value) {
      for(int i=0;i<value.length;i++){
        data.add( Sales_Order_Cart_Promotions_Model.fromJson(value[i]));
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

  Future  delete_sales_order_cart_promotions(
      int
      id) async {
    var dbClient = await  db;
    return await
    dbClient.query(sales_order_cart_promotions_tabelname,

        where: '$sales_order_cart_promotions_id=?',
        whereArgs: [ id]);

  }



//==========================================================================================

//ادخل داتا في تيبول  sales_order_invoice_request_stock_items
  Future  insert_sales_order_invoice_request_stock_items(Sales_Order_Invoice_Request_Stock_Items_Model
  sales_order_invoice_request_stock_items_model) async {
    var dbClient = await  db;
    dbClient.transaction((txn)   {


    return  txn.insert(sales_order_invoice_request_stock_items_tabelname,
          sales_order_invoice_request_stock_items_model.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);

    });

  }

Future update_sales_order_invoice_request_stock_items(Sales_Order_Invoice_Request_Stock_Items_Model
sales_order_invoice_request_stock_items_model) async {
  var dbClient = await  db;
  return await dbClient.update(sales_order_invoice_request_stock_items_tabelname,
      sales_order_invoice_request_stock_items_model.toJson(),
      where: '$sales_order_invoice_request_stock_items_id=?',
      whereArgs: [sales_order_invoice_request_stock_items_model.id]);
}

Future<Sales_Order_Invoice_Request_Stock_Items_Model> get_sales_order_invoice_request_stock_items(

    int   id) async {
  var dbClient = await  db;
  List<Map>maps = await
  dbClient.query(sales_order_invoice_request_stock_items_tabelname,

      where: '$sales_order_invoice_request_stock_items_id=?',
      whereArgs: [ id]);
  if (maps.length > 0) {
    return Sales_Order_Invoice_Request_Stock_Items_Model.fromJson(maps.first);
  } else {
    return null;
  }
}

Future<List<
    Sales_Order_Invoice_Request_Stock_Items_Model>> get_All_sales_order_invoice_request_stock_items(
    ) async {
  List<
      Sales_Order_Invoice_Request_Stock_Items_Model> data=[];

  var dbClient = await  db;
  // List<Map>maps = await
  dbClient.query(sales_order_invoice_request_stock_items_tabelname).then((value) {
    for(int i=0;i<value.length;i++){
      data.add( Sales_Order_Invoice_Request_Stock_Items_Model.fromJson(value[i]));
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

  Future  delete_sales_order_invoice_request_stock_items(
      int
      id) async {
    var dbClient = await  db;
    return await
    dbClient.query(sales_order_invoice_request_stock_items_tabelname,

        where: '$sales_order_invoice_request_stock_items_id=?',
        whereArgs: [ id]);

  }



//==========================================================================================
//ادخل داتا في تيبول  Sales_Order_Request_Details
  Future insert_Sales_Order_Request_Details(Sales_Order_Request_Details_Model
  sales_order_request_details_model) async {
  var data;
   db.then((value) {
     value.transaction((txn) {
    data=   txn.insert(sales_order_request_details_tabelname, sales_order_request_details_model.toJson() );
     });
   });
  return data;
}


  Future update_Sales_Order_Request_Details(Sales_Order_Request_Details_Model
  sales_order_request_details_model) async {
    var dbClient = await  db;
    return await dbClient.update(sales_order_request_details_tabelname,
        sales_order_request_details_model.toJson(),
        where: 'sales_order_request_details_id=?',
        whereArgs: [sales_order_request_details_model.id]);
  }

  Future<Sales_Order_Request_Details_Model> get_Sales_Order_Request_Details(

   int   id) async {
    var dbClient = await  db;
    List<Map>maps = await
    dbClient.query(sales_order_request_details_tabelname,

        where: '$sales_order_request_details_id=?',
        whereArgs: [ id]);
    if (maps.length > 0) {
      return Sales_Order_Request_Details_Model.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<
      Sales_Order_Request_Details_Model>> get_All_Sales_Order_Request_Details(
       ) async {
    List<
        Sales_Order_Request_Details_Model> data=[];

    var dbClient = await  db;
    // List<Map>maps = await
    dbClient.query(sales_order_request_details_tabelname).then((value) {
      for(int i=0;i<value.length;i++){
        data.add( Sales_Order_Request_Details_Model.fromJson(value[i]));
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





  Future  delete_Sales_Order_Request_Details(
      int
      id) async {
    var dbClient = await  db;
 return await
    dbClient.query(sales_order_request_details_tabelname,

        where: '$sales_order_request_details_id=?',
        whereArgs: [ id]);

  }










//==========================================================================================
//ادخل داتا في تيبول  insert_sales_order_requests
  Future insert_sales_order_requests(Sales_Order_Requests_Model
  sales_order_requests_model) async {
    var data;
    db.then((value) {
      value.transaction((txn) {
        data=   txn.insert(sales_order_requests_tabelname, sales_order_requests_model.toJson() );
      });
    });
    return data;
  }


  Future update_sales_order_requests(Sales_Order_Requests_Model
  sales_order_requests_model) async {
    var dbClient = await  db;
    return await dbClient.update(sales_order_requests_tabelname,
        sales_order_requests_model.toJson(),
        where: '$sales_order_requests_id=?',
        whereArgs: [sales_order_requests_model.id]);
  }

  Future<Sales_Order_Requests_Model> get_sales_order_requests(

      int   id) async {
    var dbClient = await  db;
    List<Map>maps = await
    dbClient.query(sales_order_requests_tabelname,

        where: '$sales_order_requests_id=?',
        whereArgs: [ id]);
    if (maps.length > 0) {
      return Sales_Order_Requests_Model.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<
      Sales_Order_Requests_Model>> get_All_sales_order_requests(
      ) async {
    List<
        Sales_Order_Requests_Model> data=[];

    var dbClient = await  db;
    // List<Map>maps = await
    dbClient.query(sales_order_requests_tabelname).then((value) {
      for(int i=0;i<value.length;i++){
        data.add( Sales_Order_Requests_Model.fromJson(value[i]));
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





  Future  delete_sales_order_requests(
      int
      id) async {
    var dbClient = await  db;
    return await
    dbClient.query(sales_order_requests_tabelname,

        where: '$sales_order_requests_id=?',
        whereArgs: [ id]);

  }



































  Future close()async{
  await db.then((value) {
    if(value.isOpen){
      value.close();
    }

  });
  }
}
















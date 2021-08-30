import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer'as developer;
import 'json/customer_json.dart';
import 'json/get_employee_data_json.dart';
import 'json/invoice_json.dart';
import 'json/login_json.dart';
import 'json/products_json.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class AllNetworking {
  static var paseurl = 'http://18.220.206.74/';//http://18.220.206.74/API/api/auth/login

  //Response response;
  Dio dio = new Dio(

  );

  Future<Login_json> login({
    @required String user_name,
    @required String password,
    @required int user_id,
  }) async {


    Login_json data;
    await dio//http://18.220.206.74/van/user_api/login//http://18.220.206.74/API/api/auth/login
        .post( "http://18.220.206.74/API/api/auth/login", queryParameters: {
      //"mode": "formdata",
      "user_name": user_name,
      "password": password,
      "user_id": user_id,
      "key":'1234567890'
    },  )
        .then((value) {
      print(value.data);
      if (value.data['error_message'] != null) {
        Get.snackbar('', value.data['error_message']);
        data = null;
      } else {
        data = Login_json.fromJson(value.data);
      }
    }).catchError((e){print(e.toString());});

    return data;
  }

  Future<Invoice_json> invoice({
    @required String employee_id,
    @required String return_type,
  }) async {
    final formData = {
      "mode": "formdata",
      "employee_id": employee_id,
      "return_type": return_type,
    };
    Invoice_json data;
    await dio
        .post(paseurl + "API/api/orders/invoice", queryParameters: formData)
        .then((value) {
      data = Invoice_json.fromJson(value.data);
    });

    return data;
  }

  Future<Customer_json> customer({
    @required String employee_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "employee_id": employee_id,
    };
    Customer_json data;
    await dio
        .post(paseurl + "API/api/customer", queryParameters: formData)
        .then((value) {
      data = Customer_json.fromJson(value.data);
    });

    return data;
  }

  Future<Products_json> products({
    @required String employee_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "employee_id": employee_id,
    };
    Products_json data;
    await dio
        .post(paseurl + "API/api/products", queryParameters: formData)
        .then((value) {
      data = Products_json.fromJson(value.data);
    });

    return data;
  }

//
//   Future< Get_employee_data_json> Get_employee_data ({
//     @required int user_id,
//
//   }) async {
//
//     final formData = {
//       "mode": "formdata",
//       "key":  "1234567890" ,
//       "employee_id":59.toString()
//
//     };
//     Get_employee_data_json data;
//
//     await dio
//         .post(paseurl+'van/user_api/get_employee_data', queryParameters: formData)
//         .then((value) {
//       print(value.data  );
// //print(value.data["result"]  );
//     //  data = Get_employee_data_json.fromJson(value.data);
//
//     });
//
//     return data;
//   }
  Future<Get_employee_data_json> Get_employee_data(
      {@required String user_id}) async {
    Get_employee_data_json get_employee_data_json;
    http.Response response = await http.post(
      Uri.parse(paseurl + 'van/user_api/get_employee_data'),
      body: {"mode": "formdata", "key": "1234567890", "user_id": user_id},
    ).then((value) {
      developer.log(value.toString());
      var v = jsonDecode(value.body);

    ///    print(v ['result']  );
      get_employee_data_json =
          Get_employee_data_json.fromJson(jsonDecode(value.body));
    });

    return get_employee_data_json;
  }

  Future insert_cheque_to_Web({data}) async {
    var respons;
    final formData = {

      "key": '1234567890',
      "lisit_cheque":data

    };
    // dio.options.headers['content-Type'] = 'application/json';
    // // dio.options.headers['Content-Length'] = '<calculated when request is sent>';
    // // dio.options.headers['Host'] = '<calculated when request is sent>';
    // dio.options.headers['Accept'] = '*/*';
    // dio.options.headers['Accept-Encoding'] = 'gzip, deflate, br';
    // dio.options.headers['Connection'] = 'keep-alive';
    return await dio.post('http://18.220.206.74/van/user_api/insert_cheque', data:  formData,)
    .then((value) {
      respons=value;

    }) ;
    }


Future  insert_invoice_salesorder({data})async{
  var respons;
  final formData = {

    "key": '1234567890',
    "list_invoice":data

  };
print(jsonEncode(data));
  return await dio.post('http://18.220.206.74/van/user_api/insert_invoice_salesorder', data: jsonEncode(data)  )
      .then((value) {
        print(value);
    respons=value;

  }) ;
}


Future insert_photos(data)async{
  var respons;
  final formData = {

    "key": '1234567890',
    "list_invoice":data

  };
  print(jsonEncode(data));
  return await dio.post('http://18.220.206.74/van/user_api/insert_photos', data: jsonEncode(data)  )
      .then((value) {
    print(value);
    respons=value;

  }) ;
}

}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'json/customer_json.dart';
import 'json/get_employee_data_json.dart';
import 'json/invoice_json.dart';
import 'json/login_json.dart';
import 'json/products_json.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
class AllNetworking {
 static var  paseurl = 'http://18.220.206.74/';

  //Response response;
  Dio dio = new Dio();

  Future<Login_json> login({
    @required String user_name,
    @required String password,
    @required   int user_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "user_name": user_name,
      "password": password,
      "user_id": user_id,
    };
    Login_json data;
    await dio
        .post(paseurl + "API/api/auth/login", queryParameters: formData)
        .then((value) {
          print(value.data);
      if (value.data['error_message'] != null) {
        Get.snackbar('', value.data['error_message']);
        data = null;
      } else {
        data = Login_json.fromJson(value.data);
      }
    });

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




  Future< Customer_json> customer({
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

  Future< Products_json> products({
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
  Future<Get_employee_data_json> Get_employee_data({    @required  String user_id }) async {
    Get_employee_data_json get_employee_data_json;
    http.Response response = await http.post(
      Uri.parse(paseurl+'van/user_api/get_employee_data'),
      body: {
        "mode": "formdata",
        "key": "1234567890",
        "user_id":user_id
      },
    ).then((value) {
      var v =jsonDecode(value.body);
     // print(v ['result'] [  "employee_permissions"] );
       get_employee_data_json =Get_employee_data_json.fromJson(jsonDecode(value.body));
    });



    return   get_employee_data_json;

}
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'json/customer_json.dart';
import 'json/invoice_json.dart';
import 'json/login_json.dart';
import 'json/products_json.dart';

class AllNetworking {
  var paseurl = 'http://18.220.206.74/API/api/';

  //Response response;
  Dio dio = new Dio();

  Future<Login_json> login({
    @required String user_name,
    @required String password,
  }) async {
    final formData = {
      "mode": "formdata",
      "user_name": user_name,
      "password": password,
    };
    Login_json data;
    await dio
        .post(paseurl + "auth/login", queryParameters: formData)
        .then((value) {
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
        .post(paseurl + "orders/invoice", queryParameters: formData)
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
        .post(paseurl + "customer", queryParameters: formData)
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
        .post(paseurl + "products", queryParameters: formData)
        .then((value) {

      data = Products_json.fromJson(value.data);

    });

    return data;
  }



}

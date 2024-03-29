import 'dart:convert';
import 'dart:io';

import 'package:anjum/network/json/get_order_status_json.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'dart:developer' as developer;
import 'json/customer_json.dart';
import 'json/get_employee_data_json.dart';
import 'json/get_reports_json.dart';
import 'json/get_timelines_json.dart';
import 'json/insert_employee_visit_photos_json.dart';
import 'json/invoice_json.dart';
import 'json/login_json.dart';
import 'json/products_json.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'jsonofnwetry/get_Fifth_step_json.dart';
import 'jsonofnwetry/get_first_step_json.dart';
import 'dart:convert' as convert;

import 'jsonofnwetry/get_fourth_step_json.dart';

import 'jsonofnwetry/get_third_step_json.dart';

import 'newjosomnLast/get_second_step1_json.dart';
import 'newjosomnLast/get_second_step2_json.dart';
import 'newjosomnLast/get_second_step3_json.dart';
import 'package:device_info/device_info.dart';
import 'package:battery/battery.dart';

class AllNetworking {
  static var paseurl =
      'http://18.220.206.74/'; //http://18.220.206.74/API/api/auth/login

  //Response response;
  Dio dio = new Dio();

  Future<Login_json> login({
    required String user_name,
     required String password,
    required int user_id,
  }) async {
  late  Login_json data;
    await dio //http://18.220.206.74/van/user_api/login//http://18.220.206.74/API/api/auth/login
        .post(
      "http://18.220.206.74/API/api/auth/login",
      queryParameters: {
        //"mode": "formdata",
        "user_name": user_name,
        "password": password,
        "user_id": user_id,
        "key": '1234567890'
      },
    ).then((value) {
      print(value.data);
      if (value.data['error_message'] != null) {
        //Get.snackbar('', value.data['error_message']);

      } else {
        data = Login_json.fromJson(value.data);
      }
    }).catchError((e) {
      print(e.toString());
    });

    return data;
  }

  Future<Invoice_json> invoice({
    required String employee_id,
    required String return_type,
  }) async {
    final formData = {
      "mode": "formdata",
      "employee_id": employee_id,
      "return_type": return_type,
    };
  late  Invoice_json data;
    await dio
        .post(paseurl + "API/api/orders/invoice", queryParameters: formData)
        .then((value) {
      data = Invoice_json.fromJson(value.data);
    });

    return data;
  }

  Future<Customer_json> customer({
     required String employee_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "employee_id": employee_id,
    };
  late  Customer_json data;
    await dio
        .post(paseurl + "API/api/customer", queryParameters: formData)
        .then((value) {
      data = Customer_json.fromJson(value.data);
    });

    return data;
  }

  Future<Products_json> products({
    required String employee_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "employee_id": employee_id,
    };
  late  Products_json data;
    await dio
        .post(paseurl + "API/api/products", queryParameters: formData)
        .then((value) {
      data = Products_json.fromJson(value.data);
    });

    return data;
  }

  Future<Get_first_step_json> get_first_step({
     required int user_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id
    };
   late Get_first_step_json data;

    var url = Uri.parse('http://18.220.206.74/van/user_api/get_first_step');
    await http.post(url, body: {
      "key": "1234567890",
      "user_id": user_id.toString()
    }).then((value) {
      print(value.body);
      data = Get_first_step_json.fromJson(convert.jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
    });

    return data;
  }

  Future<Get_second_step1_json> get_second_step1({
     required int user_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id
    };
  late  Get_second_step1_json data;

    var url = Uri.parse('http://18.220.206.74/van/user_api/get_second_step1');
    await http.post(url, body: {
      "key": "1234567890",
      "user_id": user_id.toString()
    }).then((value) {
      data = Get_second_step1_json.fromJson(convert.jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
    });

    return data;
  }

  Future<Get_second_step2_json> get_second_step2({
    required int user_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id
    };
   late Get_second_step2_json data;

    var url = Uri.parse('http://18.220.206.74/van/user_api/get_second_step2');
    await http.post(url, body: {
      "key": "1234567890",
      "user_id": user_id.toString()
    }).then((value) {
      data = Get_second_step2_json.fromJson(convert.jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
    });

    return data;
  }

  Future<Get_second_step3_json> get_second_step3({
     required int user_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id
    };
  late  Get_second_step3_json data;

    var url = Uri.parse('http://18.220.206.74/van/user_api/get_second_step3');
    await http.post(url, body: {
      "key": "1234567890",
      "user_id": user_id.toString()
    }).then((value) {
      data = Get_second_step3_json.fromJson(convert.jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
    });

    return data;
  }

  Future<Get_third_step_json> get_third_step({
     required int user_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id
    };
  late  Get_third_step_json data;

    var url = Uri.parse('http://18.220.206.74/van/user_api/get_third_step');
    await http.post(url, body: {
      "key": "1234567890",
      "user_id": user_id.toString()
    }).then((value) {
      data = Get_third_step_json.fromJson(convert.jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
    });

    return data;
  }

  Future<Get_fourth_step_json> get_fourth_step({
    required int user_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id
    };
   late  Get_fourth_step_json data;

    var url = Uri.parse('http://18.220.206.74/van/user_api/get_fourth_step');
    await http.post(url, body: {
      "key": "1234567890",
      "user_id": user_id.toString()
    }).then((value) {
      data = Get_fourth_step_json.fromJson(convert.jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
    });

    return data;
  }

  Future<Get_Fifth_step_json> get_Fifth_step({
     required int user_id,
  }) async {
    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id
    };
   late Get_Fifth_step_json data;

    var url = Uri.parse('http://18.220.206.74/van/user_api/get_Fifth_step');
    await http.post(url, body: {
      "key": "1234567890",
      "user_id": user_id.toString()
    }).then((value) {
      print(value.body);
      data = Get_Fifth_step_json.fromJson(convert.jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
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

//   Future<Get_employee_data_json> Get_employee_data(
//       {@required String user_id}) async {
//     Get_employee_data_json get_employee_data_json;
//     http.Response response = await http.post(
//       Uri.parse(paseurl + 'van/user_api/get_employee_data'),
//       body: {"mode": "formdata", "key": "1234567890", "user_id": user_id},
//     ).then((value) async{
//       var box = GetStorage();
//
//       // box=await Hive.openBox('data');
//
//
// //box.add(value);
//       var v = jsonDecode(value.body);
//       box.write("key", v);
//
//
//
//
//       developer.log(value.toString());
//
//
//
//     ///    print(v ['result']  );
//       get_employee_data_json =
//           Get_employee_data_json.fromJson(jsonDecode(value.body));
//     });
//
//     return get_employee_data_json;
//   }

  Future insert_cheque_to_Web({data}) async {
    var respons;
    final formData = {"key": '1234567890', "lisit_cheque": data};
    // dio.options.headers['content-Type'] = 'application/json';
    // // dio.options.headers['Content-Length'] = '<calculated when request is sent>';
    // // dio.options.headers['Host'] = '<calculated when request is sent>';
    // dio.options.headers['Accept'] = '*/*';
    // dio.options.headers['Accept-Encoding'] = 'gzip, deflate, br';
    // dio.options.headers['Connection'] = 'keep-alive';
    return await dio
        .post(
      'http://18.220.206.74/van/user_api/insert_cheque',
      data: formData,
    )
        .then((value) {
      respons = value;
    });
  }

  Future insert_cash({data}) async {
    var respons;
    final formData = {"key": '1234567890', "lisit_cheque": data};
    // dio.options.headers['content-Type'] = 'application/json';
    // // dio.options.headers['Content-Length'] = '<calculated when request is sent>';
    // // dio.options.headers['Host'] = '<calculated when request is sent>';
    // dio.options.headers['Accept'] = '*/*';
    // dio.options.headers['Accept-Encoding'] = 'gzip, deflate, br';
    // dio.options.headers['Connection'] = 'keep-alive';
    return await dio
        .post(
      'http://18.220.206.74/van/user_api/insert_cash',
      data: formData,
    )
        .then((value) {
      respons = value;
    });
  }

  Future insert_invoice_salesorder({data}) async {
    var respons;
    final formData = {"key": '1234567890', "list_invoice": data};
    print(jsonEncode(data));
    return await dio
        .post('http://18.220.206.74/van/user_api/insert_invoice_salesorder',
            data: jsonEncode(data))
        .then((value) {
      print(value);
      respons = value;
    });
  }

  Future insert_photos(data) async {
    var respons;
    final formData = {"key": '1234567890', "list_invoice": data};
    print(jsonEncode(data));
    return await dio
        .post('http://18.220.206.74/van/user_api/insert_photos',
            data: jsonEncode(data))
        .then((value) {
      print(value);
      respons = value;
    });
  }

  Future<Get_Order_Status_json> get_order_status({
     required int user_id,
    String from = "",
    String to = "",
  }) async {

    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id.toString(),
      "from_date": from,
      "to_date": to
    };
    late Get_Order_Status_json data;

    var url = Uri.parse('http://18.220.206.74/van/user_api/get_order_status');
    await http.post(url, body: formData).then((value) {
      print(value.body);
      data = Get_Order_Status_json.fromJson(convert.jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
    });

    return data;
  }

  Future<Get_Reports_json> get_reports({
     required int user_id,
    String from = "",
    String to = "",
  }) async {
    print(from);
    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id.toString(),
      "from_date": from,
      "to_date": to
    };
    late Get_Reports_json data;

    var url = Uri.parse('http://18.220.206.74/van/user_api/get_reports');
    await http.post(url, body: formData).then((value) {
      print(value.body);
      data = Get_Reports_json.fromJson(convert.jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
    });

    return data;
  }

  Future<InsertEmployeeVisitPhotosJson> insert_employee_visit_photos(
      { required int user_id,required String batteryLevel,
       required File file,
       required String employee_id,
       required String customer_id}) async {
    String fileName = file.path.split('/').last;

    // final formData = {
    //   "mode": "formdata",
    //   "key": "1234567890",
    //   "user_id": user_id.toString(),
    //   "visit_id": 1.toString(),
    //   "employee_id": employee_id,
    //   "customer_id": customer_id,
    //   "file":         {
    //     "image": await di.MultipartFile.fromFile(file.path,
    //         filename: fileName, contentType: new MediaType('image', 'png')),
    //   },
    // };
   late InsertEmployeeVisitPhotosJson data;
    FormData formData = FormData.fromMap({
      // "mode": "formdata",
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id.toString(),
      "visit_id": 1.toString(),
      "employee_id": employee_id,
      "battery_life": "10",
      "customer_id": customer_id,
      "app_version": "22",
      "android_version": "10",
      "latitude": "10",
      "longitude": "10",
      "file": await MultipartFile.fromFile(file.path,
          filename: fileName, contentType: new MediaType('image', 'png')),
    });
    await dio
        .post('http://18.220.206.74/van/user_api/insert_employee_visit_photos',
            data: formData)
        .then((value) {
      data = InsertEmployeeVisitPhotosJson.fromJson(value.data);
      print(value.data);
    });
    // var url = Uri.parse('http://18.220.206.74/van/user_api/insert_employee_visit_photos');
    // await http.post(url,body: formData).then((value) {
    //   print(value.body);
    //
    // }).catchError((e){print(e.toString());});
    return data;
  }

  Future<GetTimelinesJson> get_timelines(
      { required int user_id,  required String date2}) async {
    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "from_date": date2,
      "user_id": user_id.toString(),
    };
    late  GetTimelinesJson data;

    var url = Uri.parse('http://18.220.206.74/van/user_api/get_timelines');
    await http.post(url, body: formData).then((value) {
      print(value.body);
      data = GetTimelinesJson.fromJson(convert.jsonDecode(value.body));
    }).catchError((e) {
      print(e.toString());
    });

    return data;
  }

  Future insert_visit_photo_comments(
      { required int user_id,
       required String batteryLevel,
       required String customer_id,
       required String comment,
       required int commented_by,required double latitude,required double longitude,
       required int visit_id,
       required int photo_id}) async {
    print("customer_id    $customer_id");



    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var release = androidInfo.version.release;
    var sdkInt = androidInfo.version.sdkInt;
    var manufacturer = androidInfo.manufacturer;
    var model = androidInfo.model;


    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id .toString() ,
      "employee_id": user_id .toString(),
     "battery_life":  60.toString() ,
      "customer_id":  customer_id .toString(),
    "app_version":   1.toString() ,
      "android_version":  sdkInt .toString(),
     "latitude":  latitude .toString(),
     "longitude":  longitude.toString() ,
      "comment": comment, "commented_by":"emp",// commented_by,
   "photo_id": visit_id .toString(),"visit_id": visit_id .toString(),

    };

    var url = Uri.parse(
        'http://18.220.206.74/van/user_api/insert_visit_photo_comments');

    await http.post(url, body:   formData).then((value) {
       print(value.body);
    }).catchError((e) {
      print(e);
    });
  }

  Future<InsertEmployeeVisitPhotosJson> insert_visit_before_after_photos(
      { required int user_id,
       required File file,required String batteryLevel,
       required File file2, required String employee_id,required double latitude,required double longitude,
       required String visit_id,
       required String customer_id}) async {
    String fileName = file.path.split('/').last;
    String fileName2 = file2.path.split('/').last;
    // final formData = {
    //   "mode": "formdata",
    //   "key": "1234567890",
    //   "user_id": user_id.toString(),
    //   "visit_id": 1.toString(),
    //   "employee_id": employee_id,
    //   "customer_id": customer_id,
    //   "file":         {
    //     "image": await di.MultipartFile.fromFile(file.path,
    //         filename: fileName, contentType: new MediaType('image', 'png')),
    //   },
    // };


    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var release = androidInfo.version.release;
    var sdkInt = androidInfo.version.sdkInt;
    var manufacturer = androidInfo.manufacturer;
    var model = androidInfo.model;

 late   InsertEmployeeVisitPhotosJson data;
    FormData formData = FormData.fromMap({
      // "mode": "formdata",
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id.toString(),
      "visit_id": 1.toString(),
      "employee_id": employee_id,
      "customer_id": customer_id,


      "battery_life": "10",
      "app_version":   release ,
      "android_version":  sdkInt ,
      "latitude":  latitude ,
      "longitude":  longitude ,




      "before_image": await MultipartFile.fromFile(file.path,
          filename: fileName, contentType: new MediaType('image', 'png')),
      "after_image": await MultipartFile.fromFile(file2.path,
          filename: fileName, contentType: new MediaType('image', 'png')),
    });
    await dio
        .post(
            'http://18.220.206.74/van/user_api/insert_visit_before_after_photos',
            data: formData)
        .then((value) {
      data = InsertEmployeeVisitPhotosJson.fromJson(value.data);
      print(value.data);
    });
    // var url = Uri.parse('http://18.220.206.74/van/user_api/insert_employee_visit_photos');
    // await http.post(url,body: formData).then((value) {
    //   print(value.body);
    //
    // }).catchError((e){print(e.toString());});
    return data;
  }

  Future insert_visit_before_after_photo_comments(
      { required String user_id,
      required String employee_id,
      required String customer_id,required String batteryLevel,
      required String comment,
      required String commented_by,required String latitude,required String longitude,
      required String visit_id,
      required String photo_id}) async {

    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var release = androidInfo.version.release;
    var sdkInt = androidInfo.version.sdkInt;
    var manufacturer = androidInfo.manufacturer;
    var model = androidInfo.model;

    final formData = {
      "mode": "formdata",
      "key": "1234567890",
      "user_id": user_id ,
      "employee_id": employee_id ,
      "customer_id": customer_id ,
      "comment": comment,
      "commented_by": 1.toString(),
      "visit_id": visit_id ,
      "photo_id": photo_id ,


      "battery_life": "80",
      "app_version":   release .toString(),
      "android_version":  sdkInt .toString(),
      "latitude":  latitude ,
      "longitude":  longitude  ,

    };

    var url = Uri.parse(
        'http://18.220.206.74/van/user_api/insert_visit_before_after_photo_comments');
    await http.post(url, body: formData).then((value) {

      print(value.body);
    }).catchError((e) {
      print(e.toString());
    });
  }
}

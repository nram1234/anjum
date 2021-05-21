import 'package:flutter/material.dart';
import 'package:anjum/SCR/login.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'SCR/Bill.dart';
import 'SCR/all _customer.dart';
import 'SCR/cashpayment.dart';
import 'SCR/dashboard.dart';
import 'SCR/home.dart';
import 'SCR/printer-1.dart';
import 'SCR/products.dart';
import 'SCR/products_Expand.dart';
import 'SCR/testscr.dart';
import 'Translation/Trans.dart';

import 'network/binding/network_binding.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _requestPermission();
    return GetMaterialApp(
      locale: LocalizationService.locale,
      translations: LocalizationService(),
      fallbackLocale: LocalizationService.fallbackLocale,debugShowCheckedModeBanner: false,
      title: 'Anjum',
      initialBinding: NetWorkBinding(),
      theme: ThemeData(
        fontFamily: 'Arbf',
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,),
      home:Login()//Printer1()// CashPay()//Home()//Login()//Bill()//All_Customer()//Dashboard()//Login()// Products_Expand()//Products()//All_Customer()//,
    );
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }


}


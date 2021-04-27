import 'package:flutter/material.dart';
import 'package:anjum/SCR/login.dart';
import 'package:get/get.dart';

import 'SCR/Bill.dart';
import 'SCR/all _customer.dart';
import 'SCR/dashboard.dart';
import 'SCR/home.dart';
import 'SCR/products.dart';
import 'SCR/products_Expand.dart';
import 'Translation/Trans.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: LocalizationService.locale,
      translations: LocalizationService(),
      fallbackLocale: LocalizationService.fallbackLocale,debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Arbf',
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,),
      home: Home()//Login()//Bill()//All_Customer()//Dashboard()//Login()// Products_Expand()//Products()//All_Customer()//,
    );
  }
}


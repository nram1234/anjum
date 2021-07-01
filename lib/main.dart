import 'package:flutter/material.dart';
import 'package:anjum/SCR/login.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'SCR/Bill.dart';
import 'SCR/OrderStatus.dart';
import 'SCR/OrderStatusdetails.dart';
import 'SCR/all _customer.dart';
import 'SCR/cart.dart';
import 'SCR/cashpayment.dart';
import 'SCR/dashboard.dart';
import 'SCR/filter.dart';
import 'SCR/home.dart';
import 'SCR/myMapScr.dart';
import 'SCR/new/BeforeAndAfter.dart';
import 'SCR/new/TimeLine.dart';
import 'SCR/printer-1.dart';
import 'SCR/products.dart';
import 'SCR/products_Expand.dart';
import 'SCR/reports.dart';
// import 'SCR/test2.dart';
// import 'SCR/testscr.dart';
import 'Translation/Trans.dart';

import 'controllers/allBanksController.dart';
import 'controllers/allCategoriesController.dart';
import 'controllers/allChequesController.dart';
import 'controllers/allCustomersControllers.dart';
import 'controllers/allItemsController.dart';
import 'controllers/allStockItemsController.dart';
import 'controllers/cartItemController.dart';
import 'controllers/employeDataController.dart';
import 'controllers/employeePermissionsController.dart';
import 'controllers/priceListsInfoController.dart';
import 'controllers/salesOrderController.dart';
import 'controllers/userDataController.dart';
import 'network/binding/network_binding.dart';
void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var box = GetStorage();
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
      home:  Login()//Reports()//ProductsScr()//OrderStatusdetails()// OrderStatus()//Login()//Filter()//BeforeAndAfter()// CashPay()//Login()//Printer1()// CashPay()//Home()//Login()//Bill()//All_Customer()//Dashboard()//Login()// Products_Expand()//Products()//All_Customer()//,
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


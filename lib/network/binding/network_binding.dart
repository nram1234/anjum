import 'package:anjum/controllers/allBanksController.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/allCustomersControllers.dart';
import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/allStockItemsController.dart';
import 'package:anjum/controllers/all_routes.dart';
import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/controllers/employeDataController.dart';
import 'package:anjum/controllers/employeePermissionsController.dart';
import 'package:anjum/controllers/priceListsInfoController.dart';
import 'package:anjum/controllers/salesOrderController.dart';
import 'package:anjum/controllers/unitController.dart';
import 'package:anjum/controllers/userDataController.dart';
import 'package:anjum/network/controllers/network_controller.dart';
import 'package:get/get.dart';

class NetWorkBinding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut<NetWorkController>(() => NetWorkController());




     Get.lazyPut(() => UnitController());
     Get.lazyPut(() => UserDataController());
     Get.lazyPut(() => AllBanksController());
     // Get.lazyPut(() => AllCategoriesController(),fenix: true);
     Get.lazyPut(() => AllChequesController());
     Get.lazyPut(() => AllCustomersControllers());

     Get.lazyPut(() => AllStockItemsController());

     Get.lazyPut(() => EmployeDataController());
     Get.lazyPut(() => EmployeePermissionsController());

     Get.lazyPut(() => SalesOrderController());
     Get.lazyPut(() => UserDataController());
     Get.lazyPut(() => AllItemsController());

     Get.lazyPut(() => CartItemController());
     Get.lazyPut(() => PriceListsInfoController());
     Get.lazyPut(() => All_routesController());
  }

}
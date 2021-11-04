import 'package:flutter/material.dart';
import 'package:anjum/SCR/login.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'DB/hivee/not_complete_order.dart';
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
import 'SCR/new/getalldatafromweb.dart';
import 'SCR/new/teestHive.dart';
import 'SCR/printer-1.dart';
import 'SCR/products.dart';
import 'SCR/products_Expand.dart';
import 'SCR/reports.dart';

import 'Translation/Trans.dart';

import 'controllers/allBanksController.dart';
import 'controllers/allCategoriesController.dart';
import 'controllers/allChequesController.dart';
import 'controllers/allCustomersControllers.dart';
import 'controllers/allItemsController.dart';
import 'controllers/allStockItemsController.dart';
import 'controllers/all_promotionsController.dart';
import 'controllers/all_routes.dart';
import 'controllers/cartItemController.dart';
import 'controllers/currencie_controller.dart';
import 'controllers/employeDataController.dart';
import 'controllers/employeePermissionsController.dart';
import 'controllers/itemUnits_controller.dart';
import 'controllers/myProdectListController.dart';
import 'controllers/priceListsInfoController.dart';
import 'controllers/salesOrderController.dart';
import 'controllers/userAndpermissions.dart';
import 'controllers/userDataController.dart';
import 'network/binding/network_binding.dart';
import 'network/controllers/network_controller.dart';
import 'network/json/login_json.dart';
import 'network/jsonofnwetry/get_Fifth_step_json.dart';
import 'network/jsonofnwetry/get_first_step_json.dart';
import 'network/jsonofnwetry/get_fourth_step_json.dart';
import 'network/jsonofnwetry/get_third_step_json.dart';
import 'network/newjosomnLast/get_second_step1_json.dart';
import 'network/newjosomnLast/get_second_step2_json.dart';
import 'network/newjosomnLast/get_second_step3_json.dart';
void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  var dir= await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter( NotCompleteorderAdapter(),  );

 //await Hive.openBox("NotCompleteorder");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var box = GetStorage();
  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());
  Get_first_step_json get_first_step_json;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var get_first_step_json=box.read('get_first_step');

if(get_first_step_json!=null){
  ifhaveinternetornot();
}

    var token= box.read('token' );
if(token!=null){
  User user =User.fromJson(box.read('userAnd'));
  Permissions permissions=Permissions.fromJson( box.read('permissions' ));
  _userAndPermissions.setuser( user);
 // box.write('userAnd', value.user);
 // box.write('permissions', value.permissions);
  _userAndPermissions
      .setPermissions( permissions);
}

    _requestPermission();
    return GetMaterialApp(
      locale: LocalizationService.locale,
      translations: LocalizationService(),
      fallbackLocale: LocalizationService.fallbackLocale,debugShowCheckedModeBanner: false,
      title: 'Anjum',
      initialBinding: NetWorkBinding(),
      theme: ThemeData(
          fontFamily: ArabicFonts.Cairo,

        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,),//TtryHive()//
      home:   token==null? Login(): get_first_step_json!=null ?Home():GetAllDataFRomWeb()//Reports()//ProductsScr()//OrderStatusdetails()// OrderStatus()//Login()//Filter()//BeforeAndAfter()// CashPay()//Login()//Printer1()// CashPay()//Home()//Login()//Bill()//All_Customer()//Dashboard()//Login()// Products_Expand()//Products()//All_Customer()//,
    );
  }
  ifhaveinternetornot()async{
    Get_first_step_json.fromJson(box.read('get_first_step'))  ;
      Get_first_step_json get_first_step_json= Get_first_step_json.fromJson(box.read('get_first_step'))  ;
      if(get_first_step_json!=null ) {
        get_first_step_json =
        await Get_first_step_json.fromJson(box.read('get_first_step'));
        Get.find<EmployeePermissionsController>()
            .updateemployeePermissionsData(
            get_first_step_json.result.employeePermissions);
        print(get_first_step_json.result.allRoutes);

        Get.find<EmployeDataController>()
            .updateemployeDatasData(get_first_step_json.result.employeData);
        //===========================================================
        Get_second_step1_json get_second_step1 = await Get_second_step1_json
            .fromJson(box.read('get_second_step1'));
        Get.find<AllCustomersControllers>()
            .updateallCustomers(get_second_step1.result.allCustomers);
        //===========================================================
        Get_second_step2_json get_second_step2 = await Get_second_step2_json
            .fromJson(box.read('get_second_step2'));
        Get.find<PriceListsInfoController>().updatepriceListMap(
            priceListsInfo: get_second_step2.result.priceListsInfo);
        //===========================================================
        Get_second_step3_json get_second_step3 = await Get_second_step3_json
            .fromJson(box.read('get_second_step3'));
        get_second_step3.result.itemUnits;

        Get.find<ItemUnitsController>().updateitemUnitstMap(
            list: get_second_step3.result.itemUnits);

        //===========================================================
        Get_second_step1_json get_second_step_json = await Get_second_step1_json
            .fromJson(box.read('get_second_step1'));
        Get.find<AllCustomersControllers>()
            .updateallCustomers(get_second_step_json.result.allCustomers);
        //===========================================================
        Get_third_step_json get_third_step_json = await Get_third_step_json
            .fromJson(box.read('get_third_step'));

        Get.find<AllItemsController>()
            .updateallItemsData(get_third_step_json.result.allItems);
        Get.find<AllCategoriesController>()
            .updateallCategoriesData(
            get_third_step_json.result.allCategories);
        Get.find<SalesOrderController>()
            .updatesalesOrderData(get_third_step_json.result.salesOrder);
        //===========================================================
        Get_fourth_step_json get_fourth_step_json = await Get_fourth_step_json
            .fromJson(box.read('get_fourth_step'));
        Get.find<UserDataController>().updateserData(get_fourth_step_json.result.userData);
        Get.find<CurenceController>().setallCurrencie(
            get_fourth_step_json.result.allCurrencies);
        Get.find<AllChequesController>()
            .updateallChequesData(get_fourth_step_json.result.allCheques);
        Get.find<AllBanksController>().updateallBanksData(
            get_fourth_step_json.result.allBanks);
        //===========================================================
        Get_Fifth_step_json get_fifth_step_json = await Get_Fifth_step_json
            .fromJson(box.read('get_Fifth_step'));
        print('allStockItems ${ get_fifth_step_json.result.allStockItems}');
        Get.find<All_PromotionsController>()
            .allPromotionsUpdat(get_fifth_step_json.result.allPromotions);
        Get.find<AllStockItemsController>()
            .updateallStockItemsData(
            get_fifth_step_json.result.allStockItems);



        Get.find<All_routesController>()
            .updateAllRoutes(get_first_step_json.result.allRoutes);
        Get.find<MyProdectListController>().myoninit();}

  }
  _requestPermission() async {

    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }


}


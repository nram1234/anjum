import 'package:anjum/controllers/allBanksController.dart';
import 'package:anjum/controllers/allCategoriesController.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/allCustomersControllers.dart';
import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/allStockItemsController.dart';
import 'package:anjum/controllers/all_promotionsController.dart';
import 'package:anjum/controllers/all_routes.dart';
import 'package:anjum/controllers/currencie_controller.dart';
import 'package:anjum/controllers/employeDataController.dart';
import 'package:anjum/controllers/employeePermissionsController.dart';
import 'package:anjum/controllers/itemUnits_controller.dart';
import 'package:anjum/controllers/myProdectListController.dart';
import 'package:anjum/controllers/priceListsInfoController.dart';
import 'package:anjum/controllers/salesOrderController.dart';
import 'package:anjum/controllers/unitController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/controllers/userDataController.dart';
import 'package:anjum/network/controllers/network_controller.dart';
import 'package:anjum/network/jsonofnwetry/get_Fifth_step_json.dart';
import 'package:anjum/network/jsonofnwetry/get_first_step_json.dart';
import 'package:anjum/network/jsonofnwetry/get_fourth_step_json.dart';

import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:anjum/network/newjosomnLast/get_second_step1_json.dart';
import 'package:anjum/network/newjosomnLast/get_second_step2_json.dart';
import 'package:anjum/network/newjosomnLast/get_second_step3_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../home.dart';

class GetAllDataFRomWeb extends StatefulWidget {
  const GetAllDataFRomWeb({Key key}) : super(key: key);

  @override
  _GetAllDataFRomWebState createState() => _GetAllDataFRomWebState();
}

class _GetAllDataFRomWebState extends State<GetAllDataFRomWeb> {
  bool get_first = false;
  bool get_second_step = false;
  bool get_third_step = false;
  bool get_fourth_step = false;
  bool get_Fifth_step = false;
  bool get_six = false;
  bool get_seven = false;
  bool get_eght = false;
  bool get_neghn = false;
bool getdata=false;
  AllNetworking _allNetworking = AllNetworking();
  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());

  AllCategoriesController allCategoriesController =
      Get.put(AllCategoriesController(), permanent: true);
  int userId;

//  _userAndPermissions.user.id.toString()
  var box = GetStorage();

  @override
  Future<void> initState() {
    super.initState();
    userId = _userAndPermissions.user.id;

    ifhaveinternetornot();
  }

  ifhaveinternetornot() async {
    if (!Get.find<NetWorkController>().connectionStatus.value) {
      Get_first_step_json get_first_step_json =
          await Get_first_step_json.fromJson(box.read('get_first_step'));
      if (get_first_step_json != null) {
        Get.find<EmployeePermissionsController>().employeePermissions.clear();
        Get.find<EmployeePermissionsController>().updateemployeePermissionsData(
            get_first_step_json.result.employeePermissions);

        //
        // Get.find<All_routesController>().allRoutes.clear();
        // Get.find<All_routesController>().mapOfCustomar.clear();
        // Get.find<All_routesController>().routMaptoshw.clear();
        // Get.find<All_routesController>().routMap.clear();


        Get.find<EmployeDataController>()
            .updateemployeDatasData(get_first_step_json.result.employeData);
        //===========================================================
        Get_second_step1_json get_second_step1 =
            await Get_second_step1_json.fromJson(box.read('get_second_step1'));
        //Get.find<AllCustomersControllers>().allCustomers.clear();
        Get.find<AllCustomersControllers>()
            .updateallCustomers(get_second_step1.result.allCustomers);
        //===========================================================
        Get_second_step2_json get_second_step2 =
            await Get_second_step2_json.fromJson(box.read('get_second_step2'));
        Get.find<PriceListsInfoController>().updatepriceListMap(
            priceListsInfo: get_second_step2.result.priceListsInfo);
        //===========================================================
        Get_second_step3_json get_second_step3 =
            await Get_second_step3_json.fromJson(box.read('get_second_step3'));
        get_second_step3.result.itemUnits;

        Get.find<ItemUnitsController>()
            .updateitemUnitstMap(list: get_second_step3.result.itemUnits);

        //===========================================================
        Get_second_step1_json get_second_step_json =
            await Get_second_step1_json.fromJson(box.read('get_second_step1'));
        Get.find<AllCustomersControllers>()
            .updateallCustomers(get_second_step_json.result.allCustomers);
        //===========================================================
        Get_third_step_json get_third_step_json =
            await Get_third_step_json.fromJson(box.read('get_third_step'));

        Get.find<AllItemsController>()
            .updateallItemsData(get_third_step_json.result.allItems);
        Get.find<AllCategoriesController>()
            .updateallCategoriesData(get_third_step_json.result.allCategories);
        Get.find<SalesOrderController>()
            .updatesalesOrderData(get_third_step_json.result.salesOrder);
        //===========================================================
        Get_fourth_step_json get_fourth_step_json =
            await Get_fourth_step_json.fromJson(box.read('get_fourth_step'));

        Get.find<CurenceController>()
            .setallCurrencie(get_fourth_step_json.result.allCurrencies);
        Get.find<AllChequesController>()
            .updateallChequesData(get_fourth_step_json.result.allCheques);
        Get.find<AllBanksController>()
            .updateallBanksData(get_fourth_step_json.result.allBanks);
        //===========================================================
        Get_Fifth_step_json get_fifth_step_json =
            await Get_Fifth_step_json.fromJson(box.read('get_Fifth_step'));

        Get.find<All_PromotionsController>()
            .allPromotionsUpdat(get_fifth_step_json.result.allPromotions);
        Get.find<AllStockItemsController>()
            .updateallStockItemsData(get_fifth_step_json.result.allStockItems);
        Get.find<All_routesController>()
            .updateAllRoutes(get_first_step_json.result.allRoutes);

      Get.find<MyProdectListController>().myoninit();}
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        bottom: true,
        top: true,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  itemInList(
                      lod: get_first,
                      titl: 'permissions and route',
                      fun: () async {
                        _allNetworking
                            .get_first_step(user_id: userId)
                            .then((value) async {
                          Get.find<All_routesController>()
                              .updateAllRoutes(value.result.allRoutes);

                          Get.find<EmployeDataController>()
                              .updateemployeDatasData(value.result.employeData);
                          Get.find<EmployeePermissionsController>()
                              .updateemployeePermissionsData(
                                  value.result.employeePermissions);

                          await box.write('get_first_step', value);
                          get_first = true;

                          setState(() {});
                        });
                      }),
                  itemInList(
                      lod: get_second_step,
                      titl: 'customers',
                      fun: () {
                        _allNetworking
                            .get_second_step1(user_id: userId)
                            .then((value) async {
                          // print("v v v v v v v v v v ${value.result.allCustomers}");
                          value.result.allCustomers;
                          Get.find<AllCustomersControllers>()
                              .updateallCustomers(value.result.allCustomers);
                          await box.write('get_second_step1', value);
                          get_second_step = true;
                          setState(() {});
                        });
                      }),
                  itemInList(
                      lod: get_third_step,
                      titl: 'price list',
                      fun: () {
                        _allNetworking
                            .get_second_step2(user_id: userId)
                            .then((value) async {
                          value.result.priceListsInfo;
                          Get.find<PriceListsInfoController>()
                              .updatepriceListMap(
                                  priceListsInfo: value.result.priceListsInfo);
                          await box.write('get_second_step2', value);
                          get_third_step = true;
                          setState(() {});
                        });
                      }),
                  itemInList(
                      lod: get_fourth_step,
                      titl: 'items unit',
                      fun: () {
                        _allNetworking
                            .get_second_step3(user_id: userId)
                            .then((value) async {
                          value.result.itemUnits;
                          value.result.itemUnits;
                          Get.find<ItemUnitsController>().updateitemUnitstMap(
                              list: value.result.itemUnits);
                          await box.write('get_second_step3', value);
                          get_fourth_step = true;
                          setState(() {});
                        });
                      }),

                  itemInList(
                      lod: get_six,
                      titl: 'items and category',
                      fun: () {
                        _allNetworking
                            .get_third_step(user_id: userId)
                            .then((value) async {
                          Get.find<AllItemsController>()
                              .updateallItemsData(value.result.allItems);
                          Get.find<AllCategoriesController>()
                              .updateallCategoriesData(
                                  value.result.allCategories);
                          Get.find<SalesOrderController>()
                              .updatesalesOrderData(value.result.salesOrder);
                          await box.write('get_third_step', value);
                          get_six = true;
                          setState(() {});
                        });
                      }),
                  itemInList(
                      lod: get_seven,
                      titl: 'user, currency info',
                      fun: () {
                        _allNetworking
                            .get_fourth_step(user_id: userId)
                            .then((value) async {
                          // value.result.allCurrencies;
                          // value.result.allCheques;
                          // value.result.allBanks;

                          Get.find<UserDataController>()
                              .updateserData(value.result.userData);
                          Get.find<CurenceController>()
                              .setallCurrencie(value.result.allCurrencies);
                          Get.find<AllChequesController>()
                              .updateallChequesData(value.result.allCheques);
                          Get.find<AllBanksController>()
                              .updateallBanksData(value.result.allBanks);
                          await box.write('get_fourth_step', value);
                          get_seven = true;
                          setState(() {});
                        });
                      }),
                  itemInList(
                      lod: get_eght,
                      titl: 'items quantity',
                      fun: () {
                        _allNetworking
                            .get_Fifth_step(user_id: userId)
                            .then((value) async {
                          value.result.allPromotions;
                          value.result.allStockItems;

                          Get.find<All_PromotionsController>()
                              .allPromotionsUpdat(value.result.allPromotions);
                          Get.find<AllStockItemsController>()
                              .updateallStockItemsData(
                                  value.result.allStockItems);
                          await box.write('get_Fifth_step', value);
                          get_eght = true;
                          setState(() {});
                        });
                      }),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.off(() => Home());
                      },
                      child: Container(
                        height: 50,
                        width: size.width * .4,
                        decoration: BoxDecoration(
                          color: Color(0xff2C4B89),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          'التالي',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                      ),
                    ),
                  )
                  ,Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: InkWell(onTap: ()async{
                        getdata=true;
                        setState(() {

                        });
                     await   _allNetworking
                            .get_first_step(user_id: userId)
                            .then((value) async {
                          Get.find<All_routesController>()
                              .updateAllRoutes(value.result.allRoutes);

                          Get.find<EmployeDataController>()
                              .updateemployeDatasData(value.result.employeData);
                          Get.find<EmployeePermissionsController>()
                              .updateemployeePermissionsData(
                              value.result.employeePermissions);

                          await box.write('get_first_step', value);
                          get_first = true;

                          setState(() {});
                        });
                     ///=========================================================
                        await  _allNetworking
                            .get_second_step1(user_id: userId)
                            .then((value) async {
                          // print("v v v v v v v v v v ${value.result.allCustomers}");
                          value.result.allCustomers;
                          Get.find<AllCustomersControllers>()
                              .updateallCustomers(value.result.allCustomers);
                          await box.write('get_second_step1', value);
                          get_second_step = true;
                          setState(() {});
                        });
                        ///============================================
                        await   _allNetworking
                            .get_second_step2(user_id: userId)
                            .then((value) async {
                          value.result.priceListsInfo;
                          Get.find<PriceListsInfoController>()
                              .updatepriceListMap(
                              priceListsInfo: value.result.priceListsInfo);
                          await box.write('get_second_step2', value);
                          get_third_step = true;
                          setState(() {});
                        });
                        ///==============================================
                     await    _allNetworking
                         .get_fourth_step(user_id: userId)
                         .then((value) async {
                       // value.result.allCurrencies;
                       // value.result.allCheques;
                       // value.result.allBanks;

                       Get.find<UserDataController>()
                           .updateserData(value.result.userData);
                       Get.find<CurenceController>()
                           .setallCurrencie(value.result.allCurrencies);
                       Get.find<AllChequesController>()
                           .updateallChequesData(value.result.allCheques);
                       Get.find<AllBanksController>()
                           .updateallBanksData(value.result.allBanks);
                       await box.write('get_fourth_step', value);
                       get_seven = true;
                       setState(() {});
                     });
                     ///================================================
                        ///

                        await  _allNetworking
                            .get_second_step3(user_id: userId)
                            .then((value) async {
                          value.result.itemUnits;
                          value.result.itemUnits;
                          Get.find<ItemUnitsController>().updateitemUnitstMap(
                              list: value.result.itemUnits);
                          await box.write('get_second_step3', value);
                          get_fourth_step = true;
                          setState(() {});
                        });

                        ///=====================================
                        await    _allNetworking
                            .get_third_step(user_id: userId)
                            .then((value) async {

                          Get.find<AllItemsController>()
                              .updateallItemsData(value.result.allItems);
                          Get.find<AllCategoriesController>()
                              .updateallCategoriesData(
                              value.result.allCategories);
                          Get.find<SalesOrderController>()
                              .updatesalesOrderData(value.result.salesOrder);
                          await box.write('get_third_step', value);
                          get_six = true;
                          setState(() {});
                        });
                        ///=====================================
                        await      _allNetworking
                            .get_fourth_step(user_id: userId)
                            .then((value) async {
                          // value.result.allCurrencies;
                          // value.result.allCheques;
                          // value.result.allBanks;

                          Get.find<UserDataController>()
                              .updateserData(value.result.userData);
                          Get.find<CurenceController>()
                              .setallCurrencie(value.result.allCurrencies);
                          Get.find<AllChequesController>()
                              .updateallChequesData(value.result.allCheques);
                          Get.find<AllBanksController>()
                              .updateallBanksData(value.result.allBanks);
                          await box.write('get_fourth_step', value);
                          get_seven = true;
                          setState(() {});
                        });
                        ///===================================
                        await      _allNetworking
                            .get_Fifth_step(user_id: userId)
                            .then((value) async {
                          value.result.allPromotions;
                          value.result.allStockItems;
print( value.result.allStockItems);
                          print( value.result.allPromotions);
                          Get.find<All_PromotionsController>()
                              .allPromotionsUpdat(value.result.allPromotions);
                          Get.find<AllStockItemsController>()
                              .updateallStockItemsData(
                              value.result.allStockItems);
                          await box.write('get_Fifth_step', value);
                          get_eght = true;
                          setState(() {});
                        });
                        },
                        child: Container(
                          height: 50,
                          width: size.width * .4,
                          decoration: BoxDecoration(
                            color: Color(0xff2C4B89),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                                'تحديث',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget itemInList({String titl, fun, lod}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
          //  onTap: fun,
            child:  getdata==true&& lod==false?CircularProgressIndicator():Icon(
                  lod ? Icons.check : Icons.close,
              color: lod ? Colors.green : Colors.grey,
              size: 50,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            titl,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}

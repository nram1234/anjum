import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/tabelname/insert_journeys_DB.dart';
import 'package:anjum/SCR/printer-1.dart';
import 'package:anjum/SCR/reports.dart';

import 'package:anjum/controllers/allBanksController.dart';
import 'package:anjum/controllers/allCategoriesController.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/allCustomersControllers.dart';
import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/allStockItemsController.dart';
import 'package:anjum/controllers/all_promotionsController.dart';
import 'package:anjum/controllers/all_routes.dart';
import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/controllers/currencie_controller.dart';
import 'package:anjum/controllers/employeDataController.dart';
import 'package:anjum/controllers/employeePermissionsController.dart';
import 'package:anjum/controllers/myProdectListController.dart';
import 'package:anjum/controllers/priceListsInfoController.dart';
import 'package:anjum/controllers/salesOrderController.dart';
import 'package:anjum/controllers/unitController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/controllers/userDataController.dart';
import 'package:anjum/network/controllers/network_controller.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:anjum/utilitie/utilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:path_provider/path_provider.dart';

import 'OrderStatus.dart';
import 'all _customer.dart';
import 'dashboard.dart';
import 'login.dart';
import 'new/Catalog.dart';
import 'new/Promotion List.dart';
import 'new/TimeLine.dart';
import 'new/getalldatafromweb.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AllNetworking _allNetworking = AllNetworking();

  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());
  bool updatethedata = false;
  bool showupdatethedata = false;

  AllCategoriesController allCategoriesController =
      Get.put(AllCategoriesController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print( 'languageCode   ${Get.locale.languageCode}');
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Exit".tr),
                content: Text('exitm'.tr),
                actions: <Widget>[
                  FlatButton(
                    child: Text("YES".tr),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  FlatButton(
                    child: Text("NO".tr),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        return Future.value(true);
      },
      child: Scaffold(
          body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
                height: size.height * .3,
                width: size.width,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bk.png',
                      width: size.width,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        left: size.width * .1,
                        top: size.height * .05,
                        child: CachedNetworkImage(  height: 75,
                          width: 75,
                          imageUrl: _userAndPermissions.user.image,//imageBuilder: (context, imageprovider) =>Container(),
                          placeholder: (context, url) => Center(
                            child: Text(". . . "),
                          ),
                        )

                        // Image.network(
                        //   _userAndPermissions.user.image,
                        //   height: 75,
                        //   width: 75,
                        // )

                        ),
                    Positioned(
                        left: (size.width * .1) + 80,
                        top: size.height * .06,
                        child: Text(
                          _userAndPermissions.user.username,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ],
                )),
            Positioned(
                right: 0,
                left: 0,
                top: size.height * .2,
                child: Container(
                  height: size.height * .8,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                startJourney = !startJourney;
                                print(startJourney);
                                if (startJourney) {
                                  getMyLoction(firesjornytlocation);
                                  jornystartTime = DateTime.now();
                                  setState(() {});
                                  Get.to(() => All_Customer());
                                } else {
                                  setState(() {});
                                  jornyEndTime = DateTime.now();
                                  getMyLoction(endjornylocation);
                                  DatabaseHelper()
                                      .insert_insert_journeys(Insert_journeys_DB(
                                          user_id: _userAndPermissions.user.id
                                              .toString(),
                                          start_date: jornystartTime.toString(),
                                          end_date: jornyEndTime.toString(),
                                          start_lang: firesjornytlocation == null
                                              ? ""
                                              : firesjornytlocation.longitude
                                                  .toString(),
                                          start_lat: firesjornytlocation == null
                                              ? ""
                                              : firesjornytlocation.latitude
                                                  .toString(),
                                          end_lang: endjornylocation == null
                                              ? ""
                                              : endjornylocation.longitude
                                                  .toString(),
                                          end_lat: endjornylocation == null
                                              ? ""
                                              : endjornylocation.latitude
                                                  .toString()))
                                      .then((value) {
                                    print(value);
                                  });
                                }
                              },
                              child:
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        startJourney
                                            ? 'endofJourney'.tr
                                            : 'startofJourney'.tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Image.asset('assets/images/van.png'),
                                    ],
                                  ),
                                ),
                                width: size.width * .7,
                                height: size.height * .08,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            InkWell(onTap: (){
                              Get.to(()=>GetAllDataFRomWeb())   ;                         },child: Container(
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                   'update'.tr,

                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              width: size.width * .25,
                              height: size.height * .08,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                            ),)
                          ],
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => OrderStatus());
                              },
                              child: item(
                                  color: Colors.orange[200],
                                  size: size,
                                  name: 'OrdersStatus'.tr,
                                  path: 'assets/images/box.png'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => TimeLine());
                              },
                              child: item(
                                  color: Colors.red[200],
                                  size: size,
                                  name: 'timeline'.tr,
                                  path: 'assets/images/g.png'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => Catalog());
                              },
                              child: item(
                                  color: Colors.cyan[200],
                                  size: size,
                                  name: 'catalog'.tr,
                                  path: 'assets/images/catalog.png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(onTap: (){
                              Get.to(()=>PromotionList());
                            },
                              child: item(
                                  color: Colors.purpleAccent[200],
                                  size: size,
                                  name: 'Promotion'.tr,
                                  path: 'assets/images/promotion.png'),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => Reports());
                              },
                              child: item(
                                  color: Colors.cyan[200],
                                  size: size,
                                  name: 'report'.tr,
                                  path: 'assets/images/report.png'),
                            ),
                            GestureDetector(
                              onTap: () async {
                                //    Get.to(Printer1());
                                var boxx = GetStorage();
print('ooooooooooooooooooooooooooooooooooooooooooooooooooooo');
                                print(boxx.read("key"));
                                print(boxx.read("userAnd"));
                                print(boxx.read("permissions"));
                                print('ooooooooooooooooooooooooooooooooooooooooooooooooooooo');
                              },
                              child: item(
                                  color: Colors.orange[200],
                                  size: size,
                                  name: 'printers'.tr,
                                  path: 'assets/images/printer1.png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(onTap: (){
                                var box = GetStorage();
                                 box.remove('token' );
                                 Get.offAll(()=>Login());
                              },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green[200].withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  width: size.width * .62,
                                  height: size.height * .2,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          'assets/images/log.png',
                                          height: size.height * .07,
                                          width: size.height * .07,
                                          color: Colors.green,
                                        ),
                                        Text(
                                          'logout',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: item(
                                    color: Colors.grey[500],
                                    size: size,
                                    name: 'reprint'.tr,
                                    path: 'assets/images/reprint.png'),
                              ),

//                             GestureDetector(
//                               onTap: () {
//                                 //_userAndPermissions.user.id.toString()
//
// //                                 _allNetworking.tesyyt().then((value) {
// //                                   print(value.body);
// //                                 });
//                               },
//                               child: item(
//                                   color: Colors.cyan[200],
//                                   size: size,
//                                   name: 'update',
//                                   path: 'assets/images/report.png'),
//                             ),
//                             GestureDetector(
//                               onTap: () {},
//                               child: item(
//                                   color: Colors.cyan[200],
//                                   size: size,
//                                   name: 'logout',
//                                   path: 'assets/images/log.png'),
//                             ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      )),
    );
  }

//  Box box;
//
//   Future openBox() async {
//     var dir = await getApplicationDocumentsDirectory();
//     Hive.init(dir.path);
//     box = await Hive.openBox('data');
//   }

  @override
  void initState() {
    super.initState();
      Get.find<NetWorkController>()
        .initConnctivity();

    // if (!Get.find<NetWorkController>()
    //     .connectionStatus
    //     .value){
    //   var box = GetStorage();
    //   // Get_employee_data_json value=Get_employee_data_json.fromJson(box.read("key"));
    //   Get.find<All_PromotionsController>()
    //       .allPromotionsUpdat(value.result.allPromotions);
    //
    //   Get.find<AllCustomersControllers>()
    //       .updateallCustomers(value.result.allCustomers);
    //   Get.find<UserDataController>().updateserData(value.result.userData);
    //
    //   Get.find<AllBanksController>().updateallBanksData(value.result.allBanks);
    //
    //
    //
    //   print(value.result.allCategories.length);
    //   print(value.result.allCategories);
    //
    //
    //
    //   Get.find<CurenceController>().setallCurrencie(value.result.allCurrencies);
    //
    //   allCategoriesController
    //       .updateallCategoriesData(value.result.allCategories);
    //
    //   Get.find<AllChequesController>()
    //       .updateallChequesData(value.result.allCheques);
    //
    //   Get.find<AllCustomersControllers>()
    //       .updateallCustomers(value.result.allCustomers);
    //
    //   Get.find<AllStockItemsController>()
    //       .updateallStockItemsData(value.result.allStockItems);
    //
    //   Get.find<AllCategoriesController>()
    //       .updateallCategoriesData(value.result.allCategories);
    //   Get.find<All_routesController>().updateAllRoutes(value.result.allRoutes);
    //   Get.find<EmployeDataController>()
    //       .updateemployeDatasData(value.result.employeData);
    //
    //   Get.find<EmployeePermissionsController>()
    //       .updateemployeePermissionsData(value.result.employeePermissions);
    //
    //   Get.find<SalesOrderController>()
    //       .updatesalesOrderData(value.result.salesOrder);
    //
    //   Get.find<AllItemsController>().updateallItemsData(value.result.allItems);
    // }



//     _allNetworking.Get_employee_data(
//             user_id: _userAndPermissions.user.id.toString())
//         .then((value) async {
//       // await openBox();
//       // await box.clear();
//       // print(box.isOpen);
// //box.add(value);
//
//       //insert to database
//       Get.find<All_PromotionsController>()
//           .allPromotionsUpdat(value.result.allPromotions);
//
//       Get.find<AllCustomersControllers>()
//           .updateallCustomers(value.result.allCustomers);
//       Get.find<UserDataController>().updateserData(value.result.userData);
//       Get.find<AllBanksController>().allBanks.clear();
//       Get.find<AllBanksController>().updateallBanksData(value.result.allBanks);
//
//       // Get.find<AllCategoriesController>()
//       //     .allCategories
//       //     .clear();
//       // Get.find<AllCategoriesController>()
//       //     .updateallCategoriesData(
//       //         value.result.allCategories);
//       allCategoriesController.allCategories.clear();
//       print('00000000000000000000000000000000000');
//
//       print(value.result.allCategories.length);
//       print(value.result.allCategories);
//
//       print('00000000000000000000000000000000000');
//
//       Get.find<CurenceController>().setallCurrencie(value.result.allCurrencies);
//
//       allCategoriesController
//           .updateallCategoriesData(value.result.allCategories);
//
//       Get.find<AllChequesController>()
//           .updateallChequesData(value.result.allCheques);
//
//       Get.find<AllCustomersControllers>()
//           .updateallCustomers(value.result.allCustomers);
//
//       Get.find<AllStockItemsController>()
//           .updateallStockItemsData(value.result.allStockItems);
//
//       Get.find<AllCategoriesController>()
//           .updateallCategoriesData(value.result.allCategories);
//       Get.find<All_routesController>().updateAllRoutes(value.result.allRoutes);
//       Get.find<EmployeDataController>()
//           .updateemployeDatasData(value.result.employeData);
//
//       Get.find<EmployeePermissionsController>()
//           .updateemployeePermissionsData(value.result.employeePermissions);
//
//       Get.find<SalesOrderController>()
//           .updatesalesOrderData(value.result.salesOrder);
//
//       Get.find<AllItemsController>().updateallItemsData(value.result.allItems);
//
//       updatethedata = true;
//       print(value.result.allItems);
//     });
  }

  Widget item({String path, String name, size, Color color}) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: size.width * .3,
      height: size.height * .2,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              path,
              height: size.height * .1,
              width: size.height * .1,
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: color),
          )
        ],
      ),
    );
  }
}

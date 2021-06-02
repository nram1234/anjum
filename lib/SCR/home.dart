import 'package:anjum/SCR/printer-1.dart';
import 'package:anjum/controllers/allBanksController.dart';
import 'package:anjum/controllers/allCategoriesController.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/allCustomersControllers.dart';
import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/allStockItemsController.dart';
import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/controllers/employeDataController.dart';
import 'package:anjum/controllers/employeePermissionsController.dart';
import 'package:anjum/controllers/priceListsInfoController.dart';
import 'package:anjum/controllers/salesOrderController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/controllers/userDataController.dart';
import 'package:anjum/network/controllers/network_controller.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'OrderStatus.dart';
import 'all _customer.dart';
import 'dashboard.dart';
import 'new/TimeLine.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AllNetworking _allNetworking = AllNetworking();

  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());
  bool updatethedata = false;
  bool showupdatethedata = false;

  AllCategoriesController allCategoriesController = Get.put(AllCategoriesController(),permanent: true);
  @override
  Widget build(BuildContext context) {


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

    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                      child: Image.network(
                        _userAndPermissions.user.image,
                        height:75,
                        width:75,
                      )),
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
                      InkWell(
                        onTap: () {
                          Get.to(All_Customer());
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Start of Journey',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Image.asset('assets/images/van.png'),
                              ],
                            ),
                          ),
                          width: size.width * .9,
                          height: size.height * .08,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(onTap: (){
                            Get.to(OrderStatus());
                          },
                            child: item(
                                color: Colors.orange[200],
                                size: size,
                                name: 'Orders Status',
                                path: 'assets/images/box.png'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(TimeLine());
                            },
                            child: item(
                                color: Colors.red[200],
                                size: size,
                                name: 'Timeline',
                                path: 'assets/images/g.png'),
                          ),
                          item(
                              color: Colors.cyan[200],
                              size: size,
                              name: 'Catalog',
                              path: 'assets/images/catalog.png'),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          item(
                              color: Colors.purpleAccent[200],
                              size: size,
                              name: 'Promotion List',
                              path: 'assets/images/promotion.png'),
                          GestureDetector(
                            onTap: () {},
                            child: item(
                                color: Colors.cyan[200],
                                size: size,
                                name: 'Report',
                                path: 'assets/images/report.png'),
                          ),
                          GestureDetector(onTap: (){
                            Get.to(Printer1());
                          },
                            child: item(
                                color: Colors.orange[200],
                                size: size,
                                name: 'printers',
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
                            //   Container(
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     color: Colors.white,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.pink[200].withOpacity(0.5),
                            //         spreadRadius: 5,
                            //         blurRadius: 7,
                            //         offset:
                            //         Offset(0, 3), // changes position of shadow
                            //       ),
                            //     ],
                            //   ),
                            //   width: size.width * .3,
                            //   height: size.height * .2,
                            //   child: Center(
                            //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //       children: [
                            //         Image.asset('assets/images/log.png',height: size.height*.07,width:size.height*.07,color: Colors.green,),
                            //         Text('logout')
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () {},
                              child: item(
                                  color: Colors.grey[500],
                                  size: size,
                                  name: 'Reprint',
                                  path: 'assets/images/reprint.png'),
                            ),

                            GestureDetector(
                              onTap: () {
                                //_userAndPermissions.user.id.toString()
                                _allNetworking.Get_employee_data(
                                        user_id: _userAndPermissions.user.id.toString())
                                    .then((value) {
                                  //insert to database

                                  print(value);
                                  Get.find<UserDataController>().userData.clear();
                                  Get.find<UserDataController>()
                                      .updateserData(value.result.userData);
                                  Get.find<AllBanksController>().allBanks.clear();
                                  Get.find<AllBanksController>().updateallBanksData(
                                      value.result.allBanks);

                                  // Get.find<AllCategoriesController>()
                                  //     .allCategories
                                  //     .clear();
                                  // Get.find<AllCategoriesController>()
                                  //     .updateallCategoriesData(
                                  //         value.result.allCategories);
                                  allCategoriesController.allCategories.clear();
                                  print(value.result.allCategories.length);
                                  print(value.result.allCategories);
                                  allCategoriesController.updateallCategoriesData(value.result.allCategories);


                                  Get.find<AllChequesController>()
                                      .allCheques
                                      .clear();
                                  Get.find<AllChequesController>()
                                      .updateallChequesData(
                                          value.result.allCheques);
                                  Get.find<AllCustomersControllers>()
                                      .allCustomers
                                      .clear();
                                  Get.find<AllCustomersControllers>()
                                      .updateallCustomers(
                                          value.result.allCustomers);
                                  Get.find<AllStockItemsController>()
                                      .allStockItems
                                      .clear();

                                  Get.find<AllStockItemsController>()
                                      .updateallStockItemsData(
                                          value.result.allStockItems);
                                  Get.find<AllCategoriesController>()
                                      .allCategories
                                      .clear();
                                  Get.find<AllCategoriesController>()
                                      .updateallCategoriesData(
                                          value.result.allCategories);
                                  Get.find<EmployeDataController>()
                                      .employeDatas
                                      .clear();
                                  Get.find<EmployeDataController>()
                                      .updateemployeDatasData(
                                          value.result.employeData);
                                  Get.find<EmployeePermissionsController>()
                                      .employeePermissions
                                      .clear();
                                  Get.find<EmployeePermissionsController>()
                                      .updateemployeePermissionsData(
                                          value.result.employeePermissions);

                                  Get.find<SalesOrderController>()
                                      .updatesalesOrderData(
                                          value.result.salesOrder);

                                  Get.find<AllItemsController>()
                                      .allItems
                                      .clear();
                                  Get.find<AllItemsController>()
                                      .updateallItemsData(
                                          value.result.allItems);

                                  updatethedata = true;
                                  print(updatethedata);
                                });
//                                 _allNetworking.tesyyt().then((value) {
//                                   print(value.body);
//                                 });
                              },
                              child: item(
                                  color: Colors.cyan[200],
                                  size: size,
                                  name: 'update',
                                  path: 'assets/images/report.png'),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: item(
                                  color: Colors.cyan[200],
                                  size: size,
                                  name: 'logout',
                                  path: 'assets/images/log.png'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    ));
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

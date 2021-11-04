import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/tabelname/insert_visit_DB.dart';
import 'package:anjum/SCR/photo_screen.dart';
import 'package:anjum/SCR/prodectsTestt.dart';
import 'package:anjum/SCR/products.dart';
import 'package:anjum/SCR/products_Expand.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/currencie_controller.dart';
import 'package:anjum/controllers/employeePermissionsController.dart';
import 'package:anjum/controllers/myProdectListController.dart';
import 'package:anjum/controllers/timeController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/controllers/network_controller.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:anjum/utilitie/invoiceOrSalesOrderOrReturnInvoice.dart';
import 'package:anjum/utilitie/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'all _customer.dart';
import 'cashpayment.dart';
import 'chequepay.dart';
import 'new/BeforeAndAfter.dart';

class Dashboard extends StatefulWidget {
  //var thecustomers = Get.arguments;
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final NetWorkController _controller = Get.put(NetWorkController());
   UserAndPermissions _user = Get.put(UserAndPermissions());
  EmployeePermissionsController _userAndPermissions= Get.put(EmployeePermissionsController());
  final TimeController c = Get.find<TimeController>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // AllCustomers _customers=widget.thecustomers[0];
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Container(
                    height: size.height * .3,
                    width: size.width,
                    color: Colors.blue,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/bk.png',
                          width: size.width,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                            left: size.width * .1,
                            top: size.height * .1,
                            child: Text(
                              'transaction'.tr,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Positioned(
                            right: size.width * .1,
                            top: size.height * .14,
                            child: Text(
                              Get.find<AllChequesController>()
                                  .customer

                                  .customerNameEn,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Positioned(
                            left: size.width * .05,
                            top: size.height * .05,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                            ))
                      ],
                    )),
                Positioned(
                    right: 0,
                    left: 0,
                    top: size.height * .2,
                    child: Container(
                        height: size.height * .7,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30))),
                        child: GetBuilder<TimeController>(builder: (_) {
                          return c.swatch.isRunning
                              ? SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                      if (_controller.connectionStatus.value)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.replay),
                                              Text(
                                                  'Last data sync is 14/04/2021  12:90'),
                                            ],
                                          ),
                                        ),
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                      Wrap(
                                        children: [
                                          if (_userAndPermissions.employeePermissions[0]
                                                  .order ==
                                              'yes')
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  isinvoiceOrSalesOrderOrReturnInvoice =
                                                      'sales';
                                                  if(Get.find<CurenceController>().allCurrencie.length>1){
                                                    Get.find<CurenceController>().showDio(context);
                                                  }else{

                                                    //Get.to(ProductsScr());
                                                     Get.to(ProdectTestt());
                                                  }


                                                },
                                                child: item(
                                                    color: Colors.orange[200],
                                                    size: size,
                                                    name: 'salesorder'.tr,
                                                    path:
                                                        'assets/images/order.png'),
                                              ),
                                            ),
                                          if (_userAndPermissions
                                              .employeePermissions[0].payment ==
                                              'yes')
                                            InkWell(
                                              onTap: () {
                                                Get.bottomSheet(
                                                  Container(
                                                    height: size.height * .2,
                                                    width: size.width * .45,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            'selectpaymentmethod'
                                                                .tr),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Get.to(
                                                                    CashPay());
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(4),
                                                                width:
                                                                    size.width *
                                                                        .4,
                                                                height: 60,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              11.0),
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border
                                                                      .all(
                                                                    width: 1.0,
                                                                    color: const Color(
                                                                        0xFFEBEBEB),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      Text(
                                                                        'cash'
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: 20),
                                                                      ),
                                                                      Image
                                                                          .asset(
                                                                        'assets/images/dollar.png',
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                Get.to(
                                                                    ChequePay());
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(4),
                                                                width:
                                                                    size.width *
                                                                        .4,
                                                                height: 60,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              11.0),
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border
                                                                      .all(
                                                                    width: 1.0,
                                                                    color: const Color(
                                                                        0xFFEBEBEB),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      Text(
                                                                        'cheque'.tr,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: 20),
                                                                      ),
                                                                      Image
                                                                          .asset(
                                                                        'assets/images/ch.png',
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  backgroundColor: Colors.white,
                                                  isDismissible: true,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      side: BorderSide(
                                                          color: Colors.white54,
                                                          style:
                                                              BorderStyle.solid,
                                                          width: 2)),
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: item(
                                                    color: Colors.pink[200],
                                                    size: size,
                                                    name: 'payment'.tr,
                                                    path:
                                                        'assets/images/payment.png'),
                                              ),
                                            ),
                                          if (_userAndPermissions
                                              .employeePermissions[0].returnInvoice ==
                                              'yes')
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  isinvoiceOrSalesOrderOrReturnInvoice =
                                                      'return_invoice';
                                                  if(Get.find<CurenceController>().allCurrencie.length>1){
                                                    Get.find<CurenceController>().showDio(context);
                                                  }else{
                                                    //Get.to(ProductsScr());
                                                    Get.to(ProdectTestt());
                                                  }

                                                  // Get.to(ProductsScr());
                                                },
                                                child: item(
                                                    color: Colors.pink[200],
                                                    size: size,
                                                    name: 'returninvoice'.tr,
                                                    path:
                                                        'assets/images/returninvoice.png'),
                                              ),
                                            ),
                                          if (_userAndPermissions
                                              .employeePermissions[0].invoice ==
                                              'yes')
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  isinvoiceOrSalesOrderOrReturnInvoice =
                                                      'invoice';
                                                 // Get.to(ProductsScr());
                                                  if(Get.find<CurenceController>().allCurrencie.length>1){
                                                    Get.find<CurenceController>().showDio(context);
                                                  }else{
                                                    //Get.to(ProductsScr());
                                                    Get.to(ProdectTestt());
                                                  }


                                                  },
                                                child: item(
                                                    color: Colors
                                                        .purpleAccent[200],
                                                    size: size,
                                                    name: 'invoice'.tr,
                                                    path:
                                                        'assets/images/invoice.png'),
                                              ),
                                            ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: item(
                                                color: Colors.purple[200],
                                                size: size,
                                                name: 'history'.tr,
                                                path:
                                                    'assets/images/history.png'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: item(
                                                color: Colors.lightGreen[200],
                                                size: size,
                                                name: 'SOA',
                                                path: 'assets/images/soaa.png'),
                                          ),
                                          if (_userAndPermissions.employeePermissions[0]
                                                  .beforeAfterPhoto ==
                                              'yes')
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(BeforeAndAfter());
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: item(
                                                    color: Colors.green[200],
                                                    size: size,
                                                    name: 'beforeafter'.tr,
                                                    path:
                                                        'assets/images/befor.png'),
                                              ),
                                            ),
                                          if (_userAndPermissions
                                              .employeePermissions[0].takePhoto ==
                                              'yes')
                                            GestureDetector(   onTap: () {
                                              Get.to(()=>PhotoScreen());
                                            },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: item(
                                                    color: Colors.orange[200],
                                                    size: size,
                                                    name: 'photo'.tr,
                                                    path:
                                                        'assets/images/pic.png'),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.find<TimeController>().startjor();
                                    },
                                    child: Container(
                                      height: size.height * .1,
                                      color: Color(0xff2C4B89),
                                      child: Center(
                                          child: Text(
                                        'startvisit'.tr,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                );
                        }))),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.7),
                          //     spreadRadius: 5,
                          //     blurRadius: 7,
                          //     offset:
                          //     Offset(0, 3), // changes position of shadow
                          //   ),
                          // ],
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                      height: size.height * .1,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15))),
                            height: size.height * .1,
                            width: size.width * .6,
                            child: Center(
                                child: GetX<TimeController>(
                              init: TimeController(),
                              builder: (c) {
                                return Text(c.stoptimedisplay.value);
                              },
                            )),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (!c.swatch.isRunning) {
                                  getMyLoction(firesvisittlocation);

                                  c.startjor();
                                } else {
                                  getMyLoction(endvisittlocation);
                                  DatabaseHelper()
                                      .insert_insert_visit(Insert_visit_DB(
                                    customer_id:
                                        Get.find<AllChequesController>()
                                            .customer

                                            .id,
                                    user_id:
                                        _user.user.id.toString(),
                                  ))
                                      .then((value) {
                                    Get.find<AllChequesController>().customer =
                                        null;
                                  });
                                  c.stopjor();
                                  Get.off( ()=> All_Customer() );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff2C4B89),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15))),
                                height: size.height * .1,
                                child: Center(
                                    child: Obx(() => Text(
                                          c.startswatch.value
                                              ? 'endvisit'.tr
                                              : 'startvisit'.tr,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            )));
  }

  Widget item({String path, String name, size, Color color}) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: size.width * .45,
      height: size.width * .5,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              path,
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color),
          )
        ],
      ),
    );
  }
}

//
//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [

// ],
// ),
// SizedBox(
// height: size.height * .02,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [

// ],
// ),
// SizedBox(
// height: size.height * .02,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [

// ],
// ),
// SizedBox(
// height: size.height * .02,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [

// ],
// ),
// SizedBox(
// height: size.height * .01,
// ),

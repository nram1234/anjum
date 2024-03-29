import 'dart:io';

import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/hivee/not_complete_order.dart';
import 'package:anjum/DB/myModel.dart';
import 'package:anjum/DB/tabelname/item_tabel.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/all_promotionsController.dart';
import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/controllers/currencie_controller.dart';
import 'package:anjum/controllers/employeePermissionsController.dart';
import 'package:anjum/controllers/myProdectListController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/controllers/userDataController.dart';
import 'package:anjum/network/controllers/network_controller.dart';

import 'package:anjum/network/json/insert_invoice_salesorder_json.dart';
import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:anjum/utilitie/invoiceOrSalesOrderOrReturnInvoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'all _customer.dart';
import 'carteditproduct.dart';

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'new/bluetooth_printer_scr.dart';
import 'new/newtrybluth.dart';

class Cart extends StatefulWidget {
  @override
  _CartEditProductState createState() => _CartEditProductState();
}

class _CartEditProductState extends State<Cart> {
  GlobalKey printcart = GlobalKey();
  var box = GetStorage();
  List<Widget> wawawa = [];
  late int orderid;
  AllNetworking _allNetworking = AllNetworking();
  var keysOfMap;
  String Chequetime = "choose date";
  TextEditingController _textEditingController = TextEditingController();
  CartItemController bata = Get.find<CartItemController>();
  DatabaseHelper _databaseHelper = DatabaseHelper();

  UserAndPermissions _userAndPermissions = Get.find<UserAndPermissions>();
  EmployeePermissionsController employeePermissionsController =
      Get.find<EmployeePermissionsController>();
  AllChequesController customer = Get.find<AllChequesController>();
  UserDataController _userDataController = Get.find<UserDataController>();
  late Box<dynamic> notComorder;

  late String dropdownvalue;

  var items = ['Cash', 'Cheque'];
  bool isCash = true;
  List<AllItems> listtoshow = [];
  Map<String, AllItems> getTaxItemMap = {};
  bool canApply = true;
  late bool requestToChangeInvoicePaymentType;

  final MyProdectListController _myProdectListController =
      Get.find<MyProdectListController>();
  CurenceController _curenceController = Get.find<CurenceController>();
  final All_PromotionsController _all_promotionsController =
      Get.find<All_PromotionsController>();
  int youget = 0;

  @override
  void initState() {
    super.initState();

    orderid = box.read(isinvoiceOrSalesOrderOrReturnInvoice);
    if (orderid == null) {
      orderid = int.parse(_userAndPermissions.user.id.toString() + "001");
      print("orderidorderidorderidorderid      ${orderid}");
      box.write(isinvoiceOrSalesOrderOrReturnInvoice, orderid);
    } else {
      orderid++;
      box.write(isinvoiceOrSalesOrderOrReturnInvoice, orderid);
    }
    keysOfMap = _myProdectListController.item.keys.toList();
    requestToChangeInvoicePaymentType = employeePermissionsController
            .employeePermissions[0].requestToChangeInvoicePaymentType ==
        "yes";
    _textEditingController.text = 0.toString();

    for (int i = 0; i < bata.cartlist.length; i++) {
      if (listtoshow.contains(bata.cartlist[i])) {
        listtoshow.add(bata.cartlist[i]);
        getTaxItemMap[bata.cartlist[i].itemId] = bata.cartlist[i];
      }
    }
    _all_promotionsController.allPromotionss.forEach((element) {
      if (_all_promotionsController.isInTime(
              endDateTime: element.endDateTime,
              startDateTime: element.startDateTime) &&
          _all_promotionsController.isInall_group_customers(
              customerId: int.parse(customer.customer_id),
              list: element.allGroupCustomers)) {
        element.allInQuantityPromotionItems.forEach((item) {
          ItemInProm i = ItemInProm(
              bonus_qty: int.parse(element.bonusQty),
              is_bonus_duplicate: element.isBonusDuplicate,
              itemid: item.itemId,
              minimum_quantity_value: int.parse(element.minimumQuantityValue), strictly_listed_item: '');
          _all_promotionsController.promitem[item.itemId] = i;
        });
      }
    });
    yitem();
    print(
        "orderidorderidorderidorderid   $isinvoiceOrSalesOrderOrReturnInvoice      ${orderid}");
  }

  int vv = 1;

  yitem() {
    _myProdectListController.item.forEach((key, value) {
      _all_promotionsController.allPromotionss.forEach((element) {
        element.allInQuantityPromotionItems.forEach((e) {
          if (e.itemId == key &&
              value.value.count >= int.parse(element.minimumQuantityValue)) {
            int youget = int.parse(element.bonusQty);
            if (element.isBonusDuplicate == "1") {
              youget =
                  (value.value.count / int.parse(element.minimumQuantityValue))
                      .toInt();
            }

            wawawa.add(Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Text(value.value.enName)),
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(4)),
                          width: 50,
                          height: 25,
                          child: TextField(
                            onChanged: (v) {
                              if (v != null && int.parse(v) <= youget) {
                                _myProdectListController.setbonce(
                                    id: e.itemId, val: v);
                              } else {
                                Get.snackbar('', 'تاكد من الرقم الصحيح');
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    Text(
                        '${element.minimumQuantityValue} get  ${element.bonusQty}     / $youget ')
                  ],
                ),
              ),
            ));
          }
        });
      });
      wawawa.add(Container(
        color: Colors.orange,
        height: 10,
      ));
      // _all_promotionsController.promitem.forEach((k, val) {
      //   //    print(k == key);
      //   if (k == key &&value.value.count >= val.minimum_quantity_value) {
      //
      //     int youget = val.bonus_qty;
      //     if (val.is_bonus_duplicate == "1") {
      //       youget = (value.value.count / val.minimum_quantity_value).toInt();
      //     }
      //
      //     wawawa.add(Card(
      //       elevation: 8,
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Expanded(child: Text(value.value.name)),
      //                 Container(
      //                   margin: const EdgeInsets.all(15.0),
      //                   padding: const EdgeInsets.all(3.0),
      //                   decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.blueAccent),
      //                       borderRadius: BorderRadius.circular(4)),
      //                   width: 50,
      //                   height: 25,
      //                   child: TextField(
      //                     onChanged: (v) {
      //                       if (v != null && int.parse(v) <= youget) {
      //                         _myProdectListController.setbonce(
      //                             id: val.itemid, val: v);
      //                       } else {
      //                         Get.snackbar('', 'تاكد من الرقم الصحيح');
      //                       }
      //                     },
      //                   ),
      //                 )
      //               ],
      //             ),
      //             Text(
      //                 '${val.minimum_quantity_value} get  ${val.bonus_qty}     / $youget ')
      //           ],
      //         ),
      //       ),
      //     ));
      //   }
      //   });
      vv++;
    });

    wawawa.add(
      SizedBox(
        height: 8,
      ),
    );
    wawawa.add(GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Center(
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              'Ok',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    print("wawawa b ${wawawa.length}");

    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    String date2 = "";

    Future<String> pickdate() async {
      DateTime? time = await showDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2050),
          context: context);

      date2 = time.toString().substring(0, 10);
      return date2;
    }

    double total_sal = 0;
    double totalTax = 0;
    bata.total_Tax.forEach((key, value) {
      totalTax += value;
    });
    bata.PriceafterDes.forEach((key, value) {
      total_sal += value;
    });

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
                height: size.height * 2,
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
                        top: size.height * .1,
                        child: Text(
                          'cart'.tr,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Positioned(
                      right: size.width * .05,
                      top: size.height * .1,
                      child: Container(
                          child: InkWell(
                              child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                        size: 30,
                      ))),
                    ),
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
                child: RepaintBoundary(
                  key: printcart,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30))),
                            //     height: size.height * .4,
                            // child: ListView.builder(
                            //
                            //     itemCount: _myProdectListController.item.length,
                            //     //listtoshow.length,
                            //     itemBuilder: (context, pos) {
                            //       _myProdectListController.item[keysOfMap[pos]];
                            //
                            //       if (_myProdectListController
                            //               .item[keysOfMap[pos]].value.count >
                            //           0)
                            //         return Obx(() {
                            //           return item(
                            //               size: size,
                            //               products: _myProdectListController
                            //                   .item[keysOfMap[pos]]);
                            //         });
                            //     }),
                            child: GetBuilder<MyProdectListController>(
                              builder: (logic) {
                                return Column(
                                  children: logic.item.entries.map((e) {
                                    if (e.value.value.count > 0) {
                                      return item(
                                          size: size, products: e.value);
                                    } else {
                                      return const SizedBox();
                                    }
                                  }).toList(),
                                );
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
                                height: size.height * .06,
                                color: Colors.white,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(
                                      height: size.height * .06,
                                      width: size.width * .8),
                                  child: ElevatedButton(
                                    child: Text('Apply  Promotions'),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      primary: Colors.orangeAccent,
                                      onPrimary: Colors.white,
                                      shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                                    onPressed: () async {
                                      // _myProdectListController
                                      //     .getlistpromiision();
                                      _myProdectListController.mytray();
                                      return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Container(
                                              width: sWidth * .8,
                                              height: 60,
                                              child: Center(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text('You Get Promotion'),
                                                  //  Text('Bol 50+10'),
                                                ],
                                              )),
                                              color: Colors.orangeAccent,
                                            ),
                                            content: Container(
                                              width: sWidth * .8,
                                              height: sHeight * .5,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children:
                                                        _myProdectListController
                                                            .liPro

                                                    // [

                                                    // ],
                                                    ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 16, right: 16),
                          //   child: Text('Discount'),
                          // ),
                          if (employeePermissionsController
                                  .employeePermissions[0].addVoucherDiscount ==
                              'yes')
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'discount'.tr,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: size.width * .4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.5),
                                      //     spreadRadius: 5,
                                      //     blurRadius: 7,
                                      //     offset: Offset(
                                      //         0, 3), // changes position of shadow
                                      //   ),
                                      // ],
                                    ),
                                    child: TextField(
                                      onChanged: (v) {
                                        if (v != null && v.isNotEmpty) {
                                          _myProdectListController
                                              .settotalDiscountincart(v: v);
                                        }
                                      },
                                      controller: _textEditingController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '  5%  ',
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: canApply
                                        ? () {
                                            canApply = false;

                                            //    _myProdectListController.settotalpriceincart(double.parse(_textEditingController.text));

                                            // getTaxItemMap.forEach((key, value) {
                                            //   print(
                                            //       'PriceafterDes befor any thing${bata.PriceafterDes[key]}');
                                            //
                                            //   bata.PriceafterDes[key] =
                                            //       bata.PriceafterDes[key] -
                                            //           (bata.PriceafterDes[key] *
                                            //               double.parse(
                                            //                   _textEditingController
                                            //                       .text) /
                                            //               100);
                                            //   bata.total_Tax[key] = bata
                                            //           .PriceafterDes[key] *
                                            //       (double.parse(getTaxItemMap[key]
                                            //               .itemDetails[0]
                                            //               .tax) /
                                            //           100);
                                            //   ;
                                            //   print(
                                            //       'PriceafterDes after   thing${bata.PriceafterDes[key]}');
                                            // });
                                            //
                                            // setState(() {});
                                          }
                                        : null,
                                    child: Container(
                                      width: size.width * .3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.grey.withOpacity(0.5),
                                        //     spreadRadius: 5,
                                        //     blurRadius: 7,
                                        //     offset: Offset(
                                        //         0, 3), // changes position of shadow
                                        //   ),
                                        // ],
                                      ),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: canApply
                                              ? Color(0xff2C4B89)
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Apply',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, right: 16, left: 16, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('total'.tr),
                                GetBuilder<MyProdectListController>(
                                  builder: (logic) {
                                    return Text(
                                        " ${_curenceController.defultCurrencies.currencySymbol} " +
                                            (logic.totalpriceincart *
                                                    double.parse(
                                                        _curenceController
                                                            .defultCurrencies
                                                            .currencyRate))
                                                .toStringAsFixed(3));
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 8, right: 16, left: 16, bottom: 8),
                              child: Divider(
                                height: 1,
                                color: Colors.teal,
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, right: 16, left: 16, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('discount'.tr),
                                GetBuilder<MyProdectListController>(
                                  builder: (logic) {
                                    return Text(
                                        " ${_curenceController.defultCurrencies.currencySymbol} " +
                                            (logic.sumOftotalDiscountincart *
                                                    double.parse(
                                                        _curenceController
                                                            .defultCurrencies
                                                            .currencyRate))
                                                .toStringAsFixed(3));
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 8, right: 16, left: 16, bottom: 8),
                              child: Divider(
                                height: 1,
                                color: Colors.teal,
                              )),
                          if (Get.find<AllChequesController>()
                                  .customer
                                  .taxStatus ==
                              "yes")
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 8, right: 16, left: 16, bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('totaltax'.tr),
                                  Text(
                                      " ${_curenceController.defultCurrencies.currencySymbol} " +
                                          (_myProdectListController
                                                      .totalTaxincart.value *
                                                  double.parse(
                                                      _curenceController
                                                          .defultCurrencies
                                                          .currencyRate))
                                              .toStringAsFixed(3)),
                                ],
                              ),
                            ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 8, right: 16, left: 16, bottom: 8),
                              child: Divider(
                                height: 1,
                                color: Colors.teal,
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, right: 16, left: 16, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('total'.tr),
                                Text(
                                    " ${_curenceController.defultCurrencies.currencySymbol} " +
                                        ((_myProdectListController
                                                        .totalTaxincart.value +
                                                    _myProdectListController
                                                        .totalpriceincart
                                                        .value) *
                                                double.parse(_curenceController
                                                    .defultCurrencies
                                                    .currencyRate))
                                            .toStringAsFixed(3)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('paymentmethod'.tr),

                                // Container(
                                //   padding: EdgeInsets.all(4),
                                //   width: size.width * .4,
                                //   height: 60,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(11.0),
                                //     color: Colors.white,
                                //     border: Border.all(
                                //       width: 1.0,
                                //       color: const Color(0xFFEBEBEB),
                                //     ),
                                //   ),
                                //   child: Center(
                                //     child: DropdownButton(underline:   SizedBox(),
                                //
                                //       value: dropdownvalue, hint: Text('Cash OR Cheque'),
                                //       icon: Icon(Icons.keyboard_arrow_down),
                                //       items:items.map((String items) {
                                //         return DropdownMenuItem(
                                //             value: items,
                                //             child: Text(items)
                                //         );
                                //       }
                                //       ).toList(),
                                //       onChanged: (String newValue){
                                //         setState(() {
                                //           dropdownvalue = newValue;
                                //         });
                                //       },
                                //     ),
                                //   ),
                                // ):

                                if (requestToChangeInvoicePaymentType)
                                  GestureDetector(
                                    onTap: () {
                                      isCash = true;
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      child: Center(
                                          child: Text(
                                        'cash'.tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      )),
                                      width: size.width * .25,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(11.0),
                                        color: isCash
                                            ? Colors.indigoAccent
                                            : Colors.grey,
                                        border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xFFEBEBEB),
                                        ),
                                      ),
                                    ),
                                  ),

                                if (requestToChangeInvoicePaymentType)
                                  GestureDetector(
                                    onTap: () {
                                      isCash = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      child: Center(
                                          child: Text(
                                        'Credit ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      )),
                                      width: size.width * .25,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(11.0),
                                        color: isCash == false
                                            ? Colors.indigoAccent
                                            : Colors.grey,
                                        border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xFFEBEBEB),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (!requestToChangeInvoicePaymentType)
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    width: size.width * .4,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11.0),
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xFFEBEBEB),
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(
                                            customer.customer.paymentType)),
                                  )
                              ],
                            ),
                          ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     InkWell(
                          //       onTap: () {
                          //         Get.to(CashPay());
                          //       },
                          //       child: Container(
                          //         padding: EdgeInsets.all(4),
                          //         width: size.width * .4,
                          //         height: 60,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(11.0),
                          //           color: Colors.white,
                          //           border: Border.all(
                          //             width: 1.0,
                          //             color: const Color(0xFFEBEBEB),
                          //           ),
                          //         ),
                          //         child: Center(
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceAround,
                          //             children: [
                          //               Text(
                          //                 'Cash' ,
                          //                 style: TextStyle(
                          //                     fontWeight: FontWeight.bold,
                          //                     fontSize: 20),
                          //               ),
                          //               Image.asset(
                          //                 'assets/images/dollar.png',
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         Get.to(ChequePay());
                          //       },
                          //       child: Container(
                          //         padding: EdgeInsets.all(4),
                          //         width: size.width * .4,
                          //         height: 60,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(11.0),
                          //           color: Colors.white,
                          //           border: Border.all(
                          //             width: 1.0,
                          //             color: const Color(0xFFEBEBEB),
                          //           ),
                          //         ),
                          //         child: Center(
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceAround,
                          //             children: [
                          //               Text(
                          //                 'Cheque',
                          //                 style: TextStyle(
                          //                     fontWeight: FontWeight.bold,
                          //                     fontSize: 20),
                          //               ),
                          //               Image.asset(
                          //                 'assets/images/ch.png',
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  pickdate().then((value) {
                                    if (value != null) {
                                      Chequetime = value;

                                      setState(() {});
                                    }
                                  });
                                },
                                child: Container(
                                  width: size.width * .9,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey.withOpacity(0.5),
                                    //     spreadRadius: 5,
                                    //     blurRadius: 7,
                                    //     offset: Offset(
                                    //         0, 3), // changes position of shadow
                                    //   ),
                                    // ],
                                  ),
                                  child: Center(child: Text(Chequetime)),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    child: Text('addnote'.tr),
                                  ),
                                  Container(
                                    width: size.width * .9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.5),
                                      //     spreadRadius: 5,
                                      //     blurRadius: 7,
                                      //     offset: Offset(
                                      //         0, 3), // changes position of shadow
                                      //   ),
                                      // ],
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      getdtatafromdatabaseanddelet();

                                      final doc = pw.Document();

                                      doc.addPage(pw.Page(
                                          pageFormat: PdfPageFormat.letter,
                                          build: (pw.Context context) {
                                            return pw.Center(
                                              child: pw.Text('Hello World'),
                                            ); // Center
                                          })); // Page

                                      //  sendAllData();
                                      if (_myProdectListController.item.length >
                                          0) {
                                        var data =
                                            Insert_invoice_salesorder_json(
                                                listInvoice: []).toJson();
                                        List<ListInvoice> list = [];
                                        int noOfItems = 0;
                                        _myProdectListController.item
                                            .forEach((key, value) {
                                          if (value.value.count > 0) {
                                            noOfItems++;
                                            //   value.value.quantity_in_store-value.value.count;
                                          }
                                        });
                                        for (int itmeinlast = 0;
                                            itmeinlast <
                                                _myProdectListController
                                                    .item.length;
                                            itmeinlast++) {
                                          if (_myProdectListController
                                                      .item[keysOfMap[
                                                          itmeinlast]]!
                                                      .value
                                                      .count >
                                                  0 ||
                                              _myProdectListController
                                                      .item[keysOfMap[
                                                          itmeinlast]]!
                                                      .value
                                                      .bonce >
                                                  0) {
                                            double onleyprice =
                                                (_myProdectListController
                                                        .item[keysOfMap[
                                                            itmeinlast]]!
                                                        .value
                                                        .afterdes -
                                                    (_myProdectListController
                                                            .item[keysOfMap[
                                                                itmeinlast]]!
                                                            .value
                                                            .afterdes *
                                                        _myProdectListController
                                                            .totalDiscountincart
                                                            .value));
                                            //  double onleyprice=(_myProdectListController.item[keysOfMap[itmeinlast]].value.afterdes*_myProdectListController.item[keysOfMap[itmeinlast]].value.count)-(_myProdectListController.item[keysOfMap[itmeinlast]].value.afterdes*(_myProdectListController.totalDiscountincart/100)*_myProdectListController.item[keysOfMap[itmeinlast]].value.count);
                                            double onleypricewithtax =
                                                onleyprice +
                                                    (onleyprice *
                                                        (_myProdectListController
                                                                .item[keysOfMap[
                                                                    itmeinlast]]!
                                                                .value!
                                                                .tex /
                                                            100));

                                            _myProdectListController
                                                .setcountinstore(
                                                    id: _myProdectListController
                                                        .item[keysOfMap[
                                                            itmeinlast]]!
                                                        .value
                                                        .id,
                                                    count:
                                                        _myProdectListController
                                                            .item[keysOfMap[
                                                                itmeinlast]]!
                                                            .value
                                                            .count);
                                            ListInvoice i = ListInvoice(
                                                no_invoice: orderid,
                                                order_id: orderid,
                                                user_id: _userAndPermissions
                                                    .user.userId,
                                                request_level: 2.toString(),
                                                salesmanagerNote: " ",
                                                supervisorNote: " ",
                                                totalTax: onleyprice *
                                                    (_myProdectListController.item[keysOfMap[itmeinlast]]!.value.tex /
                                                        100),
                                                quantity: _myProdectListController
                                                    .item[
                                                        keysOfMap[itmeinlast]]!
                                                    .value
                                                    .count,
                                                itemId: int.parse(_myProdectListController
                                                    .item[
                                                        keysOfMap[itmeinlast]]!
                                                    .value
                                                    .id),
                                                noOfItems: noOfItems,
                                                employee_id:
                                                    _userAndPermissions.user.id,
                                                requestStatus: "pending",
                                                customer_id: int.parse(
                                                    Get.find<AllChequesController>()
                                                        .customer
                                                        .id),
                                                bonus: _myProdectListController
                                                    .item[keysOfMap[itmeinlast]]!
                                                    .value
                                                    .bonce,
                                                supervisorId: _userAndPermissions.user.supervisorId,
                                                salesmanagerId: _userAndPermissions.user.salesmanagerId,
                                                basePricePerUnit: _myProdectListController.item[keysOfMap[itmeinlast]]!.value.price,
                                                storeId: int.parse(_userAndPermissions.user.storeId),
                                                measurementUnitId: _myProdectListController.item[keysOfMap[itmeinlast]]!.value.measurementUnitId,
                                                totalPrice: onleyprice * double.parse(_curenceController.defultCurrencies.currencyRate),
                                                totalPriceWithTax: onleypricewithtax * double.parse(_curenceController.defultCurrencies.currencyRate),
                                                totalPriceBeforeTax: onleyprice * double.parse(_curenceController.defultCurrencies.currencyRate),
                                                totalPriceWithoutTaxDiscount: (_myProdectListController.item[keysOfMap[itmeinlast]]!.value.price * _myProdectListController.item[keysOfMap[itmeinlast]]!.value.count) * double.parse(_curenceController.defultCurrencies.currencyRate),
                                                totalDiscount: ((_myProdectListController.item[keysOfMap[itmeinlast]]!.value.price * _myProdectListController.item[keysOfMap[itmeinlast]]!.value.count * (_myProdectListController.item[keysOfMap[itmeinlast]]!.value.diescount / 100)) + (_myProdectListController.item[keysOfMap[itmeinlast]]!.value.price * _myProdectListController.item[keysOfMap[itmeinlast]]!.value.count * (_myProdectListController.totalDiscountincart / 100))) * double.parse(_curenceController.defultCurrencies.currencyRate),
                                                categoryId: _myProdectListController.item[keysOfMap[itmeinlast]]!.value.categoryId,
                                                request_type: isinvoiceOrSalesOrderOrReturnInvoice,
                                                taxType: "percentage");

                                            data['key'] = '1234567890';
                                            list.add(i);
                                          }
                                        }
                                        data['list_invoice'] =
                                            list; //list.map((e) => e.toJson()).toList();

                                        await Get.find<NetWorkController>()
                                            .initConnctivity();

                                        if (Get.find<NetWorkController>()
                                            .connectionStatus
                                            .value) {
                                          //        await  sendAllData();

                                          _allNetworking
                                              .insert_invoice_salesorder(
                                                  data: data)
                                              .then((value) {
                                            return showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Container(
                                                    width: size.width * .8,
                                                    height: 60,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('ORTECK',
                                                            style: TextStyle(
                                                                fontSize: 25,
                                                                color: Colors
                                                                    .indigoAccent,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                  ),
                                                  content: Container(
                                                    width: size.width * .8,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                              'Order done sucessfully'),
                                                          Row(
                                                            children: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    // Navigator.pop(context);

                                                                    int count =
                                                                        0;
                                                                    Navigator.popUntil(
                                                                        context,
                                                                        (route) {
                                                                      return count++ ==
                                                                          3;
                                                                    });
                                                                  },
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(Icons
                                                                          .arrow_back),
                                                                      SizedBox(
                                                                        width:
                                                                            8,
                                                                      ),
                                                                      Text(
                                                                          'Back'),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          TextButton(
                                                                              onPressed: () async {
                                                                                _printPDF(context);
                                                                              },
                                                                              child: Row(
                                                                                children: [
                                                                                  Icon(Icons.print),
                                                                                  SizedBox(
                                                                                    width: 8,
                                                                                  ),
                                                                                  Text('Print')
                                                                                ],
                                                                              )),
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                bluetoothPrinter();
                                                                              },
                                                                              child: Row(
                                                                                children: [
                                                                                  Text('Bluetooth')
                                                                                ],
                                                                              ))
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ))
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          });
                                        } else {
                                          list.forEach((element) {
                                            _databaseHelper
                                                .insert_Sales_Order_Request_Details(
                                                    element)
                                                .then((value) {});
                                          });
                                          orderid++;
                                          box.write('orderid', orderid);
                                          return showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Container(
                                                  width: size.width * .8,
                                                  height: 60,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('ORTECK',
                                                          style: TextStyle(
                                                              fontSize: 25,
                                                              color: Colors
                                                                  .indigoAccent,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                ),
                                                content: Container(
                                                  width: size.width * .8,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                            'Order done sucessfully'),
                                                        Row(
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  // Navigator.pop(context);
                                                                  // Get.off(() => All_Customer());
                                                                  int count = 0;
                                                                  Navigator.popUntil(
                                                                      context,
                                                                      (route) {
                                                                    return count++ ==
                                                                        4;
                                                                  });
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    Icon(Icons
                                                                        .arrow_back),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                        'Back'),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              //    _getimagetoprint();
                                                                              _printPDF(context);
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Icon(Icons.print),
                                                                                SizedBox(
                                                                                  width: 8,
                                                                                ),
                                                                                Text('Print')
                                                                              ],
                                                                            )),
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              bluetoothPrinter();
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Icon(Icons.print),
                                                                                SizedBox(
                                                                                  width: 8,
                                                                                ),
                                                                                Text('Bluetooth')
                                                                              ],
                                                                            ))
                                                                      ],
                                                                    )
                                                                  ],
                                                                ))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }

                                        // double totalprice = 0;
                                        //
                                        // for (int oo = 0;
                                        //     oo < bata.cartlist.length;
                                        //     oo++) {
                                        //   totalprice = totalprice +
                                        //       double.parse(bata.cartlist[oo]
                                        //           .itemDetails[0].sellingPrice);
                                        // }
                                        //
                                        // _databaseHelper
                                        //     .insert_sales_order_requests(
                                        //         Sales_Order_Requests_Model(
                                        //   user_id: _userAndPermissions.user.id,
                                        //   customer_id:   int.parse(_userAndPermissions.user.customerId),
                                        //   employee_id:
                                        //       _userAndPermissions.user.userId,
                                        //   request_status: 'accepted',
                                        //   salesmanager_id: _userAndPermissions
                                        //       .user.salesmanagerId,
                                        //   request_type:
                                        //       isinvoiceOrSalesOrderOrReturnInvoice,
                                        //   // 'salesOrder',
                                        //   salesmanager_status: 'pending',
                                        //   store_id: 1,
                                        //   total_price: totalprice,
                                        //   created_at: DateTime.now().toString(),
                                        //   supervisor_id:
                                        //       _userAndPermissions.user.supervisorId,
                                        //   total_discount: 1000,
                                        //   is_successfully_submitted: 0,
                                        //   no_of_items:
                                        //       bata.cartlist.length.toString(),
                                        //   salesmanager_note: '',
                                        //   request_level: 1,
                                        //   total_tax: 10,
                                        //   total_price_without_tax_discount: 55,
                                        // ))
                                        //     .then((value) {
                                        //   insertItemInDataBase(value);
                                        // }).catchError((e) {
                                        //   print(e.toString());
                                        // });
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      width: size.width * .9,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2C4B89),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'complete'.tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget item({size, required Rx<TheItemInList> products}) {
    int numberofitem = 0;
    for (int i = 0; i < bata.cartlist.length; i++) {
      if (bata.cartlist[i] == products) {
        numberofitem++;
      }
    }
    TextEditingController textEditingController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: Offset(0, 3), // changes position of shadow
            //   ),
            // ],
          ),
          //  height: size.height * .145,
          width: size.width,
          // color: Colors.white,
          child: Column(
            children: [
              //photo item
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(products.value.pic),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => CartEditProduct(products),
                              );
                            },
                            child: Text(
                              products.value.enName,
                              // overflow: TextOverflow.fade,
                              maxLines: 2,

                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                color: const Color(0xff1e2432),
                                letterSpacing: -0.32,
                                height: 1.2,
                              ),
                            ),
                          ),

                          //price
                          Text(
                            products.value.price.toString(),
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              color: const Color(0xff191919),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: InkWell(
                            onTap: () {
                              _myProdectListController.deletItem(products);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.grey,
                              size: 30,
                            ))),
                  ],
                ),
              ),

              //edit & delete

              //item name

              //counter
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (_myProdectListController
                                .item[products.value.id]!.value.count >
                            0) {
                          double v = _myProdectListController
                                  .item[products.value.id]!.value.count -
                              1;
                          print(products.value.count);
                          _myProdectListController.setCount(
                              id: products.value.id, count: v);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(2)),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    // IconButton(
                    //   icon: Icon(
                    //     Icons.remove_circle,
                    //     size: 60,
                    //   ),
                    //   onPressed: () {
                    //     bata.removefromcart(item: data);
                    //
                    //   },
                    //   color: Colors.orangeAccent,
                    // ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: size.width * .2,
                      child: Center(child: GetBuilder<MyProdectListController>(
                        builder: (logic) {
                          textEditingController.text = logic
                              .item[products.value.id]!.value.count
                              .toString();

                          return TextField(
                            onChanged: (v) {
                              if (v != null && v.isNotEmpty) {
                                _myProdectListController.setCount(
                                    id: products.value.id,
                                    count: double.parse(v));
                              }
                            },
                            controller: textEditingController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                          );
                        },
                      )),
                    ),
                    SizedBox(
                      width: 15,
                    ),

                    InkWell(
                      onTap: () {
                        //  bata.addToCart(item: data);

                        double v = _myProdectListController
                                .item[products.value.id]?.value.count ??
                            0 + 1;
                        print(products.value.count);
                        _myProdectListController.setCount(
                            id: products.value.id, count: v);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(2)),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.add_circle, size: 60),
                    //   color: Colors.orangeAccent,
                    //   onPressed: () {
                    //     bata.addToCart(item: data);
                    //     print('pppp');
                    //
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  // Widget item({size, AllItems data}) {
  //   int numberofitem = 0;
  //   for (int i = 0; i < bata.cartlist.length; i++) {
  //     if (bata.cartlist[i] == data) {
  //       numberofitem++;
  //     }
  //   }
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(10),
  //               topRight: Radius.circular(10),
  //               bottomLeft: Radius.circular(10),
  //               bottomRight: Radius.circular(10)),
  //           // boxShadow: [
  //           //   BoxShadow(
  //           //     color: Colors.grey.withOpacity(0.5),
  //           //     spreadRadius: 5,
  //           //     blurRadius: 7,
  //           //     offset: Offset(0, 3), // changes position of shadow
  //           //   ),
  //           // ],
  //         ),
  //         //  height: size.height * .145,
  //         width: size.width,
  //         // color: Colors.white,
  //         child: Column(
  //           children: [
  //             //photo item
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Row(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Container(
  //                       width: 100,
  //                       height: 100,
  //                       decoration: BoxDecoration(
  //                         color: Colors.blue,
  //                         // image: DecorationImage(
  //                         //   image: NetworkImage(data.itemDetails[0].image),
  //                         //   fit: BoxFit.fill,
  //                         // ),
  //                       ),
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         GestureDetector(
  //                           onTap: () {
  //                             Get.to(
  //                               CartEditProduct(data),
  //                             );
  //                           },
  //                           child: Text(
  //                             data.itemDetails[0].itemNameEn,
  //                             // overflow: TextOverflow.fade,
  //                             maxLines: 2,
  //
  //                             style: TextStyle(
  //                               fontFamily: 'Roboto',
  //                               fontSize: 20,
  //                               color: const Color(0xff1e2432),
  //                               letterSpacing: -0.32,
  //                               height: 1.2,
  //                             ),
  //                           ),
  //                         ),
  //
  //                         //price
  //                         Text(
  //                           data.itemDetails[0].sellingPrice,
  //                           maxLines: 2,
  //                           style: TextStyle(
  //                             fontFamily: 'Poppins',
  //                             fontSize: 13,
  //                             color: const Color(0xff191919),
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                           textAlign: TextAlign.left,
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Container(
  //                       child: InkWell(
  //                           onTap: () {
  //                             listtoshow.remove(data);
  //                             bata.removeAllChooseItexfromcart(item: data);
  //
  //                             setState(() {});
  //                           },
  //                           child: Icon(
  //                             Icons.delete,
  //                             color: Colors.grey,
  //                             size: 30,
  //                           ))),
  //                   // Container(
  //                   //     child: InkWell(
  //                   //         onTap: () {
  //                   //
  //                   //           // Get.to(CartEditProduct(data), );
  //                   //           // //
  //                   //           // // Navigator.push(
  //                   //           // //   context,
  //                   //           // //   MaterialPageRoute(
  //                   //           // //       builder: (context) => CartEditProduct()),
  //                   //           // // );
  //                   //           // //
  //                   //           // //
  //                   //
  //                   //         },
  //                   //         child: Icon(
  //                   //           Icons.edit,
  //                   //           color: Colors.grey,
  //                   //           size: 30,
  //                   //         ))),
  //                 ],
  //               ),
  //             ),
  //
  //             //edit & delete
  //
  //             //item name
  //
  //             //counter
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   InkWell(
  //                     onTap: () {
  //                       bata.removefromcart(item: data);
  //                     },
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           color: Colors.orange,
  //                           borderRadius: BorderRadius.circular(2)),
  //                       height: 50,
  //                       width: 50,
  //                       child: Center(
  //                         child: Text(
  //                           "-",
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 30,
  //                               color: Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   // IconButton(
  //                   //   icon: Icon(
  //                   //     Icons.remove_circle,
  //                   //     size: 60,
  //                   //   ),
  //                   //   onPressed: () {
  //                   //     bata.removefromcart(item: data);
  //                   //
  //                   //   },
  //                   //   color: Colors.orangeAccent,
  //                   // ),
  //                   SizedBox(
  //                     width: 15,
  //                   ),
  //                   Text(
  //                     numberofitem.toString(),
  //                     style: TextStyle(fontSize: 20),
  //                   ),
  //                   SizedBox(
  //                     width: 15,
  //                   ),
  //
  //                   InkWell(
  //                     onTap: () {
  //                       bata.addToCart(item: data);
  //                     },
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           color: Colors.orange,
  //                           borderRadius: BorderRadius.circular(2)),
  //                       height: 50,
  //                       width: 50,
  //                       child: Center(
  //                         child: Text(
  //                           "+",
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 20,
  //                               color: Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   // IconButton(
  //                   //   icon: Icon(Icons.add_circle, size: 60),
  //                   //   color: Colors.orangeAccent,
  //                   //   onPressed: () {
  //                   //     bata.addToCart(item: data);
  //                   //     print('pppp');
  //                   //
  //                   //   },
  //                   // ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         )),
  //   );
  // }
  Widget nastedlist() {
    return new ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int blockIdx) {
        print("Building block $blockIdx");
        return new Column(
          children: [
            Padding(
                child: Text("Block $blockIdx"), padding: EdgeInsets.all(8.0)),
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int childIdx) {
                print("Building block $blockIdx child $childIdx");
                return Padding(
                  child: Text("Child $childIdx"),
                  padding: EdgeInsets.only(
                      left: 20.0, right: 8.0, top: 8.0, bottom: 8.0),
                );
              },
            )
          ],
        );
      },
    );
  }

  insertItemInDataBase(int i) async {
    for (int oo = 0; oo < bata.cartlist.length; oo++) {
      if (bata.itemcount[bata.cartlist[oo].itemId] == null) {
        bata.itemcount[bata.cartlist[oo].itemId] = 1;
        //  bata.itemInCart.value++;
      } else {
        bata!.itemcount[bata!.cartlist[oo]!.itemId]! +10;
      }
    }
    // bata.additemInitemInCart(item: bata.cartlist[oo]);
    bata.itemcount.forEach((key, value) async {
      await DatabaseHelper()
          .insert_item_tabel(Item_Database(
              olderId: i,
              itemId: int.tryParse(key ?? "0") ?? 0,
              quantity: value,
              categoryId: 0,
              measurementUnitId: 0,
              basePricePerUnit: 0,
              bonus: 1,
              taxType: '',
              totalTax: 10,
              totalPriceBeforeTax: 10, totalPriceWithTax: 5, totalPrice: 55))
          .then((value) {
        print('تم اضافه');
      }).catchError((e) {
        print(e.toString());
      });
    });

    // Get.off(Dashboard());
  }

  Future sendAllData() async {
    for (int i = 0; i < orderid; i++) {
      List<ListInvoice> aaa =
          await _databaseHelper.get_All_Sales_Order_Request_Details(i);
      if (aaa.length > 0) {
        var data = Insert_invoice_salesorder_json(listInvoice: []).toJson();
        data['key'] = '1234567890';

        data['list_invoice'] = aaa;

        await _allNetworking
            .insert_invoice_salesorder(data: data)
            .then((value) {
          print(
              '00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
        });
      }
    }
  }

  _getimagetoprint() async {
    try {
      print('1111111111111111111oo');

      RenderRepaintBoundary? bounddary = printcart.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;
      ui.Image? image = await bounddary?.toImage(pixelRatio: 5);
      ByteData? byteData =
          await image?.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData?.buffer.asUint8List();
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File(
          '$dir/' + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
      await file.writeAsBytes(pngBytes!);

      print('222222222222222222222222222222222222222222222222222222222222222');
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('picc'),
            content: SingleChildScrollView(
              child: Image.file(file),
            ),
          );
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void _printPDF(context) async {
    List<Rx<TheItemInList>> item = _myProdectListController.item.values
        .where((element) => element.value.count > 0)
        .toList();
    final doc = pw.Document();
    //final font = await fontFromAssetBundle('assets/font/HTQaysSansPro-Regular.ttf');
    final font =
        await rootBundle.load("assets/font/ArbFONTS-GE-Snd-Book_1.ttf");
    final ttf = pw.Font.ttf(font);

    //var myTheme  =pw.PageTheme(theme:pw. Theme(  data: pw.ThemeData( defaultTextStyle: pw.TextStyle(font: ttf,  ) ),   ) );
    List<pw.Widget> listsss = [];
      item.forEach((e) {
      double total = e.value.count * e.value.afterdes;
      listsss.add(pw.Container(
          alignment: pw.Alignment.centerRight,
          width: double.infinity,
          child: pw.Text("${e.value.enName} ",
              textDirection: pw.TextDirection.rtl,
              textAlign: pw.TextAlign.right,
              style: pw.TextStyle(
                font: ttf,
              ))));
      listsss.add(pw.Row(children: [
        pw.Expanded(
            flex: 1,
            child: pw.Text(e.value.afterdes.toStringAsFixed(2),
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(font: ttf))),
        pw.Expanded(
            flex: 1,
            child: pw.Text(e.value.count.toString(),
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(font: ttf))),

        pw.Expanded(
            flex: 1,
            child: pw.Text(e.value.price.toString(),
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(font: ttf))),
        pw.Expanded(
            flex: 1,
            child: pw.Text(" ",
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(
                  font: ttf,
                )))
        // pw.Expanded(
        //     flex: 1,
        //     child: pw.Text(
        //         "${e.value.name} ",
        //
        //         textDirection: pw.TextDirection.rtl,
        //         style: pw.TextStyle(
        //           font: ttf,
        //         )))
      ]));
      listsss.add(pw.SizedBox(height: 3));
    });
    doc.addPage(pw.Page(
        textDirection: pw.TextDirection.rtl,
        pageFormat: PdfPageFormat.roll80,
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Text('${_userDataController.userData.branchNameAr}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.Text(' الهاتف ${_userDataController.userData.phoneNo}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.Text(' الفاكس ${_userDataController.userData.faxNo}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.Text('${_userDataController.userData}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.Text(' EMail ${_userDataController.userData.email}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.Text('${_userDataController.userData.area1}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),

            pw.SizedBox(height: 10),
            // pw.Table.fromTextArray(
            //     headerStyle: pw.TextStyle(
            //       font: ttf,
            //       fontWeight: pw.FontWeight.bold,
            //     ),
            //     border: null,
            //     headers: ["المنتج", "السعر", "مجانا", 'الخصم', "الاجمالي"],headerDecoration:pw. BoxDecoration(color: PdfColors.green300),
            //     headerAlignment: pw.Alignment.center,
            //     data:  item.map((e) => [ e.value.name ,e.value.price,e.value.bonce,e.value.diescount,""]).toList()                                          //['rr','rr','rrr','iiii'].map((e) => [e,e,e,e,e]).toList())
            // )
            //
            // pw.Table(
            //   children: [
            //     pw.TableRow(
            //         decoration: pw.BoxDecoration(
            //           color: PdfColors.grey300,
            //         ),
            //         children: [
            //           pw.Expanded(
            //               flex: 1,
            //               child: pw.Text('الاجمالي',
            //                   textDirection: pw.TextDirection.rtl,
            //                   style: pw.TextStyle(font: ttf))),
            //           pw.Expanded(
            //               flex: 1,
            //               child: pw.Text('الخصم',
            //                   textDirection: pw.TextDirection.rtl,
            //                   style: pw.TextStyle(font: ttf))),
            //           pw.Expanded(
            //               flex: 1,
            //               child: pw.Text('مجانا',
            //                   textDirection: pw.TextDirection.rtl,
            //                   style: pw.TextStyle(font: ttf))),
            //           pw.Expanded(
            //               flex: 1,
            //               child: pw.Text('السعر',
            //                   textDirection: pw.TextDirection.rtl,
            //                   style: pw.TextStyle(font: ttf))),
            //           pw.Expanded(
            //               flex: 1,
            //               child: pw.Text('المنتج',
            //                   textDirection: pw.TextDirection.rtl,
            //                   style: pw.TextStyle(font: ttf)))
            //         ])
            //   ],
            // ),
            pw.Row(children: [
              pw.Expanded(
                  flex: 1,
                  child: pw.Text('الاجمالي',
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(font: ttf))),
              pw.Expanded(
                  flex: 1,
                  child: pw.Text('الكميه',
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(font: ttf))),
              pw.Expanded(
                  flex: 1,
                  child: pw.Text('السعر',
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(font: ttf))),
              pw.Expanded(
                  flex: 1,
                  child: pw.Text('المنتج',
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(font: ttf)))
            ])
            //
            // pw.Table(
            //   children: [
            //     pw.TableRow(
            //         decoration: pw.BoxDecoration(
            //
            //         ),
            //         children: [
            //          pw.Text('الاجمالي',
            //               textDirection: pw.TextDirection.rtl,
            //               style: pw.TextStyle(font: ttf)) ,
            //            pw.Text('الخصم',
            //               textDirection: pw.TextDirection.rtl,
            //               style: pw.TextStyle(font: ttf)) ,
            //             pw.Text('مجانا',
            //               textDirection: pw.TextDirection.rtl,
            //               style: pw.TextStyle(font: ttf) ),
            //         pw.Text('السعر',
            //               textDirection: pw.TextDirection.rtl,
            //               style: pw.TextStyle(font: ttf)) ,
            //                pw.Text('   عللم هاي اعلي شي موجود للتجربه حلولي حلولي المنتج',
            //               textDirection: pw.TextDirection.rtl,
            //               style: pw.TextStyle(font: ttf))
            //         ])
            //   ],
            // ),
            ,
            pw.Column(children: listsss)
          ]); // Center
        })); // Page
    print(listsss);
    final date = DateTime.now();
    // final dueDate = date.add(Duration(days: 7));

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    await file.writeAsBytes(await doc.save());
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
    await Printing.sharePdf(
        bytes: await doc.save(), filename: 'my-document.pdf');
    await for (var page in Printing.raster(await doc.save())) {
      final image = page.asImage();
      print('000000000000000000000000000000000000000000000000000');
      print(image);
      print('000000000000000000000000000000000000000000000000000');
    }
    PdfPreview(
      build: (format) => doc.save(),
    );

    // _getimagetoprint();
  }

  void bluetoothPrinter() async {
    List<Rx<TheItemInList>> item = _myProdectListController.item.values
        .where((element) => element.value.count > 0)
        .toList();
    final doc = pw.Document();
    //final font = await fontFromAssetBundle('assets/font/HTQaysSansPro-Regular.ttf');
    final font =
        await rootBundle.load("assets/font/ArbFONTS-GE-Snd-Book_1.ttf");
    final ttf = pw.Font.ttf(font);

    //var myTheme  =pw.PageTheme(theme:pw. Theme(  data: pw.ThemeData( defaultTextStyle: pw.TextStyle(font: ttf,  ) ),   ) );
    List<pw.Widget> listsss = [];
      item.forEach((e) {
      double total = e.value.count * e.value.afterdes;
      listsss.add(pw.Container(
          alignment: pw.Alignment.centerRight,
          width: double.infinity,
          child: pw.Text("${e.value.enName} ",
              textDirection: pw.TextDirection.rtl,
              textAlign: pw.TextAlign.right,
              style: pw.TextStyle(
                font: ttf,
              ))));
      listsss.add(pw.Row(children: [
        pw.Expanded(
            flex: 1,
            child: pw.Text(e.value.afterdes.toStringAsFixed(2),
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(font: ttf))),
        pw.Expanded(
            flex: 1,
            child: pw.Text(e.value.count.toString(),
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(font: ttf))),
        pw.Expanded(
            flex: 1,
            child: pw.Text(e.value.price.toString(),
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(font: ttf))),
        pw.Expanded(
            flex: 1,
            child: pw.Text(" ",
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(
                  font: ttf,
                )))
      ]));
      listsss.add(pw.SizedBox(height: 3));
    });
    doc.addPage(pw.Page(
        textDirection: pw.TextDirection.rtl,
        pageFormat: PdfPageFormat.roll80,
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Text('${_userDataController.userData.branchNameAr}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.Text(' الهاتف ${_userDataController.userData.phoneNo}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.Text(' الفاكس ${_userDataController.userData.faxNo}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.Text('${_userDataController.userData}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.Text(' EMail ${_userDataController.userData.email}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.Text('${_userDataController.userData.area1}',
                style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                textDirection: pw.TextDirection.rtl),
            pw.SizedBox(height: 10),
            pw.Row(children: [
              pw.Expanded(
                  flex: 1,
                  child: pw.Text('الاجمالي',
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(font: ttf))),
              pw.Expanded(
                  flex: 1,
                  child: pw.Text('الكميه',
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(font: ttf))),
              pw.Expanded(
                  flex: 1,
                  child: pw.Text('السعر',
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(font: ttf))),
              pw.Expanded(
                  flex: 1,
                  child: pw.Text('المنتج',
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(font: ttf)))
            ]),
            pw.Column(children: listsss)
          ]); // Center
        })); // Page
    print(listsss);
    final date = DateTime.now();

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    await file.writeAsBytes(await doc.save());
    // await Printing.layoutPdf(
    // onLayout: (PdfPageFormat format) async => doc.save());
    // await Printing.sharePdf(
    // bytes: await doc.save(), filename: 'my-document.pdf');
    // await for (var page in Printing.raster(await doc.save())) {
    // final   image = awaitpage.toImage();
    //
    // print('000000000000000000000000000000000000000000000000000');
    // print(image);
    //
    //   // final String pat = await getApplicationDocumentsDirectory().path;
    //   //
    //   // final File imagee = await image.copy('$path/image1.png');
    // print('000000000000000000000000000000000000000000000000000');
    // }

   // Get.to(() => NewTryBluth());

    //Get.to(()=>BluetoothPrinterScr(file));
  }

  getdtatafromdatabaseanddelet() async {
    notComorder = await Hive.openBox<NotComplete_order>('NotCompleteorder');
    // print ( "notComorder  ${notComorder.values}");
    // notComorder.values.forEach((element) {
    //   NotComplete_order s=element as NotComplete_order;
    //   print(Get.find<AllChequesController>()
    //       .customer
    //
    //       .id);
    //   print(s.customerId);
    //   print(Get.find<AllChequesController>()
    //       .customer
    //
    //       .id==s.customerId);
    //   if(Get.find<AllChequesController>()
    //       .customer
    //
    //       .id==s.customerId){

    notComorder.keys.forEach((element) {
      NotComplete_order s = notComorder.get(element) as NotComplete_order;
      print(Get.find<AllChequesController>().customer.id);
      print(s.customerId);
      print(element);
      print(Get.find<AllChequesController>().customer.id == s.customerId);
      if (Get.find<AllChequesController>().customer.id == s.customerId) {
        notComorder.delete(element);
      }
    });
    // }

    //   }
    //) ;
// notComorder.keys.forEach((element) {
//   NotComplete_order s=notComorder.get(element) as NotComplete_order;
//   print(Get.find<AllChequesController>()
//       .customer
//
//       .id);
//
//   if(Get.find<AllChequesController>()
//       .customer
//
//       .id==s.customerId){
//
//     notComorder.delete(element);
//   }
// });
    _myProdectListController.item.forEach((key, value) {
      _myProdectListController.setCount(id: value.value.id, count: 0);
    });
    _myProdectListController.countInCart();
  }
}

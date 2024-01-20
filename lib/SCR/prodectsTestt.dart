import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/hivee/not_complete_order.dart';
import 'package:anjum/DB/tabelname/insert_visit_DB.dart';
import 'package:anjum/controllers/allCategoriesController.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/controllers/currencie_controller.dart';
import 'package:anjum/controllers/employeePermissionsController.dart';
import 'package:anjum/controllers/itemUnits_controller.dart';
import 'package:anjum/controllers/myProdectListController.dart';
import 'package:anjum/controllers/priceListsInfoController.dart';
import 'package:anjum/controllers/timeController.dart';
import 'package:anjum/controllers/unitController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/jsonofnwetry/get_Fifth_step_json.dart';
import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:anjum/network/newjosomnLast/get_second_step2_json.dart';
import 'package:anjum/network/newjosomnLast/get_second_step3_json.dart';
import 'package:anjum/utilitie/invoiceOrSalesOrderOrReturnInvoice.dart';
import 'package:anjum/utilitie/utilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'all _customer.dart';
import 'cart.dart';
import 'filter.dart';

class ProdectTestt extends StatefulWidget {


  @override
  _ProdectTesttState createState() => _ProdectTesttState();
}

class _ProdectTesttState extends State<ProdectTestt> {
  final UnitController _UnitController = Get.find<UnitController>();
  final MyProdectListController _myProdectListController =
  Get.find< MyProdectListController>();
  CurenceController _curenceController = Get.find<CurenceController>();
  final TimeController c = Get.find<TimeController>();
  var keysOfMap;
  List<TextEditingController> textEditingControllerDiscount = [];
  int totalItem = 0;
  CartItemController cartListItem =
  Get.put(CartItemController(), permanent: true);
  AllCategoriesController filter = Get.find<AllCategoriesController>();
  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());
  late Box<dynamic> notComorder;

  List<NotComplete_order> listofnotcomplet = [];
  Map<String, NotComplete_order> mapofnotcompletitem = {};

  @override
  void initState() {
    getdtatafromdatabase();
   // print("_myProdectListController ${_myProdectListController.item}");
    getmeasurementUnit();
    super.initState();
    keysOfMap = _myProdectListController.item.keys.toList();
    _myProdectListController.item.forEach((key, value) {
      TextEditingController textEditingDiscount = TextEditingController();
      textEditingDiscount.text = "0";
      textEditingControllerDiscount.add(textEditingDiscount);
    });
    if (_curenceController.defultCurrencies == null) {
      _curenceController.allCurrencie.forEach((key, value) {
        if (value.currencySymbolFirst == '1') {
          _curenceController.setCurrencie(
              allCurrencies: value, context: context);
          // defultCurrencies = value;
        }
      });
    }
  }

  getdtatafromdatabase() async {
    notComorder = await Hive.openBox<NotComplete_order>('NotCompleteorder');

    notComorder.values.forEach((element) {
      NotComplete_order s = element as NotComplete_order;

      if (Get
          .find<AllChequesController>()
          .customer
          .id == s.customerId) {

        mapofnotcompletitem[element.itemId] = element;
        _myProdectListController.setCount(
            count: double.parse(s.itemCount), id: s.itemId);
        _myProdectListController.setdiscount(val: s.descount, id: s.itemId);
        cartListItem.itemInCart.value = 0;

        _myProdectListController.countInCart();
      }
    });

    listofnotcomplet.forEach((element) {
      mapofnotcompletitem[element.itemId] = element;
    });
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                          top: size.height * .12,
                          child: Text(
                            'transaction'.tr,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      Positioned(
                          right: size.width * .05,
                          top: size.height * .05,
                          child: Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => Cart());
                                      },
                                      child: Icon(
                                        Icons.add_shopping_cart,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Obx(() {
                                        return Text(
                                            _myProdectListController.itemInCart
                                                .value
                                                .toString(),
                                            // cartListItem.itemInCart.value.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18));
                                      })
                                    ],
                                  ),
                                ],
                              ))),
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
                    height: size.height * .8,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[100]),
                                width: size.width * .8,
                                height: 50,
                                child: TextField(
                                  onChanged: (v) {
                                    if (v.length > 0) {
                                      _myProdectListController.setissearch(
                                          true);
                                      _myProdectListController.setsearchword(v);
                                    } else {
                                      _myProdectListController.setissearch(
                                          false);
                                      _myProdectListController.setsearchword(
                                          '');
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    suffixIcon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => Filter());
                                },
                                child: Container(
                                  width: size.width * .1,
                                  height: size.width * .1,
                                  child: Image.asset(
                                      'assets/images/filter.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            splashColor: Colors.orange,
                            onTap: () {
                              totalItem = 0;
                              double totalprice = 0;
                              cartListItem.itemInCart.value = 0;

                              _myProdectListController.countInCart();

                              Get
                                  .find<MyProdectListController>()
                                  .item
                                  .forEach((key, value) {
                                if (value.value.count > 0) {
                                  NotComplete_order a = NotComplete_order(
                                      itemCount: value.value.count.toString(),
                                      descount: value.value.diescount
                                          .toString(),
                                      itemId: value.value.id,
                                      customerId: Get
                                          .find<AllChequesController>()
                                          .customer
                                          .id);
                                  notComorder.add(a);
                                }
                              });
                              Get.snackbar('', "item added to cart ");
                            },
                            child: Container(
                              height: 50,
                              width: size.width * .9,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text('addtocart'.tr),
                              ),
                            ),
                          ),
                        ),
                        GetX<AllCategoriesController>(
                          builder: (logic) {
                            return logic.isflter.value
                                ? Expanded(
                                flex: 1,
                                child:
                                // GetX<MyProdectListController>(
                                //   builder: (logic) {
                                //     print('item ${logic.item}');
                                //     return
                                ListView.builder(
                                    itemCount: _myProdectListController.item
                                        .length,
                                    itemBuilder: (context, pos) {
                                      if (_myProdectListController
                                          .issearch) {
                                        if (_myProdectListController
                                            .item[keysOfMap[pos]]!.value
                                            .enName
                                            .contains(_myProdectListController
                                            .searchWord)) {
                                          // filterCategories.where((element) => element.id==categorie.id).length>0

                                          if (filter.filtersubCategories
                                              .where((element) =>
                                          element.id ==
                                              _myProdectListController
                                                  .item[
                                              keysOfMap[
                                              pos]]
                                                  !.value
                                                  .subCategoryId)
                                              .length >
                                              0 &&
                                              _myProdectListController
                                                  .item[keysOfMap[pos]]
                                                  !.value
                                                  .price >
                                                  filter.minRang &&
                                              _myProdectListController
                                                  .item[keysOfMap[pos]]
                                                  !.value
                                                  .price <
                                                  filter.maxRang) {
                                            return iteminthelist(
                                              unitslist: Get
                                                  .find<
                                                  PriceListsInfoController>()
                                                  .priceList[
                                              _myProdectListController
                                                  .item[keysOfMap[pos]]
                                                  !.value
                                                  .id]!,
                                              pos: pos,
                                              discountController:
                                              textEditingControllerDiscount[
                                              pos],
                                              products:
                                              _myProdectListController
                                                  !.item[keysOfMap[pos] ]!,
                                              size: size, list: [],
                                            );
                                          } else {
                                            return const SizedBox();
                                          }
                                        } else {
                                          return const SizedBox();
                                        }
                                      } else {
                                        //                               print('00000000000000000000000000000000000000000000000');
                                        //                               print(Get.find<PriceListsInfoController>().priceList[_myProdectListController
                                        //                                   .item[keysOfMap[pos]].value.id]);
                                        //                               print("id ${_myProdectListController
                                        // .item[keysOfMap[pos]].value.id}");
                                        //                               print(Get.find<PriceListsInfoController>().priceList);
                                        //
                                        //                               print('00000000000000000000000000000000000000000000000');
                                        if (filter.filtersubCategories
                                            .where((element) =>
                                        element.id ==
                                            _myProdectListController
                                                .item[keysOfMap[
                                            pos]]
                                               ! .value
                                                .subCategoryId)
                                            .length >
                                            0 &&
                                            _myProdectListController
                                                .item[keysOfMap[pos]]
                                                !.value
                                                .price >
                                                filter.minRang &&
                                            _myProdectListController
                                                .item[keysOfMap[pos]]
                                                !.value
                                                .price <
                                                filter.maxRang) {
                                          return iteminthelist(
                                            unitslist: Get
                                                .find<
                                                PriceListsInfoController>()
                                                .priceList[
                                            _myProdectListController
                                                .item[keysOfMap[pos]]
                                                !.value
                                                .id]!,
                                            pos: pos,
                                            discountController:
                                            textEditingControllerDiscount[
                                            pos],
                                            products:
                                            _myProdectListController
                                                .item[keysOfMap[pos]]!,
                                            size: size, list: [],
                                          );
                                          /////////////////////////////////////////////////////
                                        } else {
                                          return const SizedBox();
                                        }
                                      }
                                    })
                              //   },
                              // ),
                            )
                                : Expanded(
                                flex: 1,
                                child:

                                // GetBuilder<MyProdectListController>(
                                //   builder: (logic) {
                                //        print('0000000item ${logic.item}');
                                //     return

                                ListView.builder(
                                    itemCount: _myProdectListController.item
                                        .length,
                                    itemBuilder: (context, pos) {

                                      if (_myProdectListController
                                          .issearch) {
                                        if (_myProdectListController
                                            .item[keysOfMap[pos]]!.value
                                            .enName
                                            .contains(_myProdectListController
                                            .searchWord)||_myProdectListController
                                            .item[keysOfMap[pos]]!.value
                                            .itemNumber
                                            .contains(_myProdectListController
                                            .searchWord)) {
                                          // filterCategories.where((element) => element.id==categorie.id).length>0

                                          return iteminthelist(
                                            unitslist: Get
                                                .find<
                                                PriceListsInfoController>()
                                                .priceList[
                                            _myProdectListController
                                                .item[keysOfMap[pos]]
                                                !.value
                                                .id]!,
                                            pos: pos,
                                            discountController:
                                            textEditingControllerDiscount[
                                            pos],
                                            products:
                                            _myProdectListController
                                                .item[keysOfMap[pos]]!,
                                            size: size, list: [],
                                          );
                                        } else {
                                          return const SizedBox();
                                        }
                                      } else {

                                        return iteminthelist(
                                          unitslist: Get
                                              .find<
                                              PriceListsInfoController>()
                                              .priceList[
                                          _myProdectListController
                                              .item[keysOfMap[pos]]
                                             ! .value
                                              .id]!,
                                          pos: pos,
                                          discountController:
                                          textEditingControllerDiscount[
                                          pos],
                                          products:
                                          _myProdectListController
                                              !.item[keysOfMap[pos]]!,
                                          size: size, list: [],
                                        );
                                        /////////////////////////////////////////////////////
                                      }
                                    })
                              //   },
                              // ),
                            );
                          },
                        ),
                        Container(
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
                          height: size.height * .075,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15))),
                                height: size.height * .075,
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
                                  onTap: () async {
                                    if (!c.swatch.isRunning) {
                                      getMyLoction(firesvisittlocation!);

                                      c.startjor();
                                    } else {
                                      Get
                                          .find<MyProdectListController>()
                                          .item
                                          .forEach((key, value) {
                                        // if (value.value.count > 0) {
                                        //   NotComplete_order a = NotComplete_order(
                                        //       itemCount:
                                        //           value.value.count.toString(),
                                        //       descount:
                                        //           value.value.diescount.toString(),itemId: value.value.id,customerId: Get.find<AllChequesController>()
                                        //       .customer
                                        //       .id);
                                        //   notComorder.add(a);
                                        // }
                                      });

                                      getMyLoction(endvisittlocation!);
                                      DatabaseHelper()
                                          .insert_insert_visit(Insert_visit_DB(
                                        customer_id:
                                        Get
                                            .find<AllChequesController>()
                                            .customer
                                            .id,
                                        user_id:_userAndPermissions.user.id.toString(), employ_id: '', start_lat: '', start_lang: '', end_lat: '', end_lang: '', start_date: '', end_date: '', current_visit_status: '', visit_type: '',
                                      ))
                                          .then((value) {
                                        // Get
                                        //     .find<AllChequesController>()
                                        //     .customer =
                                        // null;

                                        Get.off(() => All_Customer());
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff2C4B89),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15))),
                                    height: size.height * .075,
                                    child: Center(
                                        child: Obx(() =>
                                            Text(
                                              c.startswatch.value
                                                  ? 'End Visit'
                                                  : 'start',
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
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }

  Widget iteminthelist({
  required List<PriceListsInfo> unitslist,
  required list,
  required Size size,
  required int pos,
  required Rx<TheItemInList> products,
  required TextEditingController discountController,
  }) {
    bool showdropdowen = (unitslist.length > 1);
    if (showdropdowen) {
      for (int i = 0; i < unitslist.length; i++) {
        // for(){}
        // if (unitslist[i]. == "yes") {//لو قميهالميجر بتساوي القيمه في اليست برايس
        // _myProdectListController.setprice(
        //     id: products.value.id,
        //     val: Get
        //         .find<PriceListsInfoController>()
        //         .priceList[products.value.id][0]
        //         .sellingPrice //unitslist[i].
        // );
        //_UnitController.val_Of_uint_map[products.value.id] = unitslist[i];
        //  }
      }
    }
    NotComplete_order? d = mapofnotcompletitem[products.value.id];
// TextEditingController counnttee=TextEditingController();
    //  discountController.text = products.value.diescount.toString();
    // print('0000000000000000000000000000000000000000000');
    // print(d!=null);
    // print(mapofnotcompletitem);
    // //print(notComorder.values);
    if (d != null) {

      // _myProdectListController.setCount(id: d.itemId,count: double.parse(d.itemCount));
      // _myProdectListController.setdiscount(
      //     id: d.itemId, val: d.descount);
      // products.value.count=double.parse(d.itemCount);
      // counnttee.text=d.itemCount;
      // discountController.text=d.descount;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          // height: size.height * .15,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      height: size.height * .15,
                      width: size.height * .15,
                      child: CachedNetworkImage(
                        imageUrl: products.value.pic,
                        height: size.height * .1,
                        width: size.height * .1,
                      ) //_netWorkController.connectionStatus.value ?
                    // Image
                    //     .network(
                    //   products.value.pic,
                    //   height: size.height * .1,
                    //   width: size.height * .1,
                    // ) //: Image.asset('assets/images/noimage.png'),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          Get.locale!.languageCode == "en"
                              ? products.value.enName
                              : products.value.arName,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text('minimumquantity'.tr +
                            ': ' +
                            '${products.value.minimumQuantity}'),
                        //products.itemDetails[0].itemCost
                        GetBuilder<PriceListsInfoController>(
                            builder: (logic) {

                              return
                                Text('price'.tr +
                                    ': ' +
                                    '${(_myProdectListController
                                        .item[keysOfMap[pos]]
                                        !.value.price * double.parse(
                                        _curenceController.defultCurrencies
                                            .currencyRate)).toStringAsFixed(
                                        3)}');
                            }),
                        //   Expanded(child: Container()),
                        // Obx(() {
                        //   return Text('price'.tr +
                        //       ': ' +
                        //       '${( _myProdectListController
                        //           .item[keysOfMap[pos]]
                        //           .value.price * double.parse(
                        //           _curenceController.defultCurrencies
                        //               .currencyRate)).toStringAsFixed(3)}');
                        // })
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                trailing: SizedBox.shrink(),
                title: Row(
                  children: [
                    Text('details'.tr),
                    Expanded(
                      child: Container(
                        height: 1,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: size.width * .2,
                          child:
                          Center(child: GetBuilder<MyProdectListController>(
                            builder: (logic) {
                              // textEditingController.text = logic
                              //     .item[products.value.id].value.count
                              //     .toString();

                              return TextField(
                                //controller: counnttee,
                                onChanged: (v) {
                                  if (v != null && v.isNotEmpty) {
                                    if (isinvoiceOrSalesOrderOrReturnInvoice ==
                                        'invoice') {
                                      if (int.parse(v) <=
                                          _myProdectListController
                                              .item[keysOfMap[pos]]
                                              !.value
                                              .quantity_in_store) {
                                        _myProdectListController.setCount(
                                            id: _myProdectListController
                                                .item[keysOfMap[pos]]!.value.id,
                                            count: double.parse(v));
                                      } else {
                                        Get.snackbar('',
                                            'لا يمكنك ادخال كمية اكبر من الموجودة في المخزن');
                                      }
                                    }

                                    _myProdectListController.setCount(
                                        id: _myProdectListController
                                            .item[keysOfMap[pos]]!.value.id,
                                        count: double.parse(v));
                                  }
                                },
                                onEditingComplete: () {},
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                              );
                            },
                          )),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     if (isinvoiceOrSalesOrderOrReturnInvoice ==
                        //         'invoice') {
                        //       if (_myProdectListController
                        //                   .item[products.value.id].value.count +
                        //               1 <=
                        //           _myProdectListController
                        //               .item[products.value.id]
                        //               .value
                        //               .quantity_in_store) {
                        //         int v = _myProdectListController
                        //                 .item[products.value.id].value.count +
                        //             1;
                        //
                        //         _myProdectListController.setCount(
                        //             id: products.value.id, count: v);
                        //       } else {
                        //         Get.snackbar('',
                        //             'لا يمكن ادخال رقم اكبر من الموجود في المخزن');
                        //       }
                        //     } else {
                        //       int v = _myProdectListController
                        //               .item[products.value.id].value.count +
                        //           1;
                        //
                        //       _myProdectListController.setCount(
                        //           id: products.value.id, count: v);
                        //     }
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         color: Colors.orange,
                        //         borderRadius: BorderRadius.circular(2)),
                        //     height: 50,
                        //     width: 50,
                        //     child: Center(
                        //       child: Text(
                        //         "+",
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 20,
                        //             color: Colors.white),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     //categories.categoryNameEn
                      //     child: Text("category Name")),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text('itemnumber'.tr +
                      //           ': ' +
                      //           '${products.value.id}'),
                      //       // Container(
                      //       //     child: Text(
                      //       //         'item name:  ${products.itemDetails[0].itemNameEn}'))
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       // Text(
                      //       //     'Item Price :${products.itemDetails[0].itemCost}'),
                      //       Text('tax'.tr + ':  ' + '${(products.value.tex*double.parse(_curenceController.defultCurrencies.currencyRate)).toStringAsFixed(3)}')
                      //     ],
                      //   ),
                      // ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'promotion'.tr,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Widget okButton = TextButton(
                            //   child: Text("OK"),
                            //   onPressed: () {
                            //     Navigator.of(context).pop();
                            //   },
                            // );
                            // AlertDialog alert = AlertDialog(
                            //   title: Center(
                            //     child: Text(
                            //       'promotionlist'.tr,
                            //       style: TextStyle(color: Colors.red),
                            //     ),
                            //   ),
                            //   content: Container(
                            //     height: size.height * .8,
                            //     width: size.width * .8,
                            //     child: ListView(
                            //       children: alert_item,
                            //     ),
                            //   ),
                            //   actions: [
                            //     okButton,
                            //   ],
                            // );
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return alert;
                            //   },
                            // );
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/iso.PNG',
                                width: 30,
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'showallpromotion'.tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('storeid'.tr),
                                Container(
                                  width: size.width * .25,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    //{stocitem[0].storeId}
                                    child: Text(""),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text('unit'.tr),
                                //  Obx(()=>
                                Container(
                                  width: size.width * .25,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: showdropdowen
                                        ?
                                    GetBuilder<PriceListsInfoController>(
                                      builder: (logic) {
                                        return
                                          DropdownButton<
                                              PriceListsInfo>(
                                            value: Get
                                                .find<
                                                PriceListsInfoController>()
                                                .val_Of_PriceListsInfo_map[
                                            products.value.id],
                                            icon: const Icon(
                                                Icons.arrow_downward),
                                            iconSize: 24,
                                            elevation: 16,
                                            style: const TextStyle(
                                                color: Colors.deepPurple),
                                            underline: Container(
                                              height: 2,
                                              color:
                                              Colors.deepPurpleAccent,
                                            ),
                                            onChanged:
                                                (PriceListsInfo? newValue) {
                                              // Get
                                              //     .find<
                                              //     PriceListsInfoController>()
                                              //     .val_Of_PriceListsInfo_map[
                                              // products
                                              //     .value.id]
                                              //
                                              //
                                              // = newValue;

                                              // _myProdectListController
                                              //        .item[products.value.id]
                                              //        .value
                                              //        .price=1000;
                                              Get
                                                  .find<
                                                  PriceListsInfoController>()
                                                  .setvalofdrob(
                                                  val: newValue!, id: products
                                                  .value.id);


                                              // _myProdectListController
                                              //     .setprice(
                                              //     id: products.value.id,
                                              //     val: 1000.toString());

                                              //  print("_myProdectListController ${_myProdectListController
                                              //      .item[products.value.id]
                                              //      .value
                                              //      .price}");
                                              // print("_myProdectListController ${products.value.id}");
                                              //setState(() {});
                                            },
                                            items: unitslist.map<
                                                DropdownMenuItem<
                                                    PriceListsInfo>>(
                                                    (PriceListsInfo value) {
                                                  return DropdownMenuItem<
                                                      PriceListsInfo>(
                                                    value: value,
                                                    child: Text(value.unit),
                                                  );
                                                }).toList(),
                                          );
                                      },
                                    )
                                        : Text(unitslist[0].unit),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text('quantity'.tr),
                                Container(
                                  width: size.width * .25,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Obx(() {

                                      return Text(_myProdectListController
                                          .item[products.value.id]!.value.quantity_in_store.toString()
                                          // products.value.quantity_in_store
                                          //     .toString()
                                      );
                                    }),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('bounce'.tr),
                                Container(
                                  width: size.width * .4,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child:
                                    Get
                                        .find<EmployeePermissionsController>()
                                        .employeePermissions[0]
                                        .addBonus ==
                                        "yes"
                                        ? TextField(textAlign: TextAlign.center,
                                      onChanged: (v) {
                                        if (v != null) {
                                          if (!v.isEmpty) {
                                            _myProdectListController.setbonce(
                                                id: d!. itemId!, val: v);
                                          }
                                        }
                                      },)
                                        : Obx(() {
                                      return Text(products.value.bonce
                                          .toString());
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            if (Get
                                .find<EmployeePermissionsController>()
                                .employeePermissions[0]
                                .addItemDiscount ==
                                "yes")
                              Column(
                                children: [
                                  Text('discount'.tr),
                                  Container(
                                    width: size.width * .4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: TextField(
                                      //controller: discountController,
                                      //                    onChanged: textEditingdiscount,
                                      keyboardType: TextInputType.number,
                                      onChanged: (v) {
                                        //  if (v != null && v.isNotEmpty) {
                                        _myProdectListController.setdiscount(
                                            id: products.value.id, val: v);
                                        // }
                                      },
                                      // controller: discountController,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () =>
                                              discountController.clear(),
                                          icon: Icon(Icons.clear),
                                        ),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('inputqty'.tr),
                                Container(
                                    width: size.width * .4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: Center(
                                      child:
                                      GetBuilder<MyProdectListController>(
                                        builder: (logic) {
                                          return Text(logic
                                              .item[products.value.id]
                                              !.value
                                              .count
                                              .toString());
                                        },
                                      ),
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Text('pricebeforediscount'.tr),
                                Container(
                                  width: size.width * .4,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: GetBuilder<MyProdectListController>(
                                      builder: (logic) {
                                        return Text((logic
                                            .item[products.value.id]
                                            !.value
                                            .befordes *
                                            double.parse(_curenceController
                                                .defultCurrencies
                                                .currencyRate))
                                            .toStringAsFixed(3));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),  Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text('priceafterdiscount'.tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              width: size.width * .35,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: GetBuilder<MyProdectListController>(
                                  builder: (logic) {
                                    return Text((logic
                                        .item[products.value.id]
                                        !.value
                                        .afterdes *
                                        double.parse(_curenceController
                                            .defultCurrencies
                                            .currencyRate))
                                        .toStringAsFixed(3));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                     if(  Get.find<AllChequesController>()
                         .customer.taxStatus=="yes")       Column(
                              children: [
                                Text('tax'.tr + ' %'),
                                Container(
                                  width: size.width * .35,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child:
                                          Text((products.value.tex*double.parse(_curenceController.defultCurrencies.currencyRate)).toString())),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text('netprice'.tr),
                                Container(
                                  width: size.width * .4,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(child:
                                  GetBuilder<MyProdectListController>(
                                    builder: (logic) {
                                      return Text((logic.item[products.value.id]
                                          !.value.totalPriceForItem *
                                          double.parse(_curenceController
                                              .defultCurrencies
                                              .currencyRate))
                                          .toStringAsFixed(3));
                                    },
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if(  Get.find<AllChequesController>()
                          .customer.taxStatus=="yes")      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('totaltax'.tr),
                                Container(
                                    width: size.width * .4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child:
                                          GetBuilder<MyProdectListController>(
                                        builder: (logic) {
                                          return Text((logic
                                              .item[products.value.id]
                                              !.value
                                              .totalTaxForItem*double.parse(_curenceController.defultCurrencies.currencyRate))
                                              .toStringAsFixed(3));
                                        },
                                      ),
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Text('netprice'.tr),
                                Container(
                                  width: size.width * .4,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(child:
                                      GetBuilder<MyProdectListController>(
                                    builder: (logic) {
                                      return Text((logic.item[products.value.id]
                                          !.value.totalPriceForItem*double.parse(_curenceController.defultCurrencies.currencyRate))
                                          .toStringAsFixed(3));
                                    },
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Container(
                            //   width: size.width * .4,
                            //   height: 50,
                            //   decoration: BoxDecoration(
                            //       border: Border.all(
                            //         color: Color(0xff2C4B89),
                            //         width: 1,
                            //       ),
                            //       borderRadius: BorderRadius.circular(10)),
                            //   child: Center(child: Text('Cancel')),
                            // ),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       color: Color(0xff2C4B89),
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //     height: 50,
                            //     width: size.width * .4,
                            //     child: Center(
                            //       child: Text(
                            //         'ok',
                            //         style: TextStyle(color: Colors.white),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getmeasurementUnit() {
    // print(Get.find<ItemUnitsController>().itemUnitsmap );
    List<List<ItemUnits>> MeasurementUnit2 = [];
    for (int uu = 0;
    uu < Get
        .find<PriceListsInfoController>()
        .priceList
        .length;
    uu++) {
      MeasurementUnit2.add([]);
    }

    //  List<String>MeasurementUnit=[];

    for (int i = 0;
    i < Get
        .find<PriceListsInfoController>()
        .priceList
        .length;
    i++) {
      //    MeasurementUnit.clear();
//print(Get.find<ItemUnitsController>().itemUnitsmap );
      // for (int p = 0;
      // p < allCustomers.priceListsInfo[i].itemUnits.length;
      // p++) {
      //   MeasurementUnit2[i].add(allCustomers.priceListsInfo[i].itemUnits[p]);
      //
      //   //  MeasurementUnit.add( allCustomers.priceListsInfo[i].itemUnits[p].itemMeasurementUnits);
      //
      // }
      //
      // _UnitController
      //     .MeasurementUnit_map[allCustomers.priceListsInfo[i].itemId] =
      // MeasurementUnit2[i];
    }
  }
}

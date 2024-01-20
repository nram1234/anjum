import 'package:anjum/SCR/products.dart';
import 'package:anjum/controllers/allCategoriesController.dart';
import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/all_promotionsController.dart';
import 'package:anjum/controllers/unitController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/jsonofnwetry/get_Fifth_step_json.dart';
import 'package:anjum/utilitie/invoiceOrSalesOrderOrReturnInvoice.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'allChequesController.dart';
import 'allStockItemsController.dart';

class MyProdectListController extends GetxController {
  Map<int,Map<String,TextEditingController>>mapofcontrpoler={};
  List<Widget> liPro = [];
  Map<String, int> mapofpounce = {};
  Map<String, Rx<TheItemInList>> myitemPro = {};
  List<Map<String, AllInQuantityPromotionItems>> itemInPro = [];
  final All_PromotionsController _all_promotionsController =
  Get.find<All_PromotionsController>();

  bool issearch = false;
  String searchWord = "";
  Map<String, Rx<TheItemInList>> item = Map<String, Rx<TheItemInList>>();

  Map<String, Rx<TheItemInList>> itemprodecttest = Map<String, Rx<TheItemInList>>();
  final AllItemsController bata = Get.find<AllItemsController>();
  RxDouble grandTotal = 0.0.obs;
  RxDouble totalTax = 0.0.obs;
  final AllStockItemsController _allStockItemsController =
  Get.find<AllStockItemsController>();

  RxDouble totalpriceincart = 0.0.obs;
  RxDouble totalTaxincart = 0.0.obs;
  RxDouble totalDiscountincart = 0.0.obs;
  RxDouble sumOftotalDiscountincart = 0.0.obs;

  var itemInCart = 0.obs;

  setsearchword(String v) {
    searchWord = v;
    update();
  }

  setissearch(bool v) {
    issearch = v;
    update();
  }

  settotalDiscountincart({required String v}) {
    totalDiscountincart.value = double.parse(v) / 100;
    gettotalpriceincart();
    update();
  }

    totalDiscount() {
    double totoal = 0;
    item.forEach((key, value) {
      if (value.value.count > 0) {
        totoal += (value.value.price * (value.value.diescount / 100)) +
            (value.value.price * (totalDiscountincart / 100));
      }
    });
  }

  gettotalpriceincart() {
    totalpriceincart.value = 0;
    totalTaxincart.value = 0;
    sumOftotalDiscountincart.value = 0;
    item.forEach((key, value) {
      if (value.value.count > 0) {
        //print(" totalpriceincart        ${(value.value.afterdes )-((value.value.afterdes )* totalDiscountincart.value)}");
        totalpriceincart.value += (value.value.afterdes) -
            ((value.value.afterdes) * totalDiscountincart.value);
        sumOftotalDiscountincart.value =
            value.value.afterdes * totalDiscountincart.value;

        totalTaxincart.value += (((value.value.afterdes) -
            ((value.value.afterdes) * totalDiscountincart.value)) *
            value.value.tex /
            100);
      }
    });
  }

  getlistpromiision() {
    int count = 0;
    Map<String, Rx<TheItemInList>> itemtoprom = {};

    item.forEach((key, value) {
      if (value.value.count > 0) {}
    });
    // item.forEach((key, value) {
    //   List<Widget> myWidgets = [];
    //
    //   _all_promotionsController.allPromotionss.forEach((element) {
    //
    //
    //
    //     if (value.value.count > 0 &&
    //         value.value.count > int.parse(element.minimumQuantityValue)) {
    //       element.allInQuantityPromotionItems.forEach((element) {
    //
    //
    //         if (value.value.id == element.itemId) {
    //           myWidgets.add(Row(
    //             children: [
    //               Text(value.value.name),
    //               Container(
    //                 width: 60,
    //                 child: TextField(
    //                   onChanged: (v) {
    //                     if (v != null) {
    //                       setbonce(id: value.value.id, val: v);
    //                     }
    //                   },
    //                 ),
    //               )
    //             ],
    //           ));
    //         }
    //       });
    //     }
    //   });
    //   listofPro.add(myWidgets);
    // });
  }
  newItemForTestprod(){

  }
  myoninit(){
    print("77777777777777777777777777  $item");
    print("779999  $itemprodecttest");
    if (_allStockItemsController.allStockItems.length!= 0) {
      for (int i = 0; i < bata.allItems.length; i++) {





        // print('allStockItems ${_allStockItemsController.allStockItems[i]}');
        for (int p = 0;
        p < _allStockItemsController.allStockItems.length;
        p++) {
          if (bata.allItems[i].itemId ==
              _allStockItemsController.allStockItems[p].itemId) {
//print("itemNameAr  ${bata.allItems[i].itemDetails[0].itemNameAr}");
            if(double.parse(bata.allItems[i].itemDetails[0].sellingPrice)>Get.find<AllCategoriesController>().maxRang){
              Get.find<AllCategoriesController>().updatamaxRangVal(double.tryParse(bata.allItems[i].itemDetails[0].sellingPrice));
            }
            if(double.parse(bata.allItems[i].itemDetails[0].sellingPrice) <Get.find<AllCategoriesController>().minRang){
              Get.find<AllCategoriesController>().updatamaxRangVal (double.tryParse(bata.allItems[i].itemDetails[0].sellingPrice));
            }
            item[bata.allItems[i].itemId] = TheItemInList(arName: bata.allItems[i].itemDetails[0].itemNameAr,
                totalPriceForItem: 0,
                totalTaxForItem: 0,subCategoryId: bata.allItems[i].itemDetails[0].subCategoryId,shoow: true,
                quantity_in_store: double.parse(
                    _allStockItemsController.allStockItems[p].quantity),
                count: 0,
                measurementUnitId: int.parse(_allStockItemsController
                    .allStockItems[p].measurementUnitId),
                id: bata.allItems[i].itemId,
                tex: double.parse(bata.allItems[i].itemDetails[0].tax),
                befordes: double.parse(
                    bata.allItems[i].itemDetails[0].sellingPrice),
                price: double.parse(
                    bata.allItems[i].itemDetails[0].sellingPrice),
                enName: bata.allItems[i].itemDetails[0].itemNameEn,
                afterdes: double.parse(
                    bata.allItems[i].itemDetails[0].sellingPrice),
                itemNumber: bata.allItems[i].itemDetails[0].itemNumber,
                minimumQuantity:
                bata.allItems[i].itemDetails[0].minimumQuantity,
                pic: bata.allItems[i].itemDetails[0].image,
                bonce: 0,
                categoryId:
                int.parse(bata.allItems[i].itemDetails[0].categoryId),
                diescount: 0)
                .obs;
          }
        }
      }
    }else{
      for (int ii = 0; ii < bata.allItems.length; ii++) {

        item[bata.allItems[ii].itemId] = TheItemInList(arName: bata.allItems[ii].itemDetails[0].itemNameAr,
            totalPriceForItem: 0,
            totalTaxForItem: 0,subCategoryId: bata.allItems[ii].itemDetails[0].subCategoryId,shoow: true,
            quantity_in_store:100000,
            count: 0,
            measurementUnitId: 10,
            id: bata.allItems[ii].itemId,
            tex: double.parse(bata.allItems[ii].itemDetails[0].tax),
            befordes: double.parse(
                bata.allItems[ii].itemDetails[0].sellingPrice),
            price: double.parse(
                bata.allItems[ii].itemDetails[0].sellingPrice),
            enName: bata.allItems[ii].itemDetails[0].itemNameEn,
            afterdes: double.parse(
                bata.allItems[ii].itemDetails[0].sellingPrice),
            itemNumber: bata.allItems[ii].itemDetails[0].itemNumber,
            minimumQuantity:
            bata.allItems[ii].itemDetails[0].minimumQuantity,
            pic: bata.allItems[ii].itemDetails[0].image,
            bonce: 0,
            categoryId:
            int.parse(bata.allItems[ii].itemDetails[0].categoryId),
            diescount: 0)
            .obs;



      }
    }
  }
  @override
  void onInit() {

// bata.allItems.forEach((element) {
//
//   print('${element.itemDetails[0].itemNameEn}');
//           item[element.itemId] = TheItemInList(
//                   totalPriceForItem: 0,
//                   totalTaxForItem: 0,
//                   quantity_in_store: 100,
//                   count: 0,
//                   measurementUnitId: 100,
//                   id: element.itemId,
//                   tex: 5.5,//double.parse(element.itemDetails[0].tax),
//                   befordes: double.parse(
//                       element.itemDetails[0].sellingPrice),
//                   price: double.parse(
//                       element.itemDetails[0].sellingPrice),
//                   name: element.itemDetails[0].itemNameEn,
//                   afterdes: double.parse(
//                       element.itemDetails[0].sellingPrice),
//                   itemNumber: element.itemDetails[0].itemNumber,
//                   minimumQuantity:
//                   element.itemDetails[0].minimumQuantity,
//                   pic: element.itemDetails[0].image,
//                   bonce: 0,
//                   categoryId:
//                       int.parse(element.itemDetails[0].categoryId),
//                   diescount: 0)
//               .obs;
// });

  }

  mypro() {
    int aaa = 0;
    _all_promotionsController.allPromotionss.forEach((element) {
      Map<String, AllInQuantityPromotionItems> oo = {};
      if (element.strictlyListedItem == 'no') {
        element.allInQuantityPromotionItems.forEach((el) {
          oo[el.itemId] = el;
        });
      } else {
        element.allInQuantityPromotionItems.forEach((el) {
          item.forEach((key, value) {
            // print(value.value.count);
            // print(element.allInQuantityPromotionItems.contains(value.value.id));
            // print(element.allInQuantityPromotionItems);

            if (value.value.count > 0 && value.value.id == el.itemId) {
              oo[el.itemId] = el;
            }
          });
        });
      }
      itemInPro.add(oo);
      aaa++;
    });
    update();
  }

  setCount({required String id,required double count}) {




    item[id]!.value.count = count;
    item[id]!.value.befordes = item[id]!.value.price * item[id]!.value.count;
    item[id]!.value.afterdes = (item[id]!.value.price * item[id]!.value.count) -
        ((item[id]!.value.price * item[id]!.value.count) *
            (item[id]!.value.diescount / 100));



    setTotalPriceAndTotalTex(id: id);

    getTotalTax();
    netprice();
    gettotalpriceincart();

    update();
  }
  setcountinstore({required String id,required double count}){
    // print('999999999999999999999999999');
    // print (id);
    // print (count);
    //
    // print(item[id].value.quantity_in_store-count);
    if(isinvoiceOrSalesOrderOrReturnInvoice=='invoice'){
      item[id]!.value.quantity_in_store=item[id]!.value.quantity_in_store-count;
    }
    if(isinvoiceOrSalesOrderOrReturnInvoice=='return_invoice'){
      item[id]!.value.quantity_in_store=item[id]!.value.quantity_in_store+count;
    }
    // print (item[id].value.quantity_in_store);

    update();
  }
  setTotalPriceAndTotalTex({required String id}) {
    print(id);

    item[id]!.value.totalTaxForItem =
        item[id]!.value.afterdes * (item[id]!.value.tex / 100);
    item[id]!.value.totalPriceForItem =
        item[id]!.value.afterdes + item[id]!.value.totalTaxForItem;


    //  update();
  }

  setprice({required String id,required String val}) {
    item[id]?.value.price = double.parse(val);

    item[id]!.value.befordes = item[id]!.value.price * item[id]!.value.count;
    item[id]?.value.afterdes = (item[id]!.value.price * item[id]!.value.count) -
        ((item[id]!.value.price * item[id]!.value.count) *
            (item[id]!.value.diescount / 100));
    setTotalPriceAndTotalTex(id: id);
    getTotalTax();
    netprice();
    gettotalpriceincart();
    //update();
  }

  setbonce({required String id,required String val}) {
    item[id]!.value.bonce = double.parse(val);
    //  update();
  }

  setdiscount({required String id,required String val}) {
    if (val != null && val.isNotEmpty) {
      if(item[id]!=null){
        item[id]!.value.diescount = double.parse(val);
        item[id]!.value.afterdes = (item[id]!.value.price * item[id]!.value.count) -
            ((item[id]!.value.price * item[id]!.value.count) *
                (double.parse(val) / 100));

        totalTax.value = item[id]!.value.afterdes * item[id]!.value.tex;
      }

      setTotalPriceAndTotalTex(id: id);
      getTotalTax();
      netprice();
      //  gettotalpriceincart();
      // update();

    }
  }

  netprice() {
    grandTotal.value = 0;
    item.forEach((key, value) {
      grandTotal.value =
          grandTotal.value + (value.value.afterdes * value.value.count);
    });
    grandTotal.value = grandTotal.value + totalTax.value;
    gettotalpriceincart();
    //update();
  }

  getTotalTax() {
    totalTax.value = 0;
    item.forEach((key, value) {
      totalTax.value =
          totalTax.value + (value.value.afterdes * value.value.tex);
    });

    //update();
  }

  deletItem(Rx<TheItemInList> products) {
    products.value.count = 0;
    itemInCart.value = 0;
    countInCart();
    // update();
  }

  countInCart() {
    itemInCart.value =
        item.entries.where((element) => element.value.value.count > 0).length;
    update();
  }

  mytray() {
    liPro.clear();
    DateTime now = new DateTime.now();
    Map<String,double> pouncemap={};
    Map<int, Map<String, dynamic>> mapofall = {};
    for (int i = 0; i < _all_promotionsController.allPromotionss.length; i++) {
      bool indate;
      Map<String, dynamic> g = {};

      bool isinall_group_customers = false;
      bool isinall_group_salesmans = false;
      _all_promotionsController.allPromotionss[i].allGroupCustomers
          .forEach((element) {
        if (element.customerId ==
            Get.find<AllChequesController>().customer_id) {
          isinall_group_customers = true;
        }
      });
      _all_promotionsController.allPromotionss[i].allGroupSalesmans
          .forEach((element) {
        if (int.parse(element.employeeId) ==
            Get.find<UserAndPermissions>().user.id) {
          isinall_group_salesmans = true;
        } else {
          isinall_group_salesmans = false;
        }
      });

      DateTime startDateTime = DateTime.parse(
          _all_promotionsController.allPromotionss[i].startDateTime);
      DateTime endDateTime = DateTime.parse(
          _all_promotionsController.allPromotionss[i].endDateTime);
      if (now.isBefore(endDateTime) && now.isAfter(startDateTime)) {
        indate = true;
      } else {
        indate = false;
      }

      g['isinall_group_salesmans'] = isinall_group_salesmans;
      g['isinall_group_customers'] = isinall_group_customers;
      g['active'] = indate;

      g['bonusQty'] = _all_promotionsController.allPromotionss[i].bonusQty;

      g['isBonusDuplicate'] =
          _all_promotionsController.allPromotionss[i].isBonusDuplicate;

      g['minimumQuantityValue'] =
          _all_promotionsController.allPromotionss[i].minimumQuantityValue;

      g['strictlyListedItem'] =
          _all_promotionsController.allPromotionss[i].strictlyListedItem;
      // mapofall[i] = g;

      g['AllInQuantity'] = _all_promotionsController
          .allPromotionss[i].allInQuantityPromotionItems;

      //   mapofall[i] = g;
      g['AllOutQuantityPromotionItems'] = _all_promotionsController
          .allPromotionss[i].allOutQuantityPromotionItems;
      mapofall[i] = g;
      List<Rx<TheItemInList>> itemm = [];
      double ii = 0;
      item.forEach((key, value) {
        Map<String,List<TextEditingController>>     textcontrol={};
        _all_promotionsController.allPromotionss[i].allOutQuantityPromotionItems
            .forEach((el) {

          if (value.value.count > 0 && value.value.id == el.itemId) {

            ii += value.value.count;
            itemm.add(value);
          }

          print("ii  $ii      $i");
          g['QuantityValue'] = ii;
          mapofall[i] = g;
        });
      });
      g['iteminlist'] = itemm;
      mapofall[i] = g;
    }

    mapofall.forEach((key, value) {
      print('isinall_group_salesmans ${value['isinall_group_salesmans']}');
      print('isinall_group_customers ${value['isinall_group_customers']}');
      print('active ${value['active']}');
      if (value['isinall_group_salesmans'] == true &&
          value['isinall_group_customers'] == true &&
          value['active'] == true) {
        int youget = 0;
        if (value['isBonusDuplicate'] == '1') {
          double pp = (value['QuantityValue'] /
              int.parse(value['minimumQuantityValue']));
          youget = pp.toInt() * int.parse(value['bonusQty']);
        } else {
          youget = int.parse(value['bonusQty']);
        }
        ;

        if (value['QuantityValue'] >=
            int.parse(value['minimumQuantityValue'])) {
          liPro.add(Container(
              color: Colors.orange,
              child: Column(
                children: [
                  Center(child: Text('العرض رقم ${key + 1}')),
                  Center(child: Text('ستحصل علي ${youget}')),
                ],
              )));
          if (value['strictlyListedItem'] == 'yes') {
            List<Rx<TheItemInList>> _myv = value['iteminlist'];
            _myv.forEach((element) {
              if (pouncemap[element.value.id]== null) {
                pouncemap[element.value.id]=0;}
              pouncemap[element.value.id]=0;
              if (mapofpounce[element.value.id] == null) {
                pouncemap[element.value.id]=0;
                mapofpounce[element.value.id] = youget;

              } else {
                mapofpounce[element.value.id]  =mapofpounce[element.value.id]!+ youget;
              }
              liPro.add(Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Text(element.value.enName)),
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(4)),
                            width: 50,
                            height: 25,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              // onChanged: (v) {
                              //   // if (v != null) {
                              //   //   if (int.parse(v) <= youget) {
                              //   //     print(
                              //   //         (element.value.bonce + int.parse(v)) <=
                              //   //             mapofpounce[element.value.id]);
                              //   //     print(element.value.bonce + int.parse(v));
                              //   //     if ((element.value.bonce + int.parse(v)) <=
                              //   //         mapofpounce[element.value.id]) {
                              //   //       setbonce(
                              //   //           id: element.value.id,
                              //   //           val: (element.value.bonce +
                              //   //                   int.parse(v))
                              //   //               .toString());
                              //   //     } else {
                              //   //       setbonce(id: element.value.id, val: v);
                              //   //     }
                              //   //   } else {
                              //   //     Get.snackbar('', 'تاكد من الرقم الصحيح');
                              //   //   }
                              //   // }
                              // },
                              onSubmitted: (v){   if (v != null) {
                                if (int.parse(v) <= youget) {



                                  pouncemap[element.value.id]=pouncemap[element.value.id] !+ int.parse(v);
                                  // setbonce(
                                  //     id: element.value.id,
                                  //     val: (element.value.bonce +
                                  //         int.parse(v))
                                  //         .toString());

                                } else {
                                  Get.snackbar('', 'تاكد من الرقم الصحيح');
                                }
                              }},
                            ),
                          )
                        ],
                      ),
                      // Text(
                      //     '${element.minimumQuantityValue} get  ${element
                      //         .bonusQty}     / $youget ')
                    ],
                  ),
                ),
              ));
            });
          } else {
            List<AllOutQuantityPromotionItems> _allitemout =
            value['AllOutQuantityPromotionItems'];

            _allitemout.forEach((elll) {
              item.forEach((key, vll) {

                if (elll.itemId == vll.value.id) {
                  if (pouncemap[vll.value.id]== null) {
                    pouncemap[vll.value.id]=0;}
                  if (mapofpounce[vll.value.id] == null) {

                    mapofpounce[vll.value.id] = youget;
                  } else {
                    mapofpounce[vll.value.id]=mapofpounce[vll.value.id]!+ youget;
                  }

                  liPro.add(Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: Text(vll.value.enName)),
                              Container(
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(4)),
                                width: 50,
                                height: 25,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  onSubmitted: (v) {
                                    if (v != null) {
                                      if (int.parse(v) <= youget) {


                                        pouncemap[vll.value.id]=vll.value.bonce + double.parse(v);
                                        // setbonce(
                                        //     id: vll.value.id,
                                        //     val: (vll.value.bonce +
                                        //         int.parse(v))
                                        //         .toString());

                                        //  setbonce(id: vll.value.id,val: v);
                                      } else {
                                        Get.snackbar(
                                            '', 'تاكد من الرقم الصحيح');
                                      }
                                    }

                                  },
                                ),
                              )
                            ],
                          ),
                          // Text(
                          //     '${element.minimumQuantityValue} get  ${element
                          //         .bonusQty}     / $youget ')
                        ],
                      ),
                    ),
                  ));
                }
              });
            });
          }
        }
      }
    });
    liPro.add(GestureDetector(
      onTap: () {
        print(mapofpounce);
        pouncemap.forEach((key, value) {
          print('$key   $value');
          item.forEach((ke, va) {
            if(key==ke){
              setbonce(id: ke,val: value.toString());
            }
          });
        });
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
    print(liPro);
  }
}

class MytrayItem {
  String id;
  String name;
  int count;

  MytrayItem({required this.id,required this.name,required this.count});
}

class TheItemInList {
  bool shoow;
  String arName;
  String id;
  double diescount;
  double bonce;
  String enName;
  double price;
  double tex;
  double quantity_in_store;
  double count;
  double afterdes;
  double befordes;
  double totalPriceForItem;
  double totalTaxForItem;
  String pic;
  String itemNumber;
  String minimumQuantity;
  int categoryId;
  String subCategoryId;
  int measurementUnitId;

  TheItemInList(
      {required this.id,required this.arName,required this.subCategoryId,required this.shoow,
       required  this.diescount,
       required  this.quantity_in_store,
       required  this.bonce,
       required  this.enName,
       required  this.price,
       required  this.tex,
       required  this.count,
       required  this.afterdes,
       required  this.befordes,
       required  this.totalPriceForItem,
       required  this.totalTaxForItem,
       required  this.pic,
       required  this.itemNumber,
       required  this.minimumQuantity,
       required  this.categoryId,
       required  this.measurementUnitId});
}

// TheItemInList(
// count: 0,
// id: bata.allItems[i].itemId,
// tex: double.parse(bata.allItems[i].itemDetails[0].tax),
// befordes:double.parse( _UnitController.val_Of_uint_map[bata.allItems[i].itemId]
// .sellingPrice), price:  double.parse( _UnitController.val_Of_uint_map[bata.allItems[i].itemId]
// .sellingPrice),name: bata.allItems[i].itemDetails[0].itemNameEn,afterdes:double.parse( _UnitController.val_Of_uint_map[bata.allItems[i].itemId]
// .sellingPrice),grandTotal: 0,totalTax: 0 )
// .obs;

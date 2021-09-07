import 'package:anjum/SCR/products.dart';
import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/all_promotionsController.dart';
import 'package:anjum/controllers/unitController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'allChequesController.dart';
import 'allStockItemsController.dart';

class MyProdectListController extends GetxController {
  List<Widget> liPro = [];

  Map<String, Rx<TheItemInList>> myitemPro = {};
  List<Map<String, AllInQuantityPromotionItems>> itemInPro = [];
  final All_PromotionsController _all_promotionsController =
  Get.find<All_PromotionsController>();

  bool issearch = false;
  String searchWord = "";
  Map<String, Rx<TheItemInList>> item = Map<String, Rx<TheItemInList>>();
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

  settotalDiscountincart({String v}) {
    totalDiscountincart.value = double.parse(v) / 100;
    gettotalpriceincart();
    update();
  }

  String totalDiscount() {
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

  @override
  void onInit() {
    if (item.length == 0) {
      for (int i = 0; i < bata.allItems.length; i++) {
        for (int p = 0;
        p < _allStockItemsController.allStockItems.length;
        p++) {
          if (bata.allItems[i].itemId ==
              _allStockItemsController.allStockItems[p].itemId) {
            item[bata.allItems[i].itemId] = TheItemInList(
                totalPriceForItem: 0,
                totalTaxForItem: 0,
                quantity_in_store: int.parse(
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
                name: bata.allItems[i].itemDetails[0].itemNameEn,
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
    }
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

  setCount({String id, int count}) {
    item[id].value.count = count;
    item[id].value.befordes = item[id].value.price * item[id].value.count;
    item[id].value.afterdes = (item[id].value.price * item[id].value.count) -
        ((item[id].value.price * item[id].value.count) *
            (item[id].value.diescount / 100));
    setTotalPriceAndTotalTex(id: id);

    getTotalTax();
    netprice();
    //  gettotalpriceincart();

    update();
  }

  setTotalPriceAndTotalTex({String id}) {
    item[id].value.totalTaxForItem =
        item[id].value.afterdes * (item[id].value.tex / 100);
    item[id].value.totalPriceForItem =
        item[id].value.afterdes + item[id].value.totalTaxForItem;
    update();
  }

  setprice({String id, String val}) {
    item[id].value.price = double.parse(val);
    item[id].value.befordes = item[id].value.price * item[id].value.count;
    item[id].value.afterdes = (item[id].value.price * item[id].value.count) -
        ((item[id].value.price * item[id].value.count) *
            (item[id].value.diescount / 100));
    setTotalPriceAndTotalTex(id: id);
    getTotalTax();
    netprice();
    //   gettotalpriceincart();
    update();
  }

  setbonce({String id, String val}) {
    item[id].value.bonce = int.parse(val);
    update();
  }

  setdiscount({String id, String val}) {
    item[id].value.diescount = double.parse(val);
    item[id].value.afterdes = (item[id].value.price * item[id].value.count) -
        ((item[id].value.price * item[id].value.count) *
            (double.parse(val) / 100));

    totalTax.value = item[id].value.afterdes * item[id].value.tex;
    setTotalPriceAndTotalTex(id: id);
    getTotalTax();
    netprice();
    //  gettotalpriceincart();
    update();
  }

  netprice() {
    grandTotal.value = 0;
    item.forEach((key, value) {
      grandTotal.value =
          grandTotal.value + (value.value.afterdes * value.value.count);
    });
    grandTotal.value = grandTotal.value + totalTax.value;
    gettotalpriceincart();
    update();
  }

  getTotalTax() {
    totalTax.value = 0;
    item.forEach((key, value) {
      totalTax.value =
          totalTax.value + (value.value.afterdes * value.value.tex);
    });

    update();
  }

  deletItem(Rx<TheItemInList> products) {
    products.value.count = 0;
    itemInCart.value = 0;
    countInCart();
    update();
  }

  countInCart() {
    itemInCart.value =
        item.entries
            .where((element) => element.value.value.count > 0)
            .length;
    //  print(itemInCart.value);
  }

  mytray() {
    liPro.clear();
    DateTime now = new DateTime.now();

    Map<int, Map<String, dynamic>> mapofall = {};
    for (int i = 0; i < _all_promotionsController.allPromotionss.length; i++) {
      bool indate;
      Map<String, dynamic> g = {};

      bool isinall_group_customers = false;
      bool isinall_group_salesmans = false;
      _all_promotionsController.allPromotionss[i].allGroupCustomers.forEach((
          element) {

        if (element.customerId == Get
            .find<AllChequesController>()
            .customer_id){
          isinall_group_customers=true;
        }
      });
      _all_promotionsController.allPromotionss[i].allGroupSalesmans.forEach((
          element) {

        if (int.parse(element.employeeId) ==  Get.find<UserAndPermissions>().user.id){
          isinall_group_salesmans=true;
        }else{
          isinall_group_salesmans=false;
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
      int ii = 0;
      item.forEach((key, value) {
        _all_promotionsController.allPromotionss[i].allOutQuantityPromotionItems
            .forEach((el) {
          if (value.value.count > 0 && value.value.id == el.itemId) {
            // print(value.value.id==el.itemId);
            // print("id  ${value.value.id}   $i");
            // print('itemId ${el.itemId}    $i');
            // print('count  ${value.value.count}   $i');
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
      if( value['isinall_group_salesmans'] ==true&& value['isinall_group_customers']==true&& value['active']==true){
      int youget = 0;
      if (value['isBonusDuplicate'] == '1') {
        double pp = (value['QuantityValue'] /
            int.parse(value['minimumQuantityValue']));
        youget = pp.toInt() * int.parse(value['bonusQty']);
      } else {
        youget = int.parse(value['bonusQty']);
      };
      // print(value['QuantityValue']);
      // print(value['QuantityValue'] > int.parse(value['minimumQuantityValue']));
      if (value['QuantityValue'] >= int.parse(value['minimumQuantityValue'])) {
        liPro.add(Container(color: Colors.orange,
            child: Column(
              children: [
                Center(child: Text('العرض رقم ${key + 1}')),
                Center(child: Text('ستحصل علي ${youget}')),
              ],
            )));
        if (value['strictlyListedItem'] == 'yes') {
          List<Rx<TheItemInList>> _myv = value['iteminlist'];
          _myv.forEach((element) {
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
                        Expanded(child: Text(element.value.name)),
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
                              if (v != null ) {
                                if(int.parse(v) <= youget){
                                  setbonce(id: element.value.id,val: v);
                                }else {
                                  Get.snackbar('', 'تاكد من الرقم الصحيح');
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
          });
        } else {
          List<AllOutQuantityPromotionItems> _allitemout =
          value['AllOutQuantityPromotionItems'];

          _allitemout.forEach((elll) {
            item.forEach((key, vll) {
              if (elll.itemId == vll.value.id) {
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
                            Expanded(child: Text(vll.value.name)),
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
                                  // if (v != null && int.parse(v) <= youget) {
                                  //   _myProdectListController.setbonce(
                                  //       id: e.itemId, val: v);
                                  // } else {
                                  //   Get.snackbar('', 'تاكد من الرقم الصحيح');
                                  // }
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
      }  });
    liPro.add(GestureDetector(
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
    print(liPro);
  }
}

class MytrayItem {
  String id;
  String name;
  int count;

  MytrayItem({this.id, this.name, this.count});
}

class TheItemInList {
  String id;
  double diescount;
  int bonce;
  String name;
  double price;
  double tex;
  int quantity_in_store;
  int count;
  double afterdes;
  double befordes;
  double totalPriceForItem;
  double totalTaxForItem;
  String pic;
  String itemNumber;
  String minimumQuantity;
  int categoryId;
  int measurementUnitId;

  TheItemInList({this.id,
    this.diescount,
    this.quantity_in_store,
    this.bonce,
    this.name,
    this.price,
    this.tex,
    this.count,
    this.afterdes,
    this.befordes,
    this.totalPriceForItem,
    this.totalTaxForItem,
    this.pic,
    this.itemNumber,
    this.minimumQuantity,
    this.categoryId,
    this.measurementUnitId});
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

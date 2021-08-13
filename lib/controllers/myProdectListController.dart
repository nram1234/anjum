import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/unitController.dart';
import 'package:get/get.dart';

import 'allChequesController.dart';
import 'allStockItemsController.dart';

class MyProdectListController extends GetxController {
  Map<String, Rx<TheItemInList>> item = Map<String, Rx<TheItemInList>>();
  final AllItemsController bata = Get.find<AllItemsController>();
  RxDouble grandTotal = 0.0.obs;
  RxDouble totalTax = 0.0.obs;
  final AllStockItemsController _allStockItemsController = Get.find<
      AllStockItemsController>();

  RxDouble totalpriceincart = 0.0.obs;
  RxDouble totalTaxincart = 0.0.obs;
  RxDouble totalDiscountincart = 0.0.obs;
  RxDouble sumOftotalDiscountincart = 0.0.obs;

  settotalDiscountincart({String v}) {
    totalDiscountincart.value = double.parse(v) / 100;
    gettotalpriceincart();
    update();
  }
   String totalDiscount(){
    double totoal=0;
    item.forEach((key, value) {
      if(value.value.count>0){
        totoal+=(value.value.price*(value.value.diescount/100))+  (value.value.price*(totalDiscountincart/100));

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
            value.value.tex / 100);
      }
    });
  }

  @override
  void onInit() {
    if (item.length == 0) {
      for (int i = 0; i < bata.allItems.length; i++) {
        for (int p = 0; p <
            _allStockItemsController.allStockItems.length; p++)
        {
          if (bata.allItems[i].itemId ==
              _allStockItemsController.allStockItems[p].itemId) {
            item[bata.allItems[i].itemId] = TheItemInList(totalPriceForItem: 0,
                totalTaxForItem: 0,
                count: 0,
                measurementUnitId
                :int.parse(_allStockItemsController.allStockItems[p].measurementUnitId),
                id: bata.allItems[i].itemId,
                tex: double.parse(bata.allItems[i].itemDetails[0].tax),
                befordes:
                double.parse(bata.allItems[i].itemDetails[0].sellingPrice),
                price:
                double.parse(bata.allItems[i].itemDetails[0].sellingPrice),
                name: bata.allItems[i].itemDetails[0].itemNameEn,
                afterdes:
                double.parse(bata.allItems[i].itemDetails[0].sellingPrice),

                itemNumber: bata.allItems[i].itemDetails[0].itemNumber,
                minimumQuantity:
                bata.allItems[i].itemDetails[0].minimumQuantity,
                pic: bata.allItems[i].itemDetails[0].image,

                bonce: 0,
                categoryId: int.parse(bata.allItems[i].itemDetails[0].categoryId),
                diescount: 0)
                .obs;
          }
        }

      }
    }
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

  setTotalPriceAndTotalTex({String id }) {
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

}

class TheItemInList {
  String id;
  double diescount;
  double bonce;
  String name;
  double price;
  double tex;
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

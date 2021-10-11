
import 'package:anjum/network/newjosomnLast/get_second_step2_json.dart';
import 'package:get/get.dart';

import 'allCustomersControllers.dart';
import 'allItemsController.dart';

class PriceListsInfoController extends GetxController {
Map<String,List<PriceListsInfo>>priceList= {};
Map<String,PriceListsInfo>val_Of_PriceListsInfo_map={};
Map<String,List<PriceBarUint>>priceparunit={};
updatepriceListMap({List<PriceListsInfo> priceListsInfo}){
   priceListsInfo.forEach((element) {

     if(priceList[element.itemId]==null){
       List<PriceListsInfo>a=[];
           a.add(element);
       priceList[element.itemId]=a;

     }if(priceList[element.itemId]!=null){
   List<String>pp=    priceList[element.itemId].map((e) => e.unit).toList();
   if(!pp.contains(element.unit)){
       priceList[element.itemId].add(element);

     }}
   });

  update();
}

    var allItemController = Get.find<AllItemsController>( );

  List<PriceListsInfo> _listOfAllPriceListsInfo = [];
  List<PriceListsInfo> _listOfcustomerPriceListsInfo = [];

  makeAListOfPriceListsInfo(String customerInfo) {
    _listOfAllPriceListsInfo.clear();
    _listOfcustomerPriceListsInfo.clear();



    // filtter customerInfo list price
    for (int i = 0; i < priceList.length; i++) {
      if (_listOfAllPriceListsInfo[i].priceListId == customerInfo) {

        _listOfcustomerPriceListsInfo.add(_listOfAllPriceListsInfo[i]);
      }
    }
    for(int i=0;i<_listOfcustomerPriceListsInfo.length;i++){
     // itemId.add(_listOfcustomerPriceListsInfo[i].itemId);
for(int o=0;o<allItemController.allItems.length;o++){

  if(_listOfcustomerPriceListsInfo[i].itemId==allItemController.allItems[o].itemId){
    allItemController.allItems[o].itemDetails[0].sellingPrice=_listOfcustomerPriceListsInfo[i].sellingPrice;
    allItemController.addItemTocustomerItems(allItemController.allItems[o]);

  }
}
    }
  }

//   getListOfListPriceListsInfo(CustomerInfo customerInfo) {
//     _listpriceListsInfo.clear();
//     this._customerInfo = customerInfo;
//
//     for(int i=0;i<bata.allCustomers.length;i++){
// for(int o=0;o<bata.allCustomers[i].priceListsInfo.length;o++){
//
//   print(bata.allCustomers[i].priceListsInfo[o].itemUnits[0]);
//   if(bata.allCustomers[i].priceListsInfo[o].priceListId==_customerInfo.priceListId){
//     listOfItemPrice.add(bata.allCustomers[i].priceListsInfo[o]);
//   }
//    //
// }
//
//     }
//
// for(int i=0;i<_listpriceListsInfo.length;i++){
//   // if(_listpriceListsInfo[0].){}
//   print(_listpriceListsInfo[i]);
// }
//
// //     listOfItemPrice.map((pricelistitem) {
// // allItemController.allItems.map((item) {
// //   print(pricelistitem.itemId==item.itemId);
// //   if(pricelistitem.itemId==item.itemId){
// //
// //     item.itemDetails[0].sellingPrice=pricelistitem.sellingPrice;
// //     showItemDataWithPrice.add(item);
// // print(item.employeeId);
// //   }
// // });
// //     });
//
//
// print(showItemDataWithPrice.length);
//  update();
//
//
//
//   }

}
class PriceBarUint {
  String unit;
  double price;

  PriceBarUint({this.unit, this.price});

}
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

import 'allCustomersControllers.dart';
import 'allItemsController.dart';

class PriceListsInfoController extends GetxController {
  CustomerInfo _customerInfo;
  var bata = Get.find<AllCustomersControllers>();
  var allItemController = Get.find<AllItemsController>();

  List<List<PriceListsInfo>> _listpriceListsInfo = [];

  //--------------------------------------
  List<PriceListsInfo> listOfItemPrice = [];

  //--------------------------------------
  //--------------------------------------
  List<PriceListsInfo> _listOfAllPriceListsInfo = [];
  List<PriceListsInfo> _listOfcustomerPriceListsInfo = [];
//List<String>itemId=[];
  //--------------------------------------
  //--------------------------------------
  //List<AllItems> showItemDataWithPrice = [];

  makeAListOfPriceListsInfo(CustomerInfo customerInfo) {
    _listOfAllPriceListsInfo.clear();
    _listOfcustomerPriceListsInfo.clear();

    allItemController.clearcustomerListItems();
     // make list of priceListsInfo
    for (int i = 0; i < bata.allCustomers.length; i++) {
      for (int o = 0; o < bata.allCustomers[i].priceListsInfo.length; o++) {
        _listOfAllPriceListsInfo.add(bata.allCustomers[i].priceListsInfo[o]);
      }
    }
    print('00000000000000000000000000');
    print(_listOfAllPriceListsInfo);
    print('00000000000000000000000000');
    // filtter customerInfo list price
    for (int i = 0; i < _listOfAllPriceListsInfo.length; i++) {
      if (_listOfAllPriceListsInfo[i].priceListId == customerInfo.priceListId) {

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

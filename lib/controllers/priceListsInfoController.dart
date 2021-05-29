import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

import 'allCustomersControllers.dart';
import 'allItemsController.dart';

class PriceListsInfoController extends GetxController {
  AllCustomers _allCustomers;
  var bata = Get.find<AllCustomersControllers>();
  var allItemController = Get.find<AllItemsController>();


List<List< PriceListsInfo> >  _listpriceListsInfo = [];

  //--------------------------------------
  List<PriceListsInfo> listOfItemPrice=[];
  //--------------------------------------
List<AllItems>showItemDataWithPrice=[];
  getListOfListPriceListsInfo(AllCustomers allCustomers) {
    _listpriceListsInfo.clear();
    this._allCustomers = allCustomers;
    // bata.allCustomers
    //     .map((e) {
    //       print('9999999999999999999999999');
    //   _listpriceListsInfo.add(e.priceListsInfo);
    // });
    for(int i=0;i<bata.allCustomers.length;i++){
for(int o=0;o<bata.allCustomers[i].priceListsInfo.length;o++){

  print(bata.allCustomers[i].priceListsInfo[o].itemUnits[0]);
   //listOfItemPrice.add(bata.allCustomers[i].priceListsInfo[o]);
}

    }

for(int i=0;i<_listpriceListsInfo.length;i++){
  // if(_listpriceListsInfo[0].){}
  print(_listpriceListsInfo[i]);
}

//     listOfItemPrice.map((pricelistitem) {
// allItemController.allItems.map((item) {
//   print(pricelistitem.itemId==item.itemId);
//   if(pricelistitem.itemId==item.itemId){
//
//     item.itemDetails[0].sellingPrice=pricelistitem.sellingPrice;
//     showItemDataWithPrice.add(item);
// print(item.employeeId);
//   }
// });
//     });


print(showItemDataWithPrice.length);
 update();



  }

}

import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

import 'allCustomersControllers.dart';
import 'allItemsController.dart';

class PriceListsInfoController extends GetxController {
  CustomerInfo _customerInfo;
  var bata = Get.find<AllCustomersControllers>();
  var allItemController = Get.find<AllItemsController>();


List<List< PriceListsInfo> >  _listpriceListsInfo = [];

  //--------------------------------------
  List<PriceListsInfo> listOfItemPrice=[];
  //--------------------------------------
List<AllItems>showItemDataWithPrice=[];
  getListOfListPriceListsInfo(CustomerInfo customerInfo) {
    _listpriceListsInfo.clear();
    this._customerInfo = customerInfo;

    for(int i=0;i<bata.allCustomers.length;i++){
for(int o=0;o<bata.allCustomers[i].priceListsInfo.length;o++){

  print(bata.allCustomers[i].priceListsInfo[o].itemUnits[0]);
  if(bata.allCustomers[i].priceListsInfo[o].priceListId==_customerInfo.priceListId){
    print('8888888888888888888888');
  }
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

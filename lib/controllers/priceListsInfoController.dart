import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

import 'allCustomersControllers.dart';
import 'allItemsController.dart';

class PriceListsInfoController extends GetxController {
  AllCustomers _allCustomers;
  var bata = Get.find<AllCustomersControllers>();
  var allItemController = Get.find<AllItemsController>();


  List<List<PriceListsInfo>> _listpriceListsInfo = [];

  //--------------------------------------
  List<PriceListsInfo> listOfItemPrice=[];
  //--------------------------------------
List<AllItems>showItemDataWithPrice=[];
  getListOfListPriceListsInfo(AllCustomers allCustomers) {
    this._allCustomers = allCustomers;
    bata.allCustomers
        .map((e) {
      _listpriceListsInfo.add(e.priceListsInfo);
    });
    listOfItemPrice=  _listpriceListsInfo.map((list) {
      list.where((element) => element.priceListId==allCustomers.customerInfo.priceListId);
    }).toList();


    listOfItemPrice.map((pricelistitem) {
allItemController.allItems.map((item) {
  if(pricelistitem.itemId==item.itemId){
    item.itemDetails[0].sellingPrice=pricelistitem.sellingPrice;
    showItemDataWithPrice.add(item);

  }
});
    });



 update();



  }

}


import 'package:anjum/network/jsonofnwetry/get_Fifth_step_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DropdownMenuItemList extends GetxController{


  RxList<TextEditingController> serach_listtextEditingControllerOfItem =RxList<TextEditingController> ();
  RxList<List<AllStockItems>>serach_allStockItems=RxList<List<AllStockItems>>();

  RxList<AllStockItems> serach_listdropdownValue=RxList<AllStockItems>();





  RxList<TextEditingController> listtextEditingControllerOfItem =RxList<TextEditingController> ();
  RxList<List<AllStockItems>> allStockItems=RxList<List<AllStockItems>>();

  RxList<AllStockItems> listdropdownValue=RxList<AllStockItems>();



//RxList<AllStockItems>lisst=RxList<AllStockItems>();
  void addlistdropdownValue(AllStockItems allStockItems){
    listdropdownValue.add(allStockItems);

    update();
  }
  void addallStockItems(List<AllStockItems> list){
    allStockItems.add(list);
    update();
  }
  void addlisttextEditingControllerOfItem(TextEditingController list){
    listtextEditingControllerOfItem.add(list);
    update();
  }
  setValOfdropdownValue({required int pos,required AllStockItems dropdownValue}){
    listdropdownValue[pos]=dropdownValue;
    update();
  }





  void serach_addlistdropdownValue(AllStockItems allStockItems){
    serach_listdropdownValue.add(allStockItems);

    update();
  }
  void serach_addallStockItems(List<AllStockItems> list){
    serach_allStockItems.add(list);
    update();
  }
  void serach_addlisttextEditingControllerOfItem(TextEditingController list){
    serach_listtextEditingControllerOfItem.add(list);
    update();
  }
  serach_setValOfdropdownValue({required int pos,required AllStockItems dropdownValue}){
    serach_listdropdownValue[pos]=dropdownValue;
    update();
  }
}
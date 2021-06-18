import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DropdownMenuItemList extends GetxController{


  List<TextEditingController> listtextEditingControllerOfItem = [];
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
  setValOfdropdownValue({int pos,AllStockItems dropdownValue}){
    listdropdownValue[pos]=dropdownValue;
    update();
  }
}
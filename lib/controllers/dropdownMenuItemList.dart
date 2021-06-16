import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DropdownMenuItemList extends GetxController{


  List<TextEditingController> listtextEditingControllerOfItem = [];
  List<List<AllStockItems>> allStockItems=[];
  var listdropdownValue=[].obs;

  void addlistdropdownValue(  allStockItems){
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
  // setValOfdropdownValue({int pos,  dropdownValue}){
  //   listdropdownValue[pos].val=dropdownValue;
  //   update();
  // }
}
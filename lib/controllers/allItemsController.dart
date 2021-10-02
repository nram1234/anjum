
import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AllItemsController extends GetxController{

  RxString search_word ="".obs;
  //RxList<AllItems> search_wordListItems=RxList<AllItems>();
  //RxList<TextEditingController> search_worldlistTextControll=RxList<TextEditingController>();


  List<AllItems> allItems=[];
  List<AllItems> search_wordListItems=[];
  SerchWordListToViewInSerarch(String word){
    search_wordListItems.clear();
    for(int i = 0; i <  allItems.length; i++){
      if( allItems[i].itemDetails[0].itemNameEn.toLowerCase().contains(search_word.toLowerCase())){
        TextEditingController t=TextEditingController();
        t.text=0.toString();
        search_wordListItems.add( allItems[i]);
      }
    }

  }



  void updateallItemsData(  List<AllItems> allItems){
    this.allItems=allItems;
    update();
  }
void addItemTocustomerItems(AllItems items){
    search_wordListItems.add(items);
  update();
}
  void clearcustomerListItems( ){
    search_wordListItems.clear();
    update();
  }




}
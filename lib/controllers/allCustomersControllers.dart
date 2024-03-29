
import 'package:anjum/network/newjosomnLast/get_second_step1_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCustomersControllers extends GetxController{
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  RxString serchWord="".obs;
  List<AllCustomers> allCustomers=[];
  RxList<AllCustomers> allCustomersSerchFilter= RxList<AllCustomers>();
  Map<String,AllCustomers>mapofCustomer={};
  void updateallCustomers(List<AllCustomers> allCust){
    allCustomers=allCust;


    allCust.forEach((element) {
      mapofCustomer[element.id]=element;
    });
    _loading.value = false;
    update();
  }
  serchFilterCustom(String v){
    allCustomersSerchFilter.clear();

  //   if(v.isAlphabetOnly){
      for(int i=0;i<allCustomers.length;i++){
        if(allCustomers[i].customerNameEn.toLowerCase().contains(v.toLowerCase())){
          allCustomersSerchFilter.add(allCustomers[i]);
          print('allCustomersSerchFilter');
        }
        update();   }
  //   }
  //   else{
  //     for(int i=0;i<allCustomers.length;i++){
  //       if(allCustomers[i].customerInfo.customerId.contains(v)){
  //         allCustomersSerchFilter.add(allCustomers[i]);
  //       }
  //     }
  // //    update();
  //   }
   // _loading.value = false;
 update(); }

}
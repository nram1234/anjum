import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class AllCustomersControllers extends GetxController{
  RxString serchWord="".obs;
  List<AllCustomers> allCustomers=[];
  RxList<AllCustomers> allCustomersSerchFilter= RxList<AllCustomers>();
  void updateallCustomers(List<AllCustomers> allCustomers){
    this.allCustomers=allCustomers;
    update();
  }
  serchFilterCustom(String v){
    allCustomersSerchFilter.clear();
    if(v.isAlphabetOnly){
      for(int i=0;i<allCustomers.length;i++){
        if(allCustomers[i].customerInfo.customerNameEn.toLowerCase().contains(v.toLowerCase())){
          allCustomersSerchFilter.add(allCustomers[i]);
        }
        update();   }
    }
    else{
      for(int i=0;i<allCustomers.length;i++){
        if(allCustomers[i].customerInfo.customerId.contains(v)){
          allCustomersSerchFilter.add(allCustomers[i]);
        }
      }
      update(); }

 update(); }

}
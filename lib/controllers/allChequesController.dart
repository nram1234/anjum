
import 'package:anjum/network/jsonofnwetry/get_fourth_step_json.dart';
import 'package:anjum/network/newjosomnLast/get_second_step1_json.dart';

import 'package:get/get.dart';

class AllChequesController extends GetxController{
String customer_id='';
late AllCustomers  customer ;


  List<AllCheques> allCheques=[];
  void updateallChequesData(List<AllCheques> allCheques){
    this.allCheques=allCheques;
    update();
  }
setcustomerID(String id){
    customer_id=id;
    update();
}
setcustomer (AllCustomers allCustomers){
   this.customer=allCustomers;
  update();
}


}
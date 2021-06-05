import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class AllChequesController extends GetxController{
String customer_id='';
AllCustomers  customer ;
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
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class AllCustomersControllers extends GetxController{
  List<AllCustomers> allCustomers=[];

  void updateallCustomers(List<AllCustomers> allCustomers){
    this.allCustomers=allCustomers;
    update();
  }

}
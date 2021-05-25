import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class SalesOrderController extends GetxController{

  SalesOrder salesOrder;
  void updatesalesOrderData( SalesOrder salesOrder){
    this.salesOrder=salesOrder;
    update();
  }



}
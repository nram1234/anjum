
import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:get/get.dart';

class SalesOrderController extends GetxController{

late  SalesOrder salesOrder;
  void updatesalesOrderData( SalesOrder salesOrder){
    this.salesOrder=salesOrder;
    update();
  }



}
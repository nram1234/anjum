import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class AllStockItemsController extends GetxController{

  List<AllStockItems> allStockItems=[];
  void updateallStockItemsData(List<AllStockItems> allStockItems){
    this.allStockItems=allStockItems;
    update();
  }



}
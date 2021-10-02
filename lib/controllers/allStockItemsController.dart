
import 'package:anjum/network/jsonofnwetry/get_Fifth_step_json.dart';
import 'package:get/get.dart';

class AllStockItemsController extends GetxController{

  List<AllStockItems> allStockItems=[];
  void updateallStockItemsData(List<AllStockItems> allStockItems){
    this.allStockItems=allStockItems;
    update();
  }



}
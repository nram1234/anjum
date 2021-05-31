import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';


class AllItemsController extends GetxController{

  List<AllItems> allItems=[];
  List<AllItems> customerListItems=[];
  void updateallItemsData(  List<AllItems> allItems){
    this.allItems=allItems;
    update();
  }
void addItemTocustomerItems(AllItems items){
    customerListItems.add(items);
  update();
}
  void clearcustomerListItems( ){
    customerListItems.clear();
    update();
  }




}
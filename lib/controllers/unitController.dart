import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class UnitController extends GetxController {


  List<List<String>> all_Uint_List=[];
  List<String>  all_Uint_select=[];
  Map<String,ItemUnits>val_Of_uint_map={};
  Map<String,List<ItemUnits>>MeasurementUnit_map={};
  void  add_List_to_List(List<String> unit){
    all_Uint_List.add(unit);
    update();
  }
  void setValOf_all_Uint_select(int pos,String v){
    all_Uint_select[pos]=v;
    update();
  }
  void setValOf_map(String  key,ItemUnits v){
    val_Of_uint_map[key]=v;
    update();
  }
}
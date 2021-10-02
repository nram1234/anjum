import 'package:anjum/network/newjosomnLast/get_second_step3_json.dart';
import 'package:get/get.dart';

class ItemUnitsController extends GetxController{

 // List<ItemUnits>itemUnits;
  Map<String,List<ItemUnits>>itemUnitsmap= {};
// updateitemUnits({List<ItemUnits> list} ){
//   itemUnits=list;
// }
  updateitemUnitstMap({List<ItemUnits> list}){
  list.forEach((element) {
    if(itemUnitsmap[element.itemId]==null){
      List<ItemUnits>a=[];
      a.add(element);
      itemUnitsmap[element.itemId]=a;

    }else{
      itemUnitsmap[element.itemId].add(element );
    }
  });
 update();
  }
}
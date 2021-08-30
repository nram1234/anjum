import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class All_PromotionsController extends GetxController {

  AllPromotions allPromotion=AllPromotions();

  DateTime today =DateTime.now();//  DateTime.parse(element.endDate);
  DateTime from ;
  DateTime todate  ;
allPromotionsUpdat(List<AllPromotions> allPromotions){
  allPromotion=allPromotions[0];
  update();
}


bool isInTime(){
  from =  DateTime.parse(allPromotion.startDateTime);
  todate =   DateTime.parse(allPromotion.endDateTime);
  return todate.isAfter(from) && todate.isBefore(todate);

}
bool isInall_group_salesmans({String userID}){
  allPromotion.allGroupSalesmans.where((element) => element.userId==userID);

}
  bool isInall_group_customers({String userID}){
    allPromotion.allGroupCustomers.where((element) => element.userId==userID);

  }
  bool isIn({String itemID}){
    allPromotion.allQuantityPromotionItems.where((element) => element.itemId==itemID);

  }
  bool is_bonus_duplicate(){
 return   allPromotion.isBonusDuplicate==1.toString();

  }
}
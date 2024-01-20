
import 'package:anjum/network/jsonofnwetry/get_Fifth_step_json.dart';
import 'package:get/get.dart';

class All_PromotionsController extends GetxController {
  List<AllPromotions> allPromotionss = [];
  Map<String, ItemInProm> promitem = {};
  DateTime today = DateTime.now(); //  DateTime.parse(element.endDate);
  late DateTime from;

  late  DateTime todate;

  allPromotionsUpdat(List<AllPromotions> allPromotionsw) {
     allPromotionss = allPromotionsw;
    update();
  }

  bool isInTime({startDateTime, endDateTime}) {
    from = DateTime.parse(startDateTime);
    todate = DateTime.parse(endDateTime);
    return today.isAfter(from) && today.isBefore(todate);
  }

  bool isInall_group_salesmans({required List<AllGroupSalesmans> list,required int userID}) {
    List<int> ids = [];
    list.forEach((element) {
      ids.add(int.parse(element.employeeId));
      print("employeeId   ${ids.contains(userID)}");
    });
    return ids.contains(userID);
  }

  bool isInall_group_customers({required List<AllGroupCustomers> list,required int customerId}) {
    List<int> ids = [];

    list.forEach((element) {
      ids.add(int.parse(element.customerId));
    });
    return ids.contains(customerId);
  }


//
// bool is_bonus_duplicate() {
//   return allPromotion.isBonusDuplicate == 1.toString();
// }

}

class ItemInProm {
  String itemid;
  int bonus_qty;
  int minimum_quantity_value;

  String is_bonus_duplicate;
  String strictly_listed_item;
  ItemInProm(
      {required this.itemid,required this.strictly_listed_item,
       required this.bonus_qty,
       required this.minimum_quantity_value,
       required   this.is_bonus_duplicate});
}

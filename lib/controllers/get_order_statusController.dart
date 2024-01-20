
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/get_order_status_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GetOrderStatusController extends GetxController {
  AllNetworking _allNetworking = AllNetworking();
  // ignore: non_constant_identifier_names
 late Get_Order_Status_json  get_order_status_json;
String searchword="";
  searchwordupdate(String word){
    searchword=word;
    update();
  }
  @override
  void onInit() {
    super.onInit();
    _allNetworking.get_order_status(user_id: Get.find<UserAndPermissions>().user.id).then((value) {
      print(value);

      setgetOrderStatus(value);
    });
  }
  getorderstatbydate({required String from,required String to}){


    _allNetworking.get_order_status(user_id: Get.find<UserAndPermissions>().user.id,to: to,from: from).then((value) {
      print(value);

      setgetOrderStatus(value);
      update();
    });
  }
  setgetOrderStatus(Get_Order_Status_json data){
     get_order_status_json=data;



    update();
  }
}
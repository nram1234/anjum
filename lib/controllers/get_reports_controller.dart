import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/get_reports_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GetReportsController extends GetxController{
  AllNetworking _allNetworking = AllNetworking();
  Get_Reports_json get_reports_json;
  updateGet_Reports_json(){
    DateTime selectedfromDate = DateTime.now();
    String formattedDateto=   DateFormat('yyyy-MM-dd').format(selectedfromDate);
    _allNetworking.get_reports(user_id: Get.find<UserAndPermissions>().user.id,to: formattedDateto,from: "2020-9-20").then((value) {
      print(value);
      get_reports_json=value;
      update();
    });
  }
  getreportsbydate({String from,String to}){
    print("11111111111111");
    print(to);
    print(from);
print( "2021-11-01"==to);
    print("11111111111111");
    _allNetworking.get_reports(user_id: Get.find<UserAndPermissions>().user.id,to: to,from: from).then((value) {
      print(value);
      get_reports_json=value;
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    updateGet_Reports_json();

  }
}
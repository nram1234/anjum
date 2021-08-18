import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'allCustomersControllers.dart';

class All_routesController extends GetxController {
  List<AllRoutes> allRoutes;
Map<String,AllCustomers>mapOfCustomar={};

  void updateAllRoutes(List<AllRoutes> allroutes) {
    this.allRoutes = allroutes;

    update();
  }

  @override
  void onInit() {
    super.onInit();
    Get.find<AllCustomersControllers>().allCustomers.forEach((element) {

      mapOfCustomar[element.customerInfo.id]=element;

    });
  }

  List<AllCustomers> allCustomarInRouts() {
    DateTime time = DateTime.now();
    List<AllCustomers>allCustomers=[];


    List<ListRoutesInfo> listRoutes = [];
    // for(int i=0;i<Get.find<AllCustomersControllers>().allCustomers.length;i++){
    //   for(int p=0;p<allRoutes.length){}
    // }

    for (int p = 0; p < allRoutes.length; p++) {
      for (int i = 0; i < allRoutes[i].listRoutesInfo.length; i++) {
        listRoutes.add(allRoutes[p].listRoutesInfo[i]);
      }
    }
    //  listCustomers.forEach((element) {
    //    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    //    DateTime from=DateTime.parse(element.);
    // if(time.isBefore(element.))
    //  });
    final DateFormat formatter = DateFormat('EEEE');
    listRoutes.forEach((element) {
      print('wednesday    ${element.wednesday}' );
      print('customerId    ${element.customerId}' );
      print('element    ${formatter.format(time).toLowerCase()}' );

      Map<String, String> mapOfDay = {};
      mapOfDay["sunday"] = element.sunday;
      mapOfDay["monday"] = element.monday;
      mapOfDay["tuesday"] = element.tuesday;
      mapOfDay["wednesday"] = element.wednesday;
      mapOfDay["thursday"] = element.thursday;
      mapOfDay["saturday"] = element.saturday;
      mapOfDay["friday"] = element.friday;

      DateTime from = DateTime.parse(element.startDate);
      DateTime todate = DateTime.parse(element.endDate);
      if (time.isAfter(from) && time.isBefore(todate)) {
        if (element.schedule.toLowerCase() == "weekly") {

          if (mapOfDay[formatter.format(time).toLowerCase()] == "yes") {
          print(mapOfCustomar);
             allCustomers.add(mapOfCustomar[element.customerId]);
          }
        }
      }
    });
 return allCustomers; }
}

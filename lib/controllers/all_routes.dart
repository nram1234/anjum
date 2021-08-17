import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

import 'allCustomersControllers.dart';

class All_routesController extends GetxController {

  List<AllRoutes> allRoutes;
  void updateAllRoutes(List<AllRoutes> allroutes){
    this.allRoutes=allroutes;


    update();
  }

  List<AllCustomers> allCustomarInRouts(){
    List<AllCustomers>listCustomers=[];

    List<ListRoutesInfo>listRoutes=[];
    // for(int i=0;i<Get.find<AllCustomersControllers>().allCustomers.length;i++){
    //   for(int p=0;p<allRoutes.length){}
    // }

    for(int p=0;p<allRoutes.length;p++){
      for(int i=0;i<allRoutes[i].listRoutesInfo.length;i++){

        listRoutes.add(allRoutes[p].listRoutesInfo[i]);
      }

    }
    listCustomers.forEach((element) {

    });


  }

}
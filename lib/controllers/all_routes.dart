import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class All_routesController extends GetxController {

  List<AllRoutes> allRoutes;
  void updateAllRoutes(List<AllRoutes> allroutes){
    this.allRoutes=allroutes;
    update();
  }



}
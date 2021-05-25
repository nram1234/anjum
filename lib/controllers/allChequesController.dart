import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class AllChequesController extends GetxController{

  List<AllCheques> allCheques;
  void updateallChequesData(List<AllCheques> allCheques){
    this.allCheques=allCheques;
    update();
  }



}

import 'package:anjum/network/jsonofnwetry/get_first_step_json.dart';
import 'package:get/get.dart';

class EmployeDataController extends GetxController{

  EmployeData employeDatas ;
  void updateemployeDatasData( EmployeData  employeDatas){
    this.employeDatas=employeDatas;
    update();
  }



}
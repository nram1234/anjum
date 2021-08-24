import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class EmployeDataController extends GetxController{

  EmployeData employeDatas ;
  void updateemployeDatasData( EmployeData  employeDatas){
    this.employeDatas=employeDatas;
    update();
  }



}
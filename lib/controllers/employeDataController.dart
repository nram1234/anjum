import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class EmployeDataController extends GetxController{

  List<EmployeData> employeDatas=[];
  void updateemployeDatasData(List<EmployeData> employeDatas){
    this.employeDatas=employeDatas;
    update();
  }



}
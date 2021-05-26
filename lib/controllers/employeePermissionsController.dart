import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class EmployeePermissionsController extends GetxController{

  List<EmployeePermissions> employeePermissions=[];
  void updateemployeePermissionsData(List<EmployeePermissions> employeePermissions){
    this.employeePermissions=employeePermissions;
    update();
  }



}

import 'package:anjum/network/jsonofnwetry/get_first_step_json.dart';
import 'package:get/get.dart';

class EmployeePermissionsController extends GetxController{

  List<EmployeePermissions> employeePermissions=[];
  void updateemployeePermissionsData(List<EmployeePermissions> employeePermissions){
    this.employeePermissions=employeePermissions;
    update();
  }



}
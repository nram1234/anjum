import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class UserDataController extends GetxController{

   UserData  userData ;
   updateserData( UserData userData){
    this.userData=userData;
    update();
  }



}

import 'package:anjum/network/jsonofnwetry/get_fourth_step_json.dart';
import 'package:get/get.dart';

class UserDataController extends GetxController{

  late UserData  userData ;
   updateserData( UserData userData){
    this.userData=userData;
    update();
  }



}
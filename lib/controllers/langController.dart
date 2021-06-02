import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class LangController extends GetxController{

 var lan='en';
updatelang({String lang}){
  lan=lang;
  update();
}




}
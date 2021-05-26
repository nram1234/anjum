import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class AllCategoriesController extends GetxController{

  List<AllCategories> allCategories=[];
  void updateallCategoriesData( List<AllCategories> allCategories){
    this.allCategories=allCategories;
    update();
  }



}
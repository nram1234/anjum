
import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:get/get.dart';

class AllCategoriesController extends GetxController{

  List<AllCategories> allCategories=[];
  void updateallCategoriesData( List<AllCategories> allCategories){
    this.allCategories=allCategories;
    update();
  }



}

import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:get/get.dart';

class AllCategoriesController extends GetxController{
  RxBool isflter=false.obs;
  List<AllCategories> filterCategories=[];
  List<SubCategories> filtersubCategories=[];
  List<AllCategories> allCategories=[];



  void updateallCategoriesData( List<AllCategories> allCategories){
    this.allCategories=allCategories;
   // allCategories.forEach((element) { updatefilterCategories(element);
   //});
    update();
  }
void updatefilterCategories(AllCategories categorie){
    isflter.value=false;
//print(filterCategories.where((element) => element.id==categorie.id).length>0);
    if(filterCategories.where((element) => element.id==categorie.id).length>0){
      filterCategories.remove(categorie);

      // categorie.subCategories.forEach((element) {
      //   updatefiltersubCategories(element);
      // });
      filtersubCategories.removeWhere((element) => element.categoryId==categorie.id);
    }else{
print(categorie);
      filterCategories.add(categorie);
      categorie.subCategories.forEach((element) {
        updatefiltersubCategories(element);
      });
    }
   if(filterCategories.length>0){
     isflter.value=true;
   }else{
     isflter.value=false;
   }
    update();
}
updatf(){
  if(filterCategories.length>0){
    isflter.value=true;
  }else{
    isflter.value=false;
  }
  update();
}
  void updatefiltersubCategories(SubCategories categorie){
    print(filterCategories.where((element) => element.id==categorie.categoryId).length>0);
   if(filterCategories.where((element) => element.id==categorie.categoryId).length>0){


    if(filtersubCategories.where((element) => element.id==categorie.id).length>0){
      filtersubCategories.remove(categorie);
    }else{
      filtersubCategories.add(categorie);
    }

    update();
  }}
}
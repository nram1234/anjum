import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController{

 RxList<AllItems>cartlist=RxList<AllItems>();
 addToCart({AllItems item}){
   cartlist.add(item);
   update();
 }
 removefromcart({AllItems item}){
   cartlist.remove(item);

   update();
 }
 clearCartList(){
   cartlist.clear();
   update();
 }

 removeAllChooseItexfromcart({AllItems item}){

   for(int i=0;i<cartlist.length;i++){
     if(cartlist[i]==item){
       cartlist.remove(item);
     }
   }

   update();
 }


}
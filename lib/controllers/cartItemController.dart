import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController{

 List<AllItems>cartlist=[];
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




}
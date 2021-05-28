import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController{

 List<ItemDetails>cartlist=[];
 addToCart({ItemDetails item}){
   cartlist.add(item);
   update();
 }
 removefromcart({ItemDetails item}){
   cartlist.remove(item);

   update();
 }
 clearCartList(){
   cartlist.clear();
   update();
 }




}

import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController{

  Map<String,double>PriceafterDes={};
  Map<String,double>total_Tax={};
  Map<String,int>itemcount={};
 RxList<AllItems>cartlist=RxList<AllItems>();
Map<int,double>discount={};
 Map<int,double>bounce={};
var itemInCart =0.obs;
 addToCart({required AllItems item}){
   cartlist.add(item);
   update();
 }
 removefromcart({required AllItems item}){
   cartlist.remove(item);

   update();
 }
 clearCartList(){
   cartlist.clear();
   update();
 }

 removeAllChooseItexfromcart({required AllItems item}){
//
//    for(int i=0;i<cartlist.length;i++){
// print(i);
// print(cartlist[i].id);
// print(item.id);
//      if(cartlist[i].id==item.id){
//        cartlist.remove(item);
//      }
//    }
cartlist.removeWhere((element) => element.id==item.id);

itemInCart.value-=1;
  update();
  print(itemInCart.value);
 }

additemInitemInCart({required AllItems item}){
  bool v= cartlist.contains(item);

if(!v){
  itemInCart++;

}
}
 removeitemInitemInCart({required AllItems item}){
   bool v= cartlist.any((e) => e.id==item.id);
   if(!v){
     itemInCart--;

   }
 }
 removeitem(){
   itemInCart-1;
 }
}

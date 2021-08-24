import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController{

  Map<String,double>PriceafterDes={};
  Map<String,double>total_Tax={};
  Map<String,int>itemcount={};
 RxList<AllItems>cartlist=RxList<AllItems>();
Map<int,double>discount={};
 Map<int,double>bounce={};
var itemInCart =0.obs;
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

additemInitemInCart({AllItems item}){
  bool v= cartlist.contains(item);

if(!v){
  itemInCart++;

}
}
 removeitemInitemInCart({AllItems item}){
   bool v= cartlist.any((e) => e.id==item.id);
   if(!v){
     itemInCart--;

   }
 }
}

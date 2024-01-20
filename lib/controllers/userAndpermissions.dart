import 'package:anjum/network/json/login_json.dart';
import 'package:get/get.dart';

class UserAndPermissions extends GetxController{
 late  User user ;
 late Permissions permissions;

void setuser(User use){
  user=use;
  update();
}
 void setPermissions(Permissions permission){
    permissions=permission;
    update();
  }
}
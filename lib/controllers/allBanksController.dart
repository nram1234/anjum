
import 'package:anjum/network/jsonofnwetry/get_fourth_step_json.dart';
import 'package:get/get.dart';

class AllBanksController extends GetxController{

  List<AllBanks> allBanks=[];
  void updateallBanksData(List<AllBanks> allBanks){
    this.allBanks=allBanks;
    update();
  }



}
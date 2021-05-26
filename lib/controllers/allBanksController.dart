import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:get/get.dart';

class AllBanksController extends GetxController{

  List<AllBanks> allBanks=[];
  void updateallBanksData(List<AllBanks> allBanks){
    this.allBanks=allBanks;
    update();
  }



}
import 'package:anjum/network/controllers/network_controller.dart';
import 'package:get/get.dart';

class NetWorkBinding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut<NetWorkController>(() => NetWorkController());
  }

}
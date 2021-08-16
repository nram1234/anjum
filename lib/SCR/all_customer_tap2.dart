import 'package:anjum/controllers/all_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class All_customer_tap2 extends StatefulWidget {
  const All_customer_tap2({Key  key}) : super(key: key);

  @override
  _All_customer_tap2State createState() => _All_customer_tap2State();
}

class _All_customer_tap2State extends State<All_customer_tap2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<All_routesController>(builder: (logic){
      // logic.allRoutes[]
    },),);
  }
}

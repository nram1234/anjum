import 'package:anjum/controllers/get_order_statusController.dart';
import 'package:anjum/controllers/get_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.dart';
import 'netSalesReport.dart';
import 'paymentReport.dart';
import 'salesTargetReport.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
              height: size.height * .3,
              width: size.width,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/bk.png',
                    width: size.width,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      left: size.width * .11,
                      top: size.height * .11,
                      child: Text(
                        'Reports',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  Positioned(
                    right: size.width * .05,
                    top: size.height * .1,
                    child: Container(
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()),
                              );
                            },
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                              size: 30,
                            ))),
                  ),
                  Positioned(
                      left: size.width * .05,
                      top: size.height * .05,
                      child: GestureDetector(onTap: (){
    Navigator.pop(context);},
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        ),
                      ))
                ],
              )),
          Positioned(
              right: 0,
              left: 0,
              top: size.height * .2,
              child: Container(
                height: size.height * .8,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(onTap: (){
                      Get.to(NetSalesReport());
                    },
                      child: Container(padding: EdgeInsets.only(left: 30,right: 30),  height: size.height * .1,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Net Sales',style: TextStyle(fontSize: 25),),
                              Icon(Icons.arrow_forward_ios,size: 50,)
                            ],
                          )),
                    )
                 ,   SizedBox(
                      height: 20,
                    ),
                    GestureDetector(onTap: (){
                      Get.to(SalesTargetReport());

                    },
                      child: Container(padding: EdgeInsets.only(left: 30,right: 30),  height: size.height * .1,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sales order',style: TextStyle(fontSize: 25),),
                              Icon(Icons.arrow_forward_ios,size: 50,)
                            ],
                          )),
                    )
               ,     SizedBox(
                      height: 20,
                    ),
                    GestureDetector(onTap: (){
                      Get.to(PaymentReport());
                    },
                      child: Container(padding: EdgeInsets.only(left: 30,right: 30),  height: size.height * .1,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Payment',style: TextStyle(fontSize: 25),),
                              Icon(Icons.arrow_forward_ios,size: 50,)
                            ],
                          )),
                    )],
                ),
              )),
        ],
      ),
    ));
  }

  @override
  void initState() {
    GetReportsController controller=Get.put(GetReportsController());

    super.initState();
  }
}

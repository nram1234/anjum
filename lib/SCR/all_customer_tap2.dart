import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/all_routes.dart';
import 'package:anjum/controllers/timeController.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dashboard.dart';
import 'myMapScr.dart';

class All_customer_tap2 extends StatefulWidget {
  const All_customer_tap2({Key key}) : super(key: key);

  @override
  _All_customer_tap2State createState() => _All_customer_tap2State();
}

class _All_customer_tap2State extends State<All_customer_tap2> {
  final TimeController c = Get.find<TimeController>();
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<All_routesController>(
        builder: (logic) {
          return ListView.builder(
              itemCount: logic.routMaptoshwkeys.length,
              itemBuilder: (context, pos) {
                return ExpansionTile(
                  title: Text(" Route Name : ${logic.routMaptoshw[logic.routMaptoshwkeys[pos]].name}"),
                  children: logic.routMaptoshw[logic.routMaptoshwkeys[pos]].listRoutesInfo.map((e) {
                    return InkWell(onTap: (){
                if (Get.find<AllChequesController>().customer == null||!c.startswatch.value) {
                      Get.find<AllChequesController>()
                          .setcustomer(logic.mapOfCustomar[e.customerId]);

                      Get.find<AllChequesController>().setcustomerID(
       e.customerId);

                      setState(() {});
                      //arguments:  [bata.allCustomers[pos]]
                      Get.to(()=>Dashboard(),  );
                    }
                else {
                  if (e.customerId ==
                      Get.find<AllChequesController>()
                          .customer
                          .customerInfo
                          .id) {
                    Get.to(()=>Dashboard());
                  } else {
                    Get.snackbar('','stopvisitingfirst'.tr);
                  }
                }      },
                      child: item(
                          data: logic.mapOfCustomar[e.customerId], size: _size),
                    );
                  }).toList(),
                ); //item(data: logic.allCustomarInRouts()[pos], size: _size);
              });
        },
      ),
    );
  }

  bool iscust(AllCustomers data) {
    if (Get.find<AllChequesController>().customer != null) {
      return Get.find<AllChequesController>().customer.customerInfo.id ==
          data.customerInfo.id;
    } else {
      return false;
    }
  }

  Widget item({size, AllCustomers data}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black26,
          //     blurRadius: 10.0,
          //     offset: const Offset(0.0, 10.0),
          //   ),
          // ],
        ),
        height: size.height * .22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Image.network(
                  data.customerInfo.image,
                  width: size.height * .08,
                  height: size.height * .08,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(width: 1, height: size.height * .2, color: Colors.cyan),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.customerInfo.customerNameEn,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: size.width * .5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      //+"\n"+data.customerInfo.area2??
                      children: [
                        Icon(Icons.add_location),
                        Text(data.customerInfo.phoneNo ?? ""),
                        Expanded(child: Container()),
                        //if(iscust(data))     Image.asset('assets/images/fast.png')
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: size.width * .7,
                    height: 10,
                    child: DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: Colors.cyan,
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(Icons.info_sharp),
                        InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                Stack(
                                  children: <Widget>[
                                    //...bottom card part,
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.only(
                                        top: Consts.avatarRadius +
                                            Consts.padding,
                                        bottom: Consts.padding,
                                        left: Consts.padding,
                                        right: Consts.padding,
                                      ),
                                      margin: EdgeInsets.only(
                                          top: Consts.avatarRadius),
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(
                                            Consts.padding),
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.black26,
                                        //     blurRadius: 10.0,
                                        //     offset: const Offset(0.0, 10.0),
                                        //   ),
                                        // ],
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          //  mainAxisSize: MainAxisSize.min,
                                          // To make the card compact
                                          children: <Widget>[
                                            Text(
                                              'customername'.tr +
                                                  ' : ' +
                                                  '${data.customerInfo.customerNameEn}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Email' +
                                                  ' : ' +
                                                  '${data.customerInfo.email}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'customertype'.tr +
                                                  ' :  ' +
                                                  '${data.customerInfo.customerTypeId}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'phone'.tr +
                                                  ' : ' +
                                                  '${data.customerInfo.phoneNo}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Fax : ${data.customerInfo.fax}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'state'.tr +
                                                  ' : ' +
                                                  '${data.customerInfo.stateId}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'city'.tr +
                                                  ' : ' +
                                                  '${data.customerInfo.cityId}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'creditlimit'.tr +
                                                  ' : ' +
                                                  '${data.customerInfo.creditLimit}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Cheque Due Date : ${data.customerInfo.chequeDueDate}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'paymenttype'.tr +
                                                  ' : ' +
                                                  '${data.customerInfo.paymentType}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'location'.tr +
                                                  ' : ' +
                                                  '${data.customerInfo.area1}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'pricelist'.tr +
                                                  ' : ' +
                                                  '${data.priceListsInfo[0].id}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      left: Consts.padding,
                                      right: Consts.padding,
                                      child: CircleAvatar(
                                        //backgroundColor: Colors.blueAccent,
                                        // backgroundImage: NetworkImage(
                                        //     data.customerInfo.image,
                                        //     scale: .2),
                                        radius: Consts.avatarRadius,
                                        child: ClipOval(
                                          child: Image.network(
                                            data.customerInfo.image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    //...top circlular image part,
                                  ],
                                ),
                                // backgroundColor: Colors.white54,
                                // isDismissible: true,
                                // shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(10),
                                //     side: BorderSide(
                                //         color: Colors.white54,
                                //         style: BorderStyle.solid,
                                //         width: 2)),
                              );
                            },
                            child: Text('Customer info')),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(Icons.map),
                        InkWell(
                            onTap: () {
                              //   location
                              List<String> l =
                                  data.customerInfo.location.split(',');
                              // var lat=double.tryParse(l[0].trim());
                              // var Lng=double.tryParse(l[1].trim());

                              LatLng loc = LatLng(double.tryParse(l[0].trim()),
                                  double.tryParse(l[1].trim()));
                              Get.to(() => MyMapScr(
                                    loc: loc,
                                    name: data.customerInfo.customerNameEn,
                                  ));
                            },
                            child: Text('view map')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 70;
}

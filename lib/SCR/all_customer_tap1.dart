import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/allCustomersControllers.dart';
import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/priceListsInfoController.dart';
import 'package:anjum/controllers/timeController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/newjosomnLast/get_second_step1_json.dart';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dashboard.dart';
import 'myMapScr.dart';

class All_customer_tap1 extends StatefulWidget {
  @override
  _All_customer_tap1State createState() => _All_customer_tap1State();
}

class _All_customer_tap1State extends State<All_customer_tap1> {
  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());

  // AllCustomersControllers bata =Get.find<AllCustomersControllers>() ;
  PriceListsInfoController pricelistinf = Get.put(PriceListsInfoController());
  var allItemsController = Get.find<AllItemsController>();
  final TimeController c = Get.find<TimeController>();

  @override
  Widget build(BuildContext context) {
//     print('----------------------------------------------------------------------------------');
// print(Get.locale.languageCode =="ar");
// print(Get.locale.languageCode =="en");
//     print('----------------------------------------------------------------------------------');
    var size = MediaQuery.of(context).size;
    return Scaffold(body: GetBuilder<AllCustomersControllers>(
      builder: (logic) {

        return logic.loading.value?Center(child: CircularProgressIndicator(),): ListView.builder(
            itemCount: logic.serchWord.trim().isNotEmpty
                ? logic.allCustomersSerchFilter.length
                : logic.allCustomers.length,
            itemBuilder: (context, pos) {
              return InkWell(
                  onTap: () {
                    if (Get.find<AllChequesController>().customer == null ||
                        !c.startswatch.value) {
                      allItemsController.clearcustomerListItems();
                      // pricelistinf.makeAListOfPriceListsInfo(
                      //     logic.serchWord.trim().isNotEmpty
                      //         ? logic.allCustomersSerchFilter[pos].priceListId
                      //         : logic.allCustomers[pos].priceListId);

                      Get.find<AllChequesController>()
                          .setcustomer(logic.allCustomers[pos]);

                      Get.find<AllChequesController>().setcustomerID(logic
                              .serchWord
                              .trim()
                              .isNotEmpty
                          ? logic.allCustomersSerchFilter[pos].id
                          : logic.allCustomers[pos].id);

                      setState(() {});
                      //arguments:  [bata.allCustomers[pos]]
                      Get.to(
                        () => Dashboard(),
                      );
                    } else {
                      if (logic.allCustomers[pos].id ==
                          Get.find<AllChequesController>()
                              .customer

                              .id) {
                        Get.to(() => Dashboard());
                      } else {
                        Get.snackbar(  'stopvisitingfirst'.tr, Get.locale?.languageCode =="ar"?    Get.find<AllChequesController>().customer.customerNameAr:    Get.find<AllChequesController>().customer.customerNameEn);
                      }
                    }
                  },
                  child: item(
                      size: size,
                      data: logic.serchWord.trim().isNotEmpty
                          ? logic.allCustomersSerchFilter[pos]
                          : logic.allCustomers[pos]));
            });
      },
    ));
  }

  bool iscust(AllCustomers data) {
    if (Get.find<AllChequesController>().customer != null) {
      return Get.find<AllChequesController>().customer. id ==
          data. id;
    } else {
      return false;
    }
  }

  Widget item({size, AllCustomers? data}) {

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
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(8.0),
            //   child: Container(
            //     padding: EdgeInsets.all(16),
            //     child: CachedNetworkImage(imageUrl:data.image ,width: size.height * .08,
            //       height: size.height * .08,
            //       fit: BoxFit.fill,)
            //
            //     // Image.network(
            //     //   data.customerInfo.image,
            //     //   width: size.height * .08,
            //     //   height: size.height * .08,
            //     //   fit: BoxFit.fill,
            //     // ),
            //   ),
            // ),
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
                    data?.customerNameEn??"",
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
                        Text(data?.phoneNo ?? ""),
                        Expanded(child: Container()),
                        if (iscust(data!)) Image.asset('assets/images/fast.png')
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
                                                  '${Get.locale?.languageCode =="en" ?data.customerNameEn:data.customerNameAr}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Email' +
                                                  ' : ' +
                                                  '${data.email}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'customertype'.tr +
                                                  ' :  ' +
                                                  '${data.customerTypeId}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'phone'.tr +
                                                  ' : ' +
                                                  '${data.phoneNo}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Fax : ${data.fax}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'state'.tr +
                                                  ' : ' +
                                                  '${data.stateId}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'city'.tr +
                                                  ' : ' +
                                                  '${data.cityId}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'creditlimit'.tr +
                                                  ' : ' +
                                                  '${data.creditLimit}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Cheque Due Date : ${data.chequeDueDate}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'paymenttype'.tr +
                                                  ' : ' +
                                                  '${data.paymentType}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'location'.tr +
                                                  ' : ' +
                                                  '${data.area1}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'pricelist'.tr +
                                                  ' : '
                                                  // +
                                                  // '${data.priceListsInfo[0].id}'
                                              ,
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
                                            data.image,
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
                            child: Text('info'.tr)),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(Icons.map),
                        InkWell(
                            onTap: () {
                              //   location
                              List<String> l =
                                  data.location.split(',');
                              // var lat=double.tryParse(l[0].trim());
                              // var Lng=double.tryParse(l[1].trim());

                              LatLng loc = LatLng(double.tryParse(l[0].trim())??0,
                                  double.tryParse(l[1].trim())??0);
                              Get.to(() => MyMapScr(
                                    loc: loc,
                                    name: data.customerNameEn,
                                  ));
                            },
                            child: Text('map'.tr)),
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

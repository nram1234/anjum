import 'package:anjum/controllers/allCustomersControllers.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/customer_json.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'dashboard.dart';

class All_customer_tap1 extends StatefulWidget {
  @override
  _All_customer_tap1State createState() => _All_customer_tap1State();
}

class _All_customer_tap1State extends State<All_customer_tap1> {
  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());
  var bata = Get.find<AllCustomersControllers>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView.builder(
            itemCount: bata.allCustomers.length,
            itemBuilder: (context, pos) {
              return InkWell(
                  onTap: () {
                    Get.to(Dashboard(), arguments: 59);
                  },
                  child: item(size: size, data: bata.allCustomers[pos]));
            }));
  }

  Widget item({size, AllCustomers data}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        height: size.height * .15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(padding: EdgeInsets.all(16),
                child: Image.network(
                  data.customerInfo.image,
                  width: size.height * .1,
                  height: size.height * .1,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(width: 1, height: size.height * .15, color: Colors.cyan),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  data.customerInfo.customerNameEn,
                  maxLines: 1,
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
                    //data.customerInfo.area1??""+"\n"+data.customerInfo.area2??
                    children: [
                      Icon(Icons.add_location),
                      Text("hghjgjhj"),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Container(width: size.width*.6, height: 10,child:    DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.cyan,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),),
                Padding(
                  padding: const EdgeInsets.only( bottom: 8),
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
                                      top: Consts.avatarRadius + Consts.padding,
                                      bottom: Consts.padding,
                                      left: Consts.padding,
                                      right: Consts.padding,
                                    ),
                                    margin:
                                        EdgeInsets.only(top: Consts.avatarRadius),
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                          BorderRadius.circular(Consts.padding),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10.0,
                                          offset: const Offset(0.0, 10.0),
                                        ),
                                      ],
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        //  mainAxisSize: MainAxisSize.min,
                                        // To make the card compact
                                        children: <Widget>[
                                          Text(
                                            'Customer Name : ${data.customerInfo.customerNameEn}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Email : ${data.customerInfo.email}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Customer Type : ${data.customerInfo.customerTypeId}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Phone Number : ${data.customerInfo.phoneNo}',
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
                                            'State : ${data.customerInfo.status}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'City : ${data.customerInfo.cityId}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Credit Limit : ${data.customerInfo.creditLimit}',
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
                                            'Payment Type : ${data.customerInfo.paymentType}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Location : ${data.customerInfo.area1}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Price List : ${data.priceListsInfo[0].id}',
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
                                      backgroundImage: NetworkImage(
                                          data.customerInfo.image,
                                          scale: .2),
                                      radius: Consts.avatarRadius,
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
                      Text('view map'),
                    ],
                  ),
                ),
              ],
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
  static const double avatarRadius = 66.0;
}

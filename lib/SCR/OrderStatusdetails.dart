import 'package:anjum/controllers/allCustomersControllers.dart';
import 'package:anjum/network/json/get_order_status_json.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:get/get.dart';
import './home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatusdetails extends StatelessWidget {
  AllOrderStatus data;

  OrderStatusdetails(this.data);

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
                      left: size.width * .1,
                      top: size.height * .12,
                      child: Text(
                        'Transaction',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  Positioned(
                      right: size.width * .05,
                      top: size.height * .05,
                      child: Container(
                          child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(Home());
                              },
                              child: Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ))),
                  Positioned(
                      left: size.width * .05,
                      top: size.height * .05,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: size.width * .9,
                        // height: 147.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: const Color(0xFFB3B3B3).withOpacity(0.5),
                          //     offset: Offset(0, 4.0),
                          //     blurRadius: 20.0,
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Customer Name',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Container(
                                    width: size.width * .4,
                                    child: Text(
                                      Get.locale?.languageCode == "ar"
                                          ? data.customerNameAr
                                          : data.customerNameEn,
                                      //Get.find<AllCustomersControllers>().mapofCustomer[data.customerId].customerNameEn:Get.find<AllCustomersControllers>().mapofCustomer[data.customerId].customerNameAr,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(
                            //         'Order Number',
                            //         style: TextStyle(
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       Expanded(
                            //         flex: 1,
                            //         child: Container(),
                            //       ),
                            //       Container(
                            //         width: size.width * .4,
                            //         child: Text(
                            //           data.id,
                            //           style: TextStyle(
                            //             fontSize: 16,
                            //           ),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'From Store',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Container(
                                    width: size.width * .4,
                                    child: Text(
                                      data.storeId,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'number of items',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Container(
                                    width: size.width * .4,
                                    child: Text(
                                      data.noOfItems,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         'price without tax and discount',
                            //         style: TextStyle(
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       Expanded(
                            //         flex: 1,
                            //         child: Container(),
                            //       ),
                            //       Text(
                            //         data.totalPriceWithoutTaxDiscount,
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            //
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         'total tax',
                            //         style: TextStyle(
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       Expanded(
                            //         flex: 1,
                            //         child: Container(),
                            //       ),
                            //       Container(
                            //         width: size.width * .4,
                            //         child: Text(
                            //           data.totalTax,
                            //           style: TextStyle(
                            //             fontSize: 16,
                            //           ),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         'total discount',
                            //         style: TextStyle(
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       Expanded(
                            //         flex: 1,
                            //         child: Container(),
                            //       ),
                            //       Container(
                            //         width: size.width * .4,
                            //         child: Text(
                            //           data.totalDiscount,
                            //           style: TextStyle(
                            //             fontSize: 16,
                            //           ),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'total price',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Container(
                                    width: size.width * .4,
                                    child: Text(
                                      data.totalPrice,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(data.supervisorStatus == "pending"
                                      ? 'assets/images/pause.png'
                                      : data.supervisorStatus == "rejected"
                                          ? 'assets/images/cancel.png'
                                          : 'assets/images/accepted.png'),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    data.supervisorStatus,
                                    style: TextStyle(
                                        color:
                                            data.supervisorStatus == "pending"
                                                ? Colors.orange
                                                : data.supervisorStatus ==
                                                        "rejected"
                                                    ? Colors.red
                                                    : Colors.green),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: ListView.builder(
                    //       itemCount: 50,
                    //       itemBuilder: (context, pos) {
                    //         return listItem(size: size);
                    //       }),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text('Add note'),
                    // ),
                    Center(
                      child: Container(
                        width: size.width * .85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 5,
                          //     blurRadius: 7,
                          //     offset:
                          //         Offset(0, 3), // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }

  Widget listItem({required Size size}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        width: size.width * .9,
        // height: 147.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color(0xFFB3B3B3).withOpacity(0.5),
          //     offset: Offset(0, 4.0),
          //     blurRadius: 20.0,
          //   ),
          // ],
        ),
        child: Row(
          children: [
            Container(
              width: size.height * .1,
              height: size.height * .1,
              color: Colors.indigo,
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Safi  - corn oil 1 liter'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Price - 20.00 JD'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('No of items'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

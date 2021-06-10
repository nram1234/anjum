import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/myModel.dart';
import 'package:anjum/DB/tabelname/make_older.dart';
import 'package:anjum/controllers/allCustomersControllers.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';
import './OrderStatusdetails.dart';
import 'package:adobe_xd/page_link.dart';
import './home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatus extends StatefulWidget {
  OrderStatus({
    Key key,
  }) : super(key: key);

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  String cat = 'All Categories';
  List<Sales_Order_Requests_Model> data = [];

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
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: [
                          //     Text('Product 3',
                          //         style: TextStyle(
                          //             color: Colors.white, fontSize: 18)),
                          //     Text('12 jd',
                          //         style: TextStyle(
                          //             color: Colors.white, fontSize: 18)),
                          //   ],
                          // ),
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
                          padding: const EdgeInsets.all(4.0),
                          width: size.width * .85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: cat,
                                  onChanged: (String newValue) {
                                    data.clear();
                                    cat = newValue;

                                    setState(() {});
                                  },
                                  items: [
                                DropdownMenuItem(
                                  value: 'All Categories',
                                  child: Text('All Categories'),
                                ),
                                DropdownMenuItem(
                                  value: 'Rejected',
                                  child: Text('Rejected'),
                                ),
                                DropdownMenuItem(
                                  value: 'Accepted',
                                  child: Text('Accepted'),
                                ),
                                DropdownMenuItem(
                                  value: 'Pending',
                                  child: Text('Pending'),
                                )
                              ])),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FutureBuilder<List<Sales_Order_Requests_Model>>(
                            future: DatabaseHelper().get_All_sales_order_requests(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                for (int i = 0; i < snapshot.data.length; i++) {
                                  if (cat == 'All Categories') {
                                    data.add(snapshot.data[i]);

                                  } else if (cat == 'Rejected') {

                                      if (snapshot.data[i]
                                              .request_status ==
                                          'Rejected')
                                        data.add(snapshot.data[i]);


                                  }else if (cat == 'Accepted') {

                                      if (snapshot.data[i]
                                          .request_status ==
                                          'Accepted') {
                                        data.add(snapshot.data[i]);
                                      }

                                  }else if (cat == 'Pending') {

                                      if (snapshot.data[i]
                                          .request_status ==
                                          'Pending') {
                                        data.add(snapshot.data[i]);
                                      }

                                  }
                                }
                                return ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, pos) {
                                      return GestureDetector(
                                          onTap: () {
                                            Get.to(OrderStatusdetails);
                                          },
                                          child: listItem(size: size,data: snapshot.data[pos]));
                                    });
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                      ),
                    ],
                  ))),
        ],
      ),
    ));
  }

  Widget listItem({size, Sales_Order_Requests_Model data}) {
    String name='';
    String storname='';
    List<AllCustomers> allCustomers=   Get.find<AllCustomersControllers>().allCustomers;

    for(int i=0;i<allCustomers.length;i++){
   if(allCustomers[i].customerInfo.id==data.customer_id){
     name=allCustomers[i].customerInfo.customerNameEn;
   }
    }


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        width: size.width * .9,
        // height: 147.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFB3B3B3).withOpacity(0.5),
              offset: Offset(0, 4.0),
              blurRadius: 20.0,
            ),
          ],
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Container(
                    width: size.width * .4,
                    child: Text(
                      name,
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Number',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Container(
                    width: size.width * .4,
                    child: Text(
                      data.store_id.toString(),
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
                    'From Store',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Container(
                    width: size.width * .4,
                    child: Text(
                      data.store_id.toString(),
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
                  Image.asset('assets/images/accepted.png'),
                  SizedBox(
                    width: 2,
                  ),
                  Text(data.request_status),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Icon(Icons.info),
                  InkWell(
                    onTap: () {
                      Get.to(OrderStatusdetails());
                    },
                    child: Text(
                      'Order Details',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

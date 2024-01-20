import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/myModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class SalesOrderDetails extends StatefulWidget {
  int data = Get.arguments;

  @override
  _SalesOrderDetailsState createState() => _SalesOrderDetailsState();
}

//get_sales_order_requests
class _SalesOrderDetailsState extends State<SalesOrderDetails> {
 late Sales_Order_Requests_Model _sales_order_requests_model;
  bool getdata = true;

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
                ],
              )),
          Positioned(
            top: size.height * .06,
            right: size.width * .02,
            child: GestureDetector(
              onTap: () {
                Get.offAll(Home());
              },
              child: Container(
                  height: 75,
                  width: 75,
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
          ),
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
              )),
          Positioned(
              left: size.width * .1,
              top: size.height * .1,
              child: Text(
                'Sales Order Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          Positioned(
              right: 0,
              left: 0,
              top: size.height * .2,
              child: Container(
                  height: size.height * .8,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: StreamBuilder<Sales_Order_Requests_Model>(
                      stream: DatabaseHelper()
                          .get_sales_order_requests(widget.data)
                          .asStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          _sales_order_requests_model=snapshot.data!;
                          return Column(
                            children: [
                              Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Sales Order',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    color: Colors.white,
                                    child: Column(
                                            children: [
                                              item(
                                                  mydata:
                                                      _sales_order_requests_model
                                                          .id
                                                          .toString(),
                                                  lab: 'Order No :'),
                                              item(
                                                  mydata:
                                                      _sales_order_requests_model
                                                              .store_id
                                                              .toString() ??
                                                          "",
                                                  lab: 'Store Id :'),
                                              item(
                                                  mydata:
                                                      _sales_order_requests_model
                                                              .supervisor_id
                                                              .toString() ??
                                                          "",
                                                  lab: 'Supervisor No :'),
                                              item(
                                                  mydata:
                                                      _sales_order_requests_model
                                                              .no_of_items ??
                                                          "",
                                                  lab: 'No of Items :'),
                                              item(
                                                  mydata: _sales_order_requests_model
                                                          .total_price_without_tax_discount
                                                          .toString() ??
                                                      "",
                                                  lab: 'Price Without Tax :'),
                                              item(
                                                  mydata:
                                                      _sales_order_requests_model
                                                              .total_tax
                                                              .toString() ??
                                                          "",
                                                  lab: 'Total Tax :'),
                                              item(
                                                  mydata:
                                                      _sales_order_requests_model
                                                              .total_discount
                                                              .toString() ??
                                                          "",
                                                  lab: 'Discount :'),
                                              item(
                                                  mydata:
                                                      _sales_order_requests_model
                                                              .total_price
                                                              .toString() ??
                                                          "",
                                                  lab: 'Total Price :'),
                                              item(
                                                  mydata:
                                                      _sales_order_requests_model
                                                              .total_price
                                                              .toString() ??
                                                          "",
                                                  lab: 'Total Price : '),
                                              item(
                                                  mydata:
                                                      _sales_order_requests_model
                                                              .request_status ??
                                                          "",
                                                  lab: 'Status of Pequest :'),
                                              item(
                                                  mydata:
                                                      _sales_order_requests_model
                                                              .customer_id
                                                              .toString() ??
                                                          "",
                                                  lab: 'Customer Name :')
                                            ],
                                          )),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }))),
        ],
      ),
    ));
  }

  Widget item({required String lab,required String mydata}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lab,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(mydata)
        ],
      ),
    );
  }


}
//
// / return Column(
// children: [
// Container(
// height: 50,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// children: [
// Text(
// 'Sales Order',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ),
// ),
// Expanded(
// flex: 1,
// child: Container(
// color: Colors.white,
// child: getdata
// ? Center(
// child: CircularProgressIndicator(),
// )
// : Column(
// children: [
// item(
// mydata:
// _sales_order_requests_model
//     .id
//     .toString(),
// lab: 'Order No :'),
// item(
// mydata:
// _sales_order_requests_model
//     .store_id
//     .toString() ??
// "",
// lab: 'Store Id :'),
// item(
// mydata:
// _sales_order_requests_model
//     .supervisor_id
//     .toString() ??
// "",
// lab: 'Supervisor No :'),
// item(
// mydata:
// _sales_order_requests_model
//     .no_of_items ??
// "",
// lab: 'No of Items :'),
// item(
// mydata: _sales_order_requests_model
//     .total_price_without_tax_discount
//     .toString() ??
// "",
// lab: 'Price Without Tax :'),
// item(
// mydata:
// _sales_order_requests_model
//     .total_tax
//     .toString() ??
// "",
// lab: 'Total Tax :'),
// item(
// mydata:
// _sales_order_requests_model
//     .total_discount
//     .toString() ??
// "",
// lab: 'Discount :'),
// item(
// mydata:
// _sales_order_requests_model
//     .total_price
//     .toString() ??
// "",
// lab: 'Total Price :'),
// item(
// mydata:
// _sales_order_requests_model
//     .total_price
//     .toString() ??
// "",
// lab: 'Total Price : '),
// item(
// mydata:
// _sales_order_requests_model
//     .request_status ??
// "",
// lab: 'Status of Pequest :'),
// item(
// mydata:
// _sales_order_requests_model
//     .customer_id
//     .toString() ??
// "",
// lab: 'Customer Name :')
// ],
// )),
// ),
// ],
// );
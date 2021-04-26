import 'package:anjum/SCR/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Container(
                    height: size.height * .3,
                    width: size.width,
                    color: Colors.blue,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/bk.png',
                          width: size.width,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                            left: size.width * .1,
                            top: size.height * .1,
                            child: Text(
                              'Transaction',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Positioned(
                            left: size.width * .05,
                            top: size.height * .05,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 50,
                            ))
                      ],
                    )),
                Positioned(
                    right: 0,
                    left: 0,
                    top: size.height * .2,
                    child: Container(
                      height: size.height * .7,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.replay),
                                    Text('Last data sync is 14/04/2021  12:90'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                item(
                                    color: Colors.pink[200],
                                    size: size,
                                    name: 'Payment',
                                    path: 'assets/images/payment.png'),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(Products());
                                  },
                                  child: item(
                                      color: Colors.orange[200],
                                      size: size,
                                      name: 'Sales Order',
                                      path: 'assets/images/order.png'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                item(
                                    color: Colors.pink[200],
                                    size: size,
                                    name: 'Return Invoice',
                                    path: 'assets/images/returninvoice.png'),
                                item(
                                    color: Colors.purpleAccent[200],
                                    size: size,
                                    name: 'Invoice',
                                    path: 'assets/images/invoice.png')
                              ],
                            ),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                item(
                                    color: Colors.purple[200],
                                    size: size,
                                    name: 'History',
                                    path: 'assets/images/history.png'),
                                item(
                                    color: Colors.lightGreen[200],
                                    size: size,
                                    name: 'SOA',
                                    path: 'assets/images/soaa.png')
                              ],
                            ),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                item(
                                    color: Colors.green[200],
                                    size: size,
                                    name: 'Before/After',
                                    path: 'assets/images/befor.png'),
                                item(
                                    color: Colors.orange[200],
                                    size: size,
                                    name: 'Photo',
                                    path: 'assets/images/pic.png')
                              ],
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: size.height * .1,
                    width: size.width,
                    decoration: BoxDecoration(
                        //   color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                            ),
                            height: size.height * .1,
                            child: Center(
                                child: Text(
                              'End Visit',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                            )),
                            height: size.height * .1,
                            child: Center(child: Text('123')),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }

  Widget item({String path, String name, size, Color color}) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: size.width * .45,
      height: size.width * .5,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              path,
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color),
          )
        ],
      ),
    );
  }
}

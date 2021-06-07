import 'package:flutter/material.dart';

import 'dashboard.dart';
class SalesTargetReport extends StatefulWidget {
  @override
  _SalesTargetReportState createState() => _SalesTargetReportState();
}

class _SalesTargetReportState extends State<SalesTargetReport> {
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
                          top: size.height * .1,
                          child: Text(
                            'Net Sales Report',
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
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
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Net Sales Report',
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Category :',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      '--',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Target :',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      '--'
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Actual :',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      '--',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sales Target  :',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                       '--',
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}

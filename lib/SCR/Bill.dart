import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bill extends StatefulWidget {
  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, pos) {
                  return Card(elevation: 8,
                    child: Directionality(textDirection: TextDirection.ltr,
                      child: ExpansionTile(expandedAlignment:Alignment.bottomRight ,
                        title: Text('Safi  -Sun Flower  oil 1 liter'),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Unit :EA'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Price :20JD'),
                                  ),
                                ],
                              )
                         ,  Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Qty: 25'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Discount: 0'),
                                  ),
                                ],
                              ),




                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Bounce :5.0'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Tax :16'),
                                  ),
                                ],
                              )],
                          )
              , Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Total :500 JD',style: TextStyle(color: Colors.teal),),
                  ),
                ],
              )     ],
                      ),
                    ),
                  );
                }),
          ),
          Container(padding: EdgeInsets.all(4),
            height: size.height * .4,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Cart totals'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('QTY-  53'), Text('Bounce -  10')],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Total - 63'),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: size.width * .9,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Total -'), Text('1080.00 JD')],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                  width: size.width * .9,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discount -'),
                      Text(
                        '- 60.00JD',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax -'),
                      Text(
                        '100.00JD',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                  width: size.width * .9,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Amount-'),
                      Text(
                        '100.00JD',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff2C4B89),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        width: size.width * .4,
                        child: Center(
                          child: Text(
                            'Print',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * .4,
                        height: 50,
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
                        child: Center(child: Text('Back')),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

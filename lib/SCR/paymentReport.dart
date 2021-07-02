import 'dart:ui';

import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/tabelname/insert_cheque_tabel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dashboard.dart';

class PaymentReport extends StatefulWidget {
  @override
  _PaymentReportState createState() => _PaymentReportState();
}

class _PaymentReportState extends State<PaymentReport> {
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
                        'Payment Report',
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
                      child: FutureBuilder<List<Insert_cheque_DB>>(
                          future:
                              DatabaseHelper().get_All_item_in_insert_cheque(),
                          builder: (context, snapshot) {
                            print(snapshot);
                            int noOfCash=0;
                            double amountofCashPayment=0;
                            double amountofChequePayment=0;
                            double totalamoun=0;
                            int noOfCeq=0;
                            if (snapshot.hasData) {
                              for(int i=0;i<snapshot.data.length;i++){
                                totalamoun=totalamoun+snapshot.data[i].amount;
                            if(snapshot.data[i].payment_type=="cash"){
                              amountofCashPayment=amountofCashPayment+snapshot.data[i].amount;
                              noOfCash++;
                            }else{
                              amountofChequePayment=amountofChequePayment+snapshot.data[i].amount;
                              noOfCeq++;
                            }
                              }
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'No of Cash Payment :',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                            noOfCash  .toStringAsFixed(3)
                                          // NumberFormat.currency(locale: 'eu', symbol: '').format(noOfCash)
                                          // .toString(),
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
                                          'No of Cheque Payment  :',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(noOfCeq.toStringAsFixed(3)
                                         //  NumberFormat.currency(locale: 'eu', symbol: '').format(noOfCeq)
                                         // .toString(),

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
                                          'Amount No of Cash Payment :',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(  amountofCashPayment. toStringAsFixed(3)
                                         //  NumberFormat.currency(locale: 'eu', symbol: '').format(amountofCashPayment)
                                         // .toString(),
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
                                          'Amount No of Cheque Payment  :',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                            amountofChequePayment.    toStringAsFixed(3)

                                          // NumberFormat.currency(locale: 'eu', symbol: '').format(amountofChequePayment)
                                          // .toString(),
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
                                          'Total Amount :',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                        totalamoun.   toStringAsFixed(3)
                                          // NumberFormat.currency(locale: 'eu', symbol: '').format(totalamoun)
                                          // .toString(),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    )
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}

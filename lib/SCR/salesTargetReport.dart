import 'package:anjum/controllers/get_reports_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'dashboard.dart';
class SalesTargetReport extends StatefulWidget {
  @override
  _SalesTargetReportState createState() => _SalesTargetReportState();
}

class _SalesTargetReportState extends State<SalesTargetReport> {
  String from = "From";
  String to = "To";
  DateTime selectedfromDate = DateTime.now();
  DateTime selectedtoDate = DateTime.now();
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
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16,bottom: 16),
                          child: Row(
                            children: [
                              Expanded(flex: 1,
                                child: InkWell(
                                    onTap: () async {
                                      final DateTime? selected =
                                      await showDatePicker(
                                        context: context,
                                        initialDate: selectedfromDate,
                                        firstDate: DateTime(2010),
                                        lastDate: DateTime(2030),
                                      );
                                      if (selected != null )
                                        setState(() {
                                          selectedfromDate = selected;
                                          from =
                                          "From :\n${selected.day}-${selected.month}-${selected.year}";
                                        });
                                    },
                                    child: Text(
                                      from,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              // SizedBox(
                              //   width: 16,
                              // ),
                              Expanded(flex: 1,
                                child: InkWell(
                                    onTap: () async {
                                      final DateTime? selected =
                                      await showDatePicker(
                                        context: context,
                                        initialDate: selectedfromDate,
                                        firstDate: DateTime(2010),
                                        lastDate: DateTime(2030),
                                      );
                                      if (selected != null  )
                                        setState(() {
                                          selectedtoDate = selected;
                                          to =
                                          "To :\n${selected.day}-${selected.month}-${selected.year}";
                                        });
                                    },
                                    child: Text(
                                      to,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              // SizedBox(
                              //   width: 16,
                              // ),
                              InkWell(onTap: (){

                                String formattedDatefrom=   DateFormat('yyyy-MM-dd').format(selectedfromDate);
                                String formattedDateto=   DateFormat('yyyy-MM-dd').format(selectedtoDate);
                                print(formattedDateto);
                                print(formattedDatefrom);
                                Get.find<GetReportsController>().getreportsbydate(from: formattedDatefrom,to: formattedDateto);
                              },child: Icon(Icons.refresh))
                            ],
                          ),
                        ),
                        Container(
                            color: Colors.white,
                            child:     GetBuilder<GetReportsController>(
                                builder: (logic) {
                                  return logic.get_reports_json != null
                                      ?  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total sales:',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                                logic.get_reports_json.result.reports.totalSales//.toStringAsFixed(3)

                                              // NumberFormat.currency(locale: 'eu', symbol: '').format(noofInvoices)
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
                                              'Total Sales Value :',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                                logic.get_reports_json.result.reports.totalSalesValue  //  .toStringAsFixed(3)
                                              //
                                              //  NumberFormat.currency(locale: 'eu', symbol: '').format( noOfReturnInvoices)
                                              // .toString(),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ) : Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }



                              // FutureBuilder<List<Sales_Order_Requests_Model>>(
                              //     future: DatabaseHelper().get_All_sales_order_requests(),
                              //     builder: (context, snapshot) {
                              //       print(snapshot);
                              //       double amountofInvoice = 0;
                              //       int noofInvoices = 0;
                              //       int noOfReturnInvoices = 0;
                              //       double totalamoun = 0;
                              //       double amountofReturnInvoice = 0;
                              //       if (snapshot.hasData) {
                              //         for (int i = 0; i < snapshot.data.length; i++) {
                              //
                              //             if (snapshot
                              //                     .data[i].request_type==
                              //                 'invoice') {
                              //               amountofInvoice = amountofInvoice +
                              //                   snapshot
                              //                       .data[i] .total_price;
                              //               noofInvoices++;
                              //             } else if (snapshot
                              //                     .data[i]. request_type  ==
                              //                 'return_invoice') {
                              //               amountofReturnInvoice =
                              //                   amountofReturnInvoice +
                              //                       snapshot.data[i]
                              //                           .total_price;
                              //               noOfReturnInvoices++;
                              //
                              //           }
                              //         }
                              //         return Column(
                              //           children: [
                              //             Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.spaceBetween,
                              //                 children: [
                              //                   Text(
                              //                     'No of Invoices:',
                              //                     style: TextStyle(fontSize: 18),
                              //                   ),
                              //                   Text(
                              //                       noofInvoices .toStringAsFixed(3)
                              //
                              //                     // NumberFormat.currency(locale: 'eu', symbol: '').format(noofInvoices)
                              //                     // .toString(),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.spaceBetween,
                              //                 children: [
                              //                   Text(
                              //                     'No Of Return Invoices :',
                              //                     style: TextStyle(fontSize: 18),
                              //                   ),
                              //                   Text(
                              //                       noOfReturnInvoices     .toStringAsFixed(3)
                              //
                              //                    //  NumberFormat.currency(locale: 'eu', symbol: '').format( noOfReturnInvoices)
                              //                    // .toString(),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.spaceBetween,
                              //                 children: [
                              //                   Text(
                              //                     'Amount of Invoice:',
                              //                     style: TextStyle(fontSize: 18),
                              //                   ),
                              //                   Text(
                              //                   amountofInvoice            .toStringAsFixed(3)
                              //
                              //                   // NumberFormat.currency(locale: 'eu', symbol: '').format(  amountofInvoice)
                              //                   //  .toString(),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.spaceBetween,
                              //                 children: [
                              //                   Text(
                              //                     'Amount of Return Invoice :',
                              //                     style: TextStyle(fontSize: 18),
                              //                   ),
                              //                   Text(
                              //                   amountofReturnInvoice               .toStringAsFixed(3)
                              //
                              //
                              //                   // NumberFormat.currency(locale: 'eu', symbol: '').format(amountofReturnInvoice)
                              //                   //  .toString(),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //             Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Row(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.spaceBetween,
                              //                 children: [
                              //                   Text(
                              //                     'Net Sales Amount :',
                              //                     style: TextStyle(fontSize: 18),
                              //                   ),
                              //                   Text(
                              //       (amountofInvoice-amountofReturnInvoice)  .toStringAsFixed(3)
                              //
                              //       // NumberFormat.currency(locale: 'eu', symbol: '').format((amountofInvoice-amountofReturnInvoice))
                              //       //           .toString(),
                              //                   ),
                              //                 ],
                              //               ),
                              //             )
                              //           ],
                              //         );
                              //       } else {
                              //         return Center(
                              //           child: CircularProgressIndicator(),
                              //         );
                              //       }
                              //     }),
                            )
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}

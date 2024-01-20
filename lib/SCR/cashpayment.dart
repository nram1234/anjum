import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/tabelname/insert_cheque_tabel.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/currencie_controller.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/controllers/network_controller.dart';
import 'package:anjum/network/jsonofnwetry/get_fourth_step_json.dart';
import 'package:anjum/network/networkReq.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'dashboard.dart';

class CashPay extends StatefulWidget {
  @override
  _CashPayState createState() => _CashPayState();
}

class _CashPayState extends State<CashPay> {
  // CurenceController _curenceController = Get.find<CurenceController>();
  var box = GetStorage();
  String date2 = 'Select Date';
  UserAndPermissions _userAndPermissions = Get.find<UserAndPermissions>();
  var allCheques = Get.find<AllChequesController>();
  String amount = '', addnote = '';
  AllNetworking _allNetworking = AllNetworking();
  int orderid = 1;

  Future<String> pickdate() async {
    DateTime? time = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
        context: context);
    print(time);

    date2 = time.toString().substring(0, 10);
    return date2;
  }

  List<Widget> drop = [];

  @override
  void initState() {
    super.initState();
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    date2 = formatter.format(now);
    orderid = box.read("cashnumber");
    if (orderid == null) {
      orderid = int.parse(_userAndPermissions.user.id.toString() + "001");
      print("orderidorderidorderidorderid      ${orderid}");
      box.write("cashnumber", orderid);
    } else {
      orderid++;
      box.write("cashnumber", orderid);
    }
  }

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
                height: size.height * 2,
                width: size.width,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bk.png',
                      width: size.width,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        left: size.width * .05,
                        top: size.height * .05,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 50,
                          ),
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
                        left: size.width * .1,
                        top: size.height * .12,
                        child: Text(
                          'Cashpayment'.tr,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ],
                )),
            Positioned(
                right: 0,
                left: 0,
                top: size.height * .2,
                child: SingleChildScrollView(
                  child: Container(
                    height: size.height * .8,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("date".tr,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                // onTap: () {
                                //   pickdate().then((value) {
                                //     if (value != null) {
                                //       date2 = value;
                                //       setState(() {});
                                //     }
                                //   });
                                // },
                                child: Container(
                                  height: 50,
                                  width: size.width * .85,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    color: Colors.white,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey.withOpacity(0.5),
                                    //     spreadRadius: 5,
                                    //     blurRadius: 7,
                                    //     offset: Offset(
                                    //         0, 3), // changes position of shadow
                                    //   ),
                                    // ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    date2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Amount".tr,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Container(
                              width: size.width * .85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                color: Colors.white,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.5),
                                //     spreadRadius: 5,
                                //     blurRadius: 7,
                                //     offset: Offset(
                                //         0, 3), // changes position of shadow
                                //   ),
                                // ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (v) {
                                        amount = v;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  GetBuilder<CurenceController>(
                                    builder: (logic) {
                                      return DropdownButton(
                                          elevation: 8,
                                          value: logic.defultCurrencies,
                                          hint: Text("اختار العملة"),
                                          onChanged: (v) {
                                            logic.setCurrenciedropdowen(
                                                allCurrencies: v!);
                                          },
                                          items: logic.allCurrencie.entries.map<
                                              DropdownMenuItem<
                                                  AllCurrencies>>((e) {
                                            return DropdownMenuItem<
                                                AllCurrencies>(
                                              value: logic.allCurrencie[
                                                  e.value.currencyName],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    '${e.value.currencyName} ${e.value.currencySymbol}'),
                                              ),
                                            );
                                          }).toList());
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('addnote'.tr,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: Container(
                              width: size.width * .85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                color: Colors.white,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.5),
                                //     spreadRadius: 5,
                                //     blurRadius: 7,
                                //     offset: Offset(
                                //         0, 3), // changes position of shadow
                                //   ),
                                // ],
                              ),
                              child: TextField(
                                onChanged: (v) {
                                  addnote = v;
                                },
                                maxLines: 6,
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
                          Expanded(child: Container()),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async {
                                  var d = [
                                    Insert_cheque_DB(
                                            searialno: orderid.toString(),
                                            user_id:
                                                _userAndPermissions.user.userId,
                                            employee_id:
                                                _userAndPermissions.user.id,
                                            customer_id: int.parse(
                                                Get.find<AllChequesController>()
                                                    .customer_id),
                                            amount: double.parse(amount),
                                            due_date: date2,
                                            customer_name: allCheques
                                                .customer.customerNameEn,
                                            note: addnote,
                                            payment_type: "cash",
                                            reference_no:
                                                allCheques.customer.refId,
                                            supervisor_id: _userAndPermissions
                                                .user.supervisorId,
                                            salesmanager_id: _userAndPermissions
                                                .user.salesmanagerId,
                                            salesman_name: '',
                                            payment_date: '',
                                            payment_no: '',
                                            bank_id: 55,
                                            branch_id: 5,
                                            drawer_name: "iiiuy" '',
                                            cheque_no: 5)
                                        .toJson()
                                  ];

                                  await Get.find<NetWorkController>()
                                      .initConnctivity();

                                  if (Get.find<NetWorkController>()
                                      .connectionStatus
                                      .value) {
                                    await _allNetworking.insert_cash(data: d);

                                    return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Container(
                                            width: size.width * .8,
                                            height: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Anjum',
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color:
                                                            Colors.indigoAccent,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                          content: Container(
                                            width: size.width * .8,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text('Paymentdone'.tr),
                                                  Row(
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            // Navigator.pop(context);
                                                            int count = 0;
                                                            Navigator.popUntil(
                                                                context,
                                                                (route) {
                                                              return count++ ==
                                                                  3;
                                                            });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .arrow_back),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Text('Back'.tr),
                                                              SizedBox(
                                                                width: 50,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(Icons
                                                                              .print),
                                                                          SizedBox(
                                                                            width:
                                                                                8,
                                                                          ),
                                                                          Text('printers'
                                                                              .tr)
                                                                        ],
                                                                      ))
                                                                ],
                                                              )
                                                            ],
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    DatabaseHelper()
                                        .insert_insert_cheque(
                                            item: Insert_cheque_DB(
                                      user_id: _userAndPermissions.user.userId,
                                      employee_id: _userAndPermissions.user.id,
                                      customer_id: int.parse(
                                          Get.find<AllChequesController>()
                                              .customer_id),
                                      amount: double.parse(amount),
                                      due_date: date2,
                                      customer_name:
                                          allCheques.customer.customerNameEn,
                                      note: addnote,
                                      payment_type: "cash",
                                      reference_no: allCheques.customer.refId,
                                      supervisor_id:
                                          _userAndPermissions.user.supervisorId,
                                      salesmanager_id: _userAndPermissions
                                          .user.salesmanagerId,
                                      searialno: '',
                                      salesman_name: '',
                                      payment_date: '',
                                      payment_no: '',
                                      bank_id: 5,branch_id: 55,cheque_no: 55,drawer_name: "ii",
                                    ))
                                        .then((value) {
                                      print(
                                          '999999999999999999999999999999999999999999');
                                      print(value);
                                    });

                                    return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Container(
                                            width: size.width * .8,
                                            height: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Anjum',
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color:
                                                            Colors.indigoAccent,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                          content: Container(
                                            width: size.width * .8,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text('Paymentdone'.tr),
                                                  Row(
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            // Navigator.pop(context);
                                                            int count = 0;
                                                            Navigator.popUntil(
                                                                context,
                                                                (route) {
                                                              return count++ ==
                                                                  3;
                                                            });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .arrow_back),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Text('Back'.tr),
                                                              SizedBox(
                                                                width: 50,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(Icons
                                                                              .print),
                                                                          SizedBox(
                                                                            width:
                                                                                8,
                                                                          ),
                                                                          Text('printers'
                                                                              .tr)
                                                                        ],
                                                                      ))
                                                                ],
                                                              )
                                                            ],
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: size.width * .85,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2C4B89),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

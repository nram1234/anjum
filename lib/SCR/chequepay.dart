import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/tabelname/insert_cheque_tabel.dart';
import 'package:anjum/controllers/allBanksController.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.dart';

class ChequePay extends StatefulWidget {
  @override
  _ChequePayState createState() => _ChequePayState();
}

class _ChequePayState extends State<ChequePay> {
  String getDate, date2;
  var allBanks = Get.find<AllBanksController>();
  var allCheques = Get.find<AllChequesController>();
  UserAndPermissions _userAndPermissions = Get.find<UserAndPermissions>();
  String Chequetime = 'Select Date';
  TextEditingController cheqnumber = TextEditingController();
  TextEditingController addnote = TextEditingController();
  TextEditingController chechamount = TextEditingController();
  AllNetworking _allNetworking=AllNetworking();
  Future<String> pickdate() async {
    var lastDate = DateTime.now().add(new Duration(
        days: int.tryParse(allCheques.customer.customerInfo.chequeDueDate)));
    DateTime time = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: lastDate, //DateTime(2050),
        context: context);
    print(time);

    date2 = time.toString().substring(0, 10);
    return date2;
  }

  AllBanks dropdownValueAllBanks;
  List<DropdownMenuItem<AllBanks>> _listDropdownAllBanks = [];

  //------------------------------------
  AllBankBranches dropdownValueAllBankBranches;
  List<DropdownMenuItem<AllBankBranches>> _listDropdownAllBankBranches = [];
  String drawerName;
  List<DropdownMenuItem<String>> drawer_nameDRMlist = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < allBanks.allBanks.length; i++) {
      _listDropdownAllBanks.add(DropdownMenuItem<AllBanks>(
        value: allBanks.allBanks[i],
        child: Text(allBanks.allBanks[i].bankNameEn),
      ));
    }
    for (int i = 0; i < allCheques.allCheques.length; i++) {
      // print('//==============================================================');
      // print(allCheques.allCheques[i].customerId == allCheques.customer_id);
      // print(allCheques.allCheques[i].customerId);
      // print(allCheques.customer_id);
      // print('//==============================================================');
      if (allCheques.allCheques[i].customerId == allCheques.customer_id) {
        print(allCheques.allCheques[i].customerId == allCheques.customer_id);

        for (int o = 0; o < allCheques.allCheques[i].listCheques.length; o++) {
          print(allCheques.allCheques[i].listCheques[o].drawerName);
          drawer_nameDRMlist.add(DropdownMenuItem<String>(
            value: allCheques.allCheques[i].listCheques[o].drawerName,
            child: Text(allCheques.allCheques[i].listCheques[o].drawerName),
          ));
          //   drawer_namelist.add(allCheques.allCheques[i].listCheques[o].drawerName);
        }
      }

      //

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
                child: Column(
                  children: [
                    Stack(
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
                              'Cheque Payment',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ],
                    ),
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          forinput(
                              size: size,
                              titel: 'Cheque No',
                              textEditingController: cheqnumber),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Bank'),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                width: size.width * .85,
                                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10),
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
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<AllBanks>(
                                        value: dropdownValueAllBanks,
                                        onChanged: (AllBanks newValue) {
                                          dropdownValueAllBanks = newValue;
                                          _listDropdownAllBankBranches.clear();
                                          for (int i = 0;
                                              i <
                                                  newValue
                                                      .allBankBranches.length;
                                              i++) {
                                            _listDropdownAllBankBranches.add(
                                                DropdownMenuItem<
                                                    AllBankBranches>(
                                              value:
                                                  newValue.allBankBranches[i],
                                              child: Text(newValue
                                                  .allBankBranches[i]
                                                  .branchNameEn),
                                            ));
                                          }
                                          setState(() {});
                                        },
                                        items: _listDropdownAllBanks)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Bank Branches'),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                width: size.width,
                                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10),
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
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<AllBankBranches>(
                                        value: dropdownValueAllBankBranches,
                                        onChanged: (AllBankBranches newValue) {
                                          dropdownValueAllBankBranches =
                                              newValue;

                                          setState(() {});
                                        },
                                        items: _listDropdownAllBankBranches)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Drawer '),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                width: size.width * .85,
                                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10),
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
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                        value: drawerName,
                                        onChanged: (String newValue) {
                                          drawerName = newValue;

                                          setState(() {});
                                        },
                                        items: drawer_nameDRMlist)),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Add note'),
                          ),
                          Center(
                            child: Container(
                              width: size.width * .85,
                              decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10),
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
                                controller: addnote,
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
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  pickdate().then((value) {
                                    if (value != null) {
                                      Chequetime = value;
                                      setState(() {});
                                    }
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: size.width * .85,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black, width: 1),
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
                                  child: Center(child: Text(Chequetime)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Chech Amount'),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                width: size.width * .85,
                                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10),
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
                                  controller: chechamount,
                                  keyboardType: TextInputType.number,
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
                          ),
                          // Center(
                          //   child: Container(
                          //     width: size.width * .85,
                          //     height: size.height * .2,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.0),
                          //       color: Colors.white,
                          //       border: Border.all(
                          //         width: 1.0,
                          //         color: const Color(0xFFEBEBEB),
                          //       ),
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Colors.black.withOpacity(0.05),
                          //           offset: Offset(0, 6.0),
                          //           blurRadius: 10.0,
                          //         ),
                          //       ],
                          //     ),
                          //     child: Center(
                          //       child: Image.asset(
                          //         'assets/images/cam.png',
                          //         fit: BoxFit.fill,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  var mydata=[Insert_cheque_DB(
                                    user_id: _userAndPermissions
                                        .user.userId,
                                    employee_id:
                                    _userAndPermissions.user.id,
                                    customer_id: int.parse(
                                        Get.find<AllChequesController>()
                                            .customer_id),
                                    amount: double.tryParse(
                                        chechamount.text),
                                    bank_id: int.tryParse(
                                        dropdownValueAllBanks.id),
                                    branch_id: int.tryParse(
                                        dropdownValueAllBankBranches
                                            .id),
                                    cheque_no:
                                    int.tryParse(cheqnumber.text),
                                    customer_name: allCheques.customer
                                        .customerInfo.customerNameEn,
                                    note: addnote.text,
                                    payment_date: Chequetime,
                                    payment_no: chechamount.text, //TO DO
                                    payment_type: "cheque",
                                    reference_no: allCheques.customer.customerInfo.refId,
                                    supervisor_id: _userAndPermissions.user.supervisorId,
                                    salesmanager_id: _userAndPermissions.user.salesmanagerId,
                                    due_date: Chequetime,
                                    drawer_name: drawerName,).toJson()];
                                  _allNetworking.insert_cheque_to_Web( data: mydata).then((value) {
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
                                                        color: Colors.indigoAccent,
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
                                                  Text('Payment done sucessfully'),
                                                  Row(
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            // Navigator.pop(context);
                                                            int  count = 0;
                                                            Navigator.popUntil(context, (route) {
                                                              return count++ == 3;
                                                            });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                  Icons.arrow_back),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Text('Back'),
                                                              SizedBox(
                                                                width: 50,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      child: Row(
                                                                        children: [
                                                                          Icon(Icons
                                                                              .print),
                                                                          SizedBox(
                                                                            width:
                                                                            8,
                                                                          ),
                                                                          Text(
                                                                              'Print')
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
                                  });
                                  // DatabaseHelper()
                                  //     .insert_insert_cheque(
                                  //         item: Insert_cheque_DB(
                                  //             user_id: _userAndPermissions
                                  //                 .user.userId,
                                  //             employee_id:
                                  //                 _userAndPermissions.user.id,
                                  //             customer_id: int.parse(
                                  //                 Get.find<AllChequesController>()
                                  //                     .customer_id),
                                  //             amount: double.tryParse(
                                  //                 chechamount.text),
                                  //             bank_id: int.tryParse(
                                  //                 dropdownValueAllBanks.id),
                                  //             branch_id: int.tryParse(
                                  //                 dropdownValueAllBankBranches
                                  //                     .id),
                                  //             cheque_no:
                                  //                 int.tryParse(cheqnumber.text),
                                  //             customer_name: allCheques.customer
                                  //                 .customerInfo.customerNameEn,
                                  //             note: addnote.text,
                                  //             payment_date: Chequetime,
                                  //             payment_no: chechamount.text,
                                  //             payment_type: "cheque",
                                  //             reference_no: allCheques.customer.customerInfo.refId,
                                  //             supervisor_id: _userAndPermissions.user.supervisorId,
                                  //             salesmanager_id: _userAndPermissions.user.salesmanagerId,
                                  //             due_date: Chequetime,
                                  //             drawer_name: drawerName))
                                  //     .then((value) {
                                  //   print(
                                  //       '999999999999999999999999999999999999999999');
                                  //   print(value);
                                  // });

                                },
                                child: Container(
                                  height: 50,
                                  width: size.width * .85,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
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

  Widget forinput({size, titel, TextEditingController textEditingController}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Text(titel),
            ),
            Container(
              width: size.width * .85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black, width: 1),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
              ),
              child: TextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:anjum/controllers/allBanksController.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.dart';

class ChequePay extends StatefulWidget {
  @override
  _ChequePayState createState() => _ChequePayState();
}

class _ChequePayState extends State<ChequePay> {
  String getDate, date2;
  var bata = Get.find<AllBanksController>();
  String Chequetime =   'Select Date' ;

  Future<String> pickdate() async {
    DateTime time = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
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

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < bata.allBanks.length; i++) {
      _listDropdownAllBanks.add(DropdownMenuItem<AllBanks>(
        value: bata.allBanks[i],
        child: Text(bata.allBanks[i].bankNameEn),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
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
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          forinput(size: size, titel: 'Cheque No'),
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<AllBanks>(
                                        value: dropdownValueAllBanks,
                                        onChanged: (AllBanks newValue) {
                                          dropdownValueAllBanks = newValue;
                                          _listDropdownAllBankBranches.clear();
                                          for (int i = 0;
                                              i < newValue.allBankBranches.length;
                                              i++) {
                                            _listDropdownAllBankBranches.add(
                                                DropdownMenuItem<AllBankBranches>(
                                              value: newValue.allBankBranches[i],
                                              child: Text(newValue
                                                  .allBankBranches[i].branchNameEn),
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
                                width: size.width  ,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<AllBankBranches>(
                                        value: dropdownValueAllBankBranches,
                                        onChanged: (AllBankBranches newValue) {
                                          dropdownValueAllBankBranches = newValue;

                                          setState(() {});
                                        },
                                        items: _listDropdownAllBankBranches)),
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
                                width: size.width * .85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<AllBankBranches>(
                                        value: dropdownValueAllBankBranches,
                                        onChanged: (AllBankBranches newValue) {
                                          dropdownValueAllBankBranches = newValue;

                                          setState(() {});
                                        },
                                        items: _listDropdownAllBankBranches)),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
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
                                child: Container(height: 50,
                                  width: size.width * .85,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(child: Text(Chequetime)),
                                ),
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
                                width: size.width * .85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<AllBankBranches>(
                                        value: dropdownValueAllBankBranches,
                                        onChanged: (AllBankBranches newValue) {
                                          dropdownValueAllBankBranches = newValue;

                                          setState(() {});
                                        },
                                        items: _listDropdownAllBankBranches)),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: size.width * .85,
                              height: size.height * .2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                border: Border.all(
                                  width: 1.0,
                                  color: const Color(0xFFEBEBEB),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    offset: Offset(0, 6.0),
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/cam.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                          )        ],
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
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextField(
                controller: textEditingController,
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

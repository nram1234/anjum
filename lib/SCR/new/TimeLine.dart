import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/myModel.dart';
import 'package:anjum/DB/tabelname/make_older.dart';
import 'package:anjum/controllers/allCustomersControllers.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';
import 'SalesOrderDetails.dart';

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

bool getdatafromdatabase = true;
List<DatainItem> theDatalist = [];
AllNetworking _allNetworking = AllNetworking();

class _TimeLineState extends State<TimeLine> {
  String getDate, date2;
  var listofallcustomer = Get.find<AllCustomersControllers>().allCustomers;
  String serchword = "";
  Filterr cat;

  List<Filterr> drobdowenitemiss = [
    Filterr(name: "Employee Visit ", val: "employee_visit_notes"),
    Filterr(name: "Employee before and after photos", val: "employee_visit_before_after_photos"),
    Filterr(name: "employee visit photos", val: "employee_visit_photos"),
    Filterr(name: "Invoice order", val: "invoice_order"),
    Filterr(name: "Sales order", val: "sales_order"),
    Filterr(name: "Return invoice order", val: "return_invoice_order"),
    Filterr(name: "Customer payments", val: "customer_payments"),
  ];

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
                'TimeLine',
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
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue[100]),
                          width: size.width * .9,
                          height: 50,
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.all(0.5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: TextField(
                              onChanged: (v) {
                                serchword = v;
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color(0xffd3d3d3),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.blue[100],
                                ),
                              ),
                              width: size.width * .8,
                              height: 50,
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(8),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Filterr>(
                                      value: cat,
                                      onChanged: (Filterr newValue) {
                                        cat = newValue;
                                        setState(() {});
                                      },
                                      items:   drobdowenitemiss
                                      .map<DropdownMenuItem<Filterr>>((e) {
                                        return DropdownMenuItem<Filterr>(value: e,
                                            child: Text(e.name));
                                      }).toList())),
                            ),
                            InkWell(
                              onTap: () {
                                pickdate().then((value) {
                                  if (value != null) {
                                    date2 = value.toString().substring(0, 10);
                                    //  print("9999999999999999999999999999999999999 $date2");
                                    _allNetworking
                                        .get_timelines(
                                            user_id:
                                                Get.find<UserAndPermissions>()
                                                    .user
                                                    .id,
                                            date2: date2)
                                        .then((value) {
                                      List<DatainItem> theData = [];
                                      for (int i = 0;
                                          i <
                                              value
                                                  .result.totalTimelines.length;
                                          i++) {
                                        for (int p = 0;
                                            p < listofallcustomer.length;
                                            p++) {
                                          //int.parse(listofallcustomer[p].customerInfo.id
                                          if (value.result.totalTimelines[i]
                                                  .customerId ==
                                              listofallcustomer[p].id) {
                                            theData.add(DatainItem(
                                                orderid: int.parse(value.result
                                                    .totalTimelines[i].id),
                                                time: value
                                                    .result
                                                    .totalTimelines[i]
                                                    .creationDate,
                                                customername:
                                                    listofallcustomer[p]
                                                        .customerNameEn,
                                                salesOrdertybe: value
                                                    .result
                                                    .totalTimelines[i]
                                                    .contentType,
                                                custormerpic:
                                                    listofallcustomer[p]
                                                        .image));
                                          }
                                        }
                                      }
                                      theDatalist = theData;
                                      getdatafromdatabase = false;

                                      setState(() {});
                                      // theDatalist=value.result.totalTimelines;
                                      // getdatafromdatabase=false;
                                    });
                                  }
                                });
                              },
                              child: Container(
                                width: size.width * .1,
                                height: size.width * .1,
                                child: Image.asset('assets/images/filter.png'),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Center(
                            child: getdatafromdatabase
                                ? CircularProgressIndicator()
                                : ListView.builder(
                                    itemCount: theDatalist.length,
                                    itemBuilder: (context, index) {
                                      if (theDatalist[index]
                                          .customername
                                          .toLowerCase()
                                          .contains(serchword.toLowerCase())) {
                                        if(cat!=null){
                                          if(cat.val.toLowerCase()==theDatalist[index].salesOrdertybe.toLowerCase()){
                                            return     GestureDetector(
                                              onTap: () {
                                                Get.to(() => SalesOrderDetails(),
                                                    arguments:
                                                    theDatalist[index].orderid);
                                              },
                                              child: TimeLineCardUI(
                                                  size: size,
                                                  customername: theDatalist[index]
                                                      .customername,
                                                  custormerpic: theDatalist[index]
                                                      .custormerpic,
                                                  salesOrdertybe: theDatalist[index]
                                                      .salesOrdertybe,
                                                  time: theDatalist[index].time),
                                            );
                                          }else{
                                            return const SizedBox();
                                          }

                                        }else{
                                          return     GestureDetector(
                                            onTap: () {
                                              Get.to(() => SalesOrderDetails(),
                                                  arguments:
                                                  theDatalist[index].orderid);
                                            },
                                            child: TimeLineCardUI(
                                                size: size,
                                                customername: theDatalist[index]
                                                    .customername,
                                                custormerpic: theDatalist[index]
                                                    .custormerpic,
                                                salesOrdertybe: theDatalist[index]
                                                    .salesOrdertybe,
                                                time: theDatalist[index].time),
                                          );
                                        }

                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ],
      ),
    ));
  }

  Widget TimeLineCardUI(
      {String time,
      fun,
      Size size,
      String salesOrdertybe,
      String custormerpic,
      String customername}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.topCenter,
            child: Text(time),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            height: size.height * .18,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.green
            ),
            child: Card(
              child: Row(
                children: [
                  // Expanded(
                  //   flex: 2,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(10),
                  //         bottomLeft: Radius.circular(10)),
                  //     child: CachedNetworkImage(imageUrl:custormerpic ,width: size.height * .08,
                  //       height: size.height * .08,
                  //       fit: BoxFit.fill,),
                  //   ),
                  // ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customername,
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            salesOrdertybe,
                            style: TextStyle(color: Colors.black),
                          ),
                          Spacer(),
                          Container(
                            height: 40,
                            width: size.width * .5,
                            decoration: BoxDecoration(
                                color: Color(0xff2C4B89),
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                "Details",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  //  cat=drobdowenitemiss[0];
    date2 = DateTime.now().toString().substring(0, 10);
//
    print(Get.find<UserAndPermissions>().user.id);
    _allNetworking
        .get_timelines(
            user_id: Get.find<UserAndPermissions>().user.id, date2: date2)
        .then((value) {
      List<DatainItem> theData = [];
      for (int i = 0; i < value.result.totalTimelines.length; i++) {
        for (int p = 0; p < listofallcustomer.length; p++) {
          //int.parse(listofallcustomer[p].customerInfo.id
          if (value.result.totalTimelines[i].customerId ==
              listofallcustomer[p].id) {
            theData.add(DatainItem(
                orderid: int.parse(value.result.totalTimelines[i].id),
                time: value.result.totalTimelines[i].creationDate,
                customername: listofallcustomer[p].customerNameEn,
                salesOrdertybe: value.result.totalTimelines[i].contentType,
                custormerpic: listofallcustomer[p].image));
          }
        }
      }
      theDatalist = theData;
      getdatafromdatabase = false;

      setState(() {});
      // theDatalist=value.result.totalTimelines;
      // getdatafromdatabase=false;
    });
  }

  Future<String> pickdate() async {
    DateTime time = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2050),
        context: context);
    print(time);

    date2 = time.toString().substring(0, 10);
    return date2;
  }
// @override
// void initState() {
//   super.initState();
//   getcustomeridinlist();
// }
}

class DatainItem {
  int orderid;
  String time;
  String salesOrdertybe;
  String custormerpic;

  String customername;

  DatainItem(
      {this.time,
      this.salesOrdertybe,
      this.custormerpic,
      this.customername,
      this.orderid});
}

class Filterr {
  String name;
  String val;

  Filterr({
    this.name,
    this.val,
  });
}

//
//
//
//

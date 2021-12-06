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


 var listofallcustomer = Get.find<AllCustomersControllers>().allCustomers;
bool getdatafromdatabase=true;
List<DatainItem> theDatalist= [];
AllNetworking _allNetworking=AllNetworking();

class _TimeLineState extends State<TimeLine> {

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
            child: GestureDetector(onTap: (){
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
                    child: Center(
                      child: getdatafromdatabase?CircularProgressIndicator(): ListView.builder(
                        itemCount: theDatalist.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {

                              Get.to(() => SalesOrderDetails(),
                                  arguments:
                                  theDatalist[index].orderid);
                            },
                            child: TimeLineCardUI(
                                size: size,
                                customername: theDatalist[index].customername,
                                custormerpic:theDatalist[index].custormerpic,
                                salesOrdertybe: theDatalist[index].salesOrdertybe,
                                time: theDatalist[index].time),
                          );
                        },
                      ),
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
    print(custormerpic);
    return Row(
      children: [
        // Expanded(
        //   flex: 2,
        //   child: Container(
        //     alignment: Alignment.topCenter,
        //     child: Text(time.substring(0, 10)),
        //   ),
        // ),
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
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: CachedNetworkImage(imageUrl:custormerpic ,width: size.height * .08,
                        height: size.height * .08,
                        fit: BoxFit.fill,),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                            width: size.width*.5,
                            decoration: BoxDecoration(
                                color: Color(0xff2C4B89), borderRadius: BorderRadius.circular(10)),
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
    DatabaseHelper().get_All_sales_order_requests().then((value)   {
      List<DatainItem> theData = [];
      for (int i = 0; i < value.length; i++) {
        for (int p = 0; p < listofallcustomer.length; p++) {
          print(value[i].customer_id
          );
          print(listofallcustomer[p].id
          );
          //int.parse(listofallcustomer[p].customerInfo.id
          if (value[i].customer_id.toString() == listofallcustomer[p].id){
print(listofallcustomer[p].image);
print("11111111111111111111111111111111111");
            theData.add(DatainItem(
                orderid: value[i].id,
                time: value[i].created_at,
                customername: listofallcustomer[p].customerNameEn,
                salesOrdertybe: value[i].request_type,
                custormerpic: listofallcustomer[p].image));
          }
        }
      }
      theDatalist=theData;
  getdatafromdatabase=false;

    setState(() {

    });});
   print(Get.find<UserAndPermissions>().user.id);
    _allNetworking.get_timelines(user_id: Get.find<UserAndPermissions>().user.id).then((value) {
      List<DatainItem> theData = [];
      for (int i = 0; i < value.result.totalTimelines.length; i++) {
        for (int p = 0; p < listofallcustomer.length; p++) {

          //int.parse(listofallcustomer[p].customerInfo.id
          if ( value.result.totalTimelines[i].customerId  == listofallcustomer[p].id ){

            theData.add(DatainItem(
                orderid: int.parse(value.result.totalTimelines[i].id) ,
                time: "",
                customername: listofallcustomer[p].customerNameEn,
                salesOrdertybe:value.result.totalTimelines[i].contentType,
                custormerpic: listofallcustomer[p].image));
          }
        }
      }
      theDatalist=theData;
      getdatafromdatabase=false;

      setState(() {

      });
     // theDatalist=value.result.totalTimelines;
      // getdatafromdatabase=false;
    });
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

//
//
//
//

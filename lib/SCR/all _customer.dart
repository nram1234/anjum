import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/tabelname/insert_visit_DB.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/timeController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/utilitie/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/root_controller.dart';
import 'package:location/location.dart';

import 'all_customer_tap1.dart';

class All_Customer extends StatefulWidget {
  @override
  _All_CustomerState createState() => _All_CustomerState();
}

class _All_CustomerState extends State<All_Customer> {
  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int _curr = 0;
  List<Widget> _list = <Widget>[All_customer_tap1()];
  final TimeController c = Get.put(TimeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TimeController());
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: size.height * .2,
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
                        'Start Journey',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
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
                    top: size.height * .06,
                    right: size.width * .02,
                    child: Container(
                      height: 75,
                      width: 75,
                      child: Image.asset(
                        'assets/images/add.png',
                        width: size.width,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              )),
          Row(
            children: [
              SizedBox(
                width: size.width * .1,
              ),
              Text('All Customers'),
              Expanded(child: Container()),
              Text('Route Name'),
              SizedBox(
                width: size.width * .1,
              ),
            ],
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            width: size.width * .9,
            height: 50,
            child: TextField(
              onChanged: (v) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            width: size.height * .1,
          ),
          Expanded(
            child: PageView(
              children: _list,
              scrollDirection: Axis.horizontal,

              // reverse: true,
              // physics: BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (num) {
                setState(() {
                  _curr = num;
                });
              },
            ),
          ),
    GetBuilder<TimeController>(builder: (_) {
    return c.swatch.isRunning?
    Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 5,
              blurRadius: 7,
              offset:
              Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: size.height * .1,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15))),
            height: size.height * .1,
            width: size.width * .6,
            child: Center(
                child: GetX<TimeController>(
                  init: TimeController(),
                  builder: (c) {
                    return Text(c.stoptimedisplay.value);
                  },
                )),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                if (!c.swatch.isRunning) {
                  getMyLoction(firesvisittlocation);

                  c.startjor();
                } else {
                  getMyLoction(endvisittlocation);
                  DatabaseHelper()
                      .insert_insert_visit(Insert_visit_DB(
                    customer_id:
                    Get.find<AllChequesController>()
                        .customer
                        .customerInfo
                        .id,
                    user_id:
                    _userAndPermissions.user.id.toString(),
                  ))
                      .then((value) {
                    Get.find<AllChequesController>().customer =
                    null;
                  });
                  c.stopjor();
                  Get.to(() => All_Customer());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff2C4B89),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15))),
                height: size.height * .1,
                child: Center(
                    child: Obx(() => Text(
                      c.startswatch.value
                          ? 'End Visit'
                          : 'start',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
              ),
            ),
          ),
        ],
      ),
    ):SizedBox();
             }
           )
        ],
      ),
    );
  }
}

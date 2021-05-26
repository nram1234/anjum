


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.dart';


class CashPay extends StatefulWidget {
  @override
  _CashPayState createState() => _CashPayState();
}

class _CashPayState extends State<CashPay> {
  String getDate, date2;
  Future<String> pickdate() async {
    DateTime time = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate:DateTime.now(),
        lastDate: DateTime(2050),
        context: context);
    print(time);

    date2 = time.toString().substring(0, 10);
    return date2;
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
                          onTap: (){  Navigator.pop(context);},
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
                          'Cash Payment',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )), ],
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
                  child: Column(
                    children: [
                      //button


                      Positioned(
                        top: size.height * .021,
                        left: size.width * .04,
                        child: Text("Date",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Container(
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
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              height: size.height * 1,
                              width: size.width * .8),
                          child: ElevatedButton(
                            child: Row(
                              children: [
                                Text('Select Date'),
                                SizedBox(width: size.width * .46),
                                Icon(Icons.calendar_today)
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 20,
                              primary: Colors.white,
                              onPrimary: Colors.blueGrey,
                              shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5))),
                            ),
                            onPressed: () async {
                              pickdate().then((String value) {
                                setState(() {
                                  getDate = value;
                                });
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * .13,
                        left: size.width * .04,
                        child: Text("Amount of Cash",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Positioned(
                        top: size.height * .19,
                        left: size.width * .04,
                        child:  Container(
                          width: size.width * .8,
                          height: size.height * .04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0,
                                color: const Color(0xffd4edff)),
                          ),
                          child: TextField(),
                        ),
                      ),
                      Positioned(
                        top: size.height * .25,
                        left: size.width * .04,
                        child: Text("Add Note",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),

                      ),
                      Positioned(
                        top: size.height * .31,
                        left: size.width * .04,
                        child: Container(
                          width: size.width * .8,
                          height: size.height * .04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0,
                                color: const Color(0xffd4edff)),
                          ),
                          child: TextField(),
                        ),
                      ),
                    ],
                  ),
                )),

          ],
        ),
      ),
    );
  }
}

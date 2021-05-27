
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BeforeAndAfter.dart';
import 'History.dart';
class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  List<String> titles = ["Sales order","Payment","Invoice","Return Invoice","Soa","History","Photo","Before/After"];
  List<MaterialColor> colors = [Colors.red,Colors.yellow,Colors.blue,Colors.orange,Colors.purple,Colors.green,Colors.red,Colors.orange];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color(0xff2C4B89),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    height: size.height * .18,
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
                              'Transaction',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Positioned(
                            left: size.width * .05,
                            top: size.height * .05,
                            child: GestureDetector(onTap: () {
                              Navigator.pop(context);
                            },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                            )),
                        // Positioned(top: size.height * .06, right: size.width * .02,
                        //   child: Container(height: 75, width: 75,
                        //       child: Icon(
                        //         Icons.home, color: Colors.white, size: 50,)
                        //   ),
                        // )
                      ],
                    )),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: Color(0xffeeeeee)
                  ),
                  padding: EdgeInsets.only(top: 10),
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red.withOpacity(0.3)),
                                width: size.width * .8,
                                height: 50,
                                margin: EdgeInsets.only(top: 15),
                                padding: EdgeInsets.all(0.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Last data sync is 14/04/21 12:9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.refresh,color: Colors.red,),
                                        Text("Refresh",style: TextStyle(color: Colors.red),)
                                      ],
                                    )
                                  ],
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: GridView.count(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 15,
                                  // physics: NeverScrollableScrollPhysics(),
                                  childAspectRatio: (150 / 150),
                                  // controller: new ScrollController(keepScrollOffset: false),
                                  children: List.generate(
                                      8,
                                          (index) {
                                        return InkWell(
                                          onTap: (){
                                            index==5?Get.to(History()): index==7?Get.to(BeforeAndAfter()):{};
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            color: Colors.white,
                                            child: Container(
                                              height: 150,
                                              width: 150,
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(15),
                                                    child:FadeInImage.assetNetwork(
                                                      placeholder: "assets/images/pic.png", image: '',
                                                      height: 90,
                                                      width: 90,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Text(titles[index],style: TextStyle(color: colors[index],fontWeight: FontWeight.bold,fontSize: 17),)
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            color: Colors.white,
            height: 55,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: size.height * .1,
                    color: Colors.indigo,
                    child: Center(
                        child: Text(
                          'End Visit',
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: size.height * .1,
                    child: Center(child: Text('123')),
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
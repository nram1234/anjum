import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SalesOrderDetails.dart';
class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff2C4B89),
      body: Column(
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
                          'TimeLine',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Positioned(
                        left: size.width * .05,
                        top: size.height * .05,
                        child: GestureDetector(onTap:(){
                          Navigator.pop(context);
                        } ,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                    Positioned(top: size.height*.06,right: size.width*.02,
                      child: Container(height: 75,width: 75,
                          child: Icon(Icons.home,color: Colors.white,size: 50,)
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                  color: Colors.white
              ),
              padding: EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15), color: Colors.blue[100]),
                        width: size.width * .9,
                        height: 50,
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(0.5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), color: Colors.white),
                          child: TextField(
                            onChanged: (v) {},
                            decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              prefixIcon: Icon(Icons.search,color: Color(0xffd3d3d3),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 13,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10), color: Colors.blue[100]),
                                // width: size.width * .7,
                                height: 50,
                                padding: EdgeInsets.all(0.5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10), color: Colors.white),
                                  child: TextField(
                                    onChanged: (v) {},
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: "All Categories",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      suffixIcon: Icon(Icons.keyboard_arrow_down,color: Color(0xffd3d3d3),),
                                      contentPadding: EdgeInsets.all(20)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 7,),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xff2C4B89),
                                ),
                                child: Icon(Icons.filter_list_outlined,color: Colors.white,),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return TimeLineCardUI();
                          },
                        ),
                      )
                    ],
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget TimeLineCardUI() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.topCenter,
            child: Text("16-11-2021"),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            height: 120,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.green
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/pic.png", image: 'https://fakeimg.pl/300/',
                      fit: BoxFit.fill,
                      height: double.infinity,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Seoedi",style: TextStyle(color: Colors.black,fontSize: 17),),
                        SizedBox(height: 5,),
                        Text("Seoedi",style: TextStyle(color: Colors.black),),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                              color: Color(0xff2C4B89),
                              onPressed: (){
                              Get.to(SalesOrderDetails());
                              },
                            child: Text("Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

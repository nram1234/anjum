import 'package:flutter/material.dart';

class Products_Expand extends StatefulWidget {
  @override
  _Products_ExpandState createState() => _Products_ExpandState();
}

class _Products_ExpandState extends State<Products_Expand> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * .2,
              width: size.width,
              color: Colors.blue,child: Image.asset('assets/images/bk.png',fit: BoxFit.fill,),
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

            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: size.height * .15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text('Safi  - corn oil 1 liter'),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text('Min Order : 2   box'),
                        ],
                      ),
                      Text('Price - 20.00 JD'),
                      Expanded(child: Container()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.orange,
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '5',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            color: Colors.orange,
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Details'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: size.width * .3,
                    color: Color(0xff2C4B89),
                  ),
                ],
              ),
            ),

Text('Category:food')







         ,   Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: size.height * .1,
                    color: Colors.blue,
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
          ],
        ),
      ),
    );
  }
}

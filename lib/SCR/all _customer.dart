import 'package:flutter/material.dart';

import 'all_customer_tap1.dart';

class All_Customer extends StatefulWidget {
  @override
  _All_CustomerState createState() => _All_CustomerState();
}

class _All_CustomerState extends State<All_Customer> {
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int _curr = 0;
  List<Widget> _list = <Widget>[All_customer_tap1()];

  @override
  Widget build(BuildContext context) {
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
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 50,
                      )),
                  Positioned(top: size.height*.06,right: size.width*.02,
                    child: Container(height: 75,width: 75,
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
          Container(
            height: size.height * .1,
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

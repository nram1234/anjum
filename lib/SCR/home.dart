import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  Positioned(
                      left: size.width * .1,
                      top: size.height * .05,
                      child: Image.asset(
                        'assets/images/pesonimg.png',
                        height: 75,
                        width: 75,
                      )),
                  Positioned(
                      left: (size.width * .1) + 80,
                      top: size.height * .06,
                      child: Text(
                        'Hello , Omar Ahmed',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Image.asset('assets/images/van.png')  , Text(
                                'Start of Journey',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        width: size.width * .9,
                        height: size.height * .08,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          item(
                              color: Colors.cyan[200],
                              size: size,
                              name: 'Catalog',
                              path: 'assets/images/catalog.png'),
                          GestureDetector(
                            onTap: () {},
                            child: item(
                                color: Colors.red[200],
                                size: size,
                                name: 'Timeline',
                                path: 'assets/images/g.png'),
                          ),
                          item(
                              color: Colors.orange[200],
                              size: size,
                              name: 'Orders Status',
                              path: 'assets/images/box.png'),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          item(
                              color: Colors.orange[200],
                              size: size,
                              name: 'printers',
                              path: 'assets/images/printer1.png'),
                          GestureDetector(
                            onTap: () {},
                            child: item(
                                color: Colors.cyan[200],
                                size: size,
                                name: 'Report',
                                path: 'assets/images/report.png'),
                          ),
                          item(
                              color: Colors.purpleAccent[200],
                              size: size,
                              name: 'Promotion List',
                              path: 'assets/images/promotion.png'),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink[200].withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset:
                                        Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              width: size.width * .64,
                              height: size.height * .2,
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/log.png',height: size.height*.05,width:size.height*.05,),
                                    Text('logout')
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: item(
                                  color: Colors.grey[500],
                                  size: size,
                                  name: 'Reprint',
                                  path: 'assets/images/reprint.png'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    ));
  }

  Widget item({String path, String name, size, Color color}) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: size.width * .3,
      height: size.height * .2,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              path,height: size.height*.1,width:size.height*.1,
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: color),
          )
        ],
      ),
    );
  }
}

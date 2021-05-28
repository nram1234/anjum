import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/allStockItemsController.dart';
import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:anjum/network/json/products_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart.dart';
import 'filter.dart';

class ProductsScr extends StatefulWidget {
  @override
  _ProductsScrState createState() => _ProductsScrState();
}

class _ProductsScrState extends State<ProductsScr> {
  List<Widget> alert_item = [];

  // var bata = Get.find< AllItemsController>();
  var cartitem = Get.find<CartItemController>();
  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());

  //int itemcount=0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    for (int i = 0; i < 10; i++) {
      alert_item.add(AlirtItem());
    }
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
                      top: size.height * .12,
                      child: Text(
                        'Transaction',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  Positioned(
                      right: size.width * .05,
                      top: size.height * .05,
                      child: Container(
                          child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(Cart());
                              },
                              child: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(cartitem.cartlist.length.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            ],
                          ),
                        ],
                      ))),
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
                      ))
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
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[100]),
                      width: size.width * .9,
                      height: 50,
                      child: Row(
                        children: [
                          GestureDetector(onTap: (){
                            Get.to(Filter());
                          },
                            child: Container(
                              width: size.width * .1,
                              height: size.width * .1,
                              child: Image.asset('assets/images/filter.png'),
                            ),
                          ),
                          Container(
                            width: size.width * .7,
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
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                          itemCount: 100, //bata.allItems.length,
                          itemBuilder: (context, pos) {
                            return item(
                                size: size,
                                funadd: () {
                                  // cartitem.addToCart(item: bata.allItems[pos]);
                                }
                                // ,products:bata.allItems[pos]
                                ,
                                funremov: () {
                                  //   cartitem.removefromcart(item: bata.allItems[pos]);
                                }); // AlirtItem( );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          print('oooooooooo');
                        },
                        child: Container(
                          height: 50,
                          width: size.width * .9,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text('Add To Cart'),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: size.height * .1,
                            color: Colors.indigo,
                            child: Center(
                                child: Text(
                              'End Visit',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
              )),
        ],
      ),
    ));
  }

  Widget item({size, ItemDetails products, funadd, funremov}) {
    var count = cartitem.cartlist.where((c) => c == products).toList().length;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          // height: size.height * .15,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(products.itemNameEn),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(products.minimumQuantity),
                        ],
                      ),
                      Text(products.itemCost),
                      //  Expanded(child: Container()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: funadd,
                            child: Container(
                              color: Colors.orange,
                              height: 30,
                              width: 30,
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            count.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: funremov,
                            child: Container(
                              color: Colors.orange,
                              height: 30,
                              width: 30,
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: size.width * .3,
                    color: Colors.indigo,
                    child: Image.network(
                      products.image,
                      width: size.width,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Details'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 10,
                        ),
                        Text('Category: food')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(products.itemNumber),
                        Text('item name:  ${products.itemNameEn}')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Item Price :${products.itemCost}'),
                        Text('Tax:  ${products.tax}')
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Text(
                          'Promotion',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        GestureDetector(
                          onTap: () {
                            Widget okButton = TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            );
                            AlertDialog alert = AlertDialog(
                              title: Text(
                                "Promotion list",
                                style: TextStyle(color: Colors.red),
                              ),
                              content: Container(
                                height: size.height * .8,
                                width: size.width * .8,
                                child: ListView(
                                  children: alert_item,
                                ),
                              ),
                              actions: [
                                okButton,
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/iso'),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Show All Promotion',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [Text('Store ID'), Text('443')],
                        ),
                        Column(
                          children: [Text('Unit'), Text('box')],
                        ),
                        Column(
                          children: [Text('Quantity'), Text('4')],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Price per Item'),
                            Container(
                              width: size.width * .4,
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
                          ],
                        ),
                        Column(
                          children: [
                            Text('stock'),
                            Container(
                              width: size.width * .4,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Tax %'),
                            Container(
                              width: size.width * .4,
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
                          ],
                        ),
                        Column(
                          children: [
                            Text('Price'),
                            Container(
                              width: size.width * .4,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Total Price'),
                            Container(
                              width: size.width * .4,
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
                          ],
                        ),
                        Column(
                          children: [
                            Text('Total Tax'),
                            Container(
                              width: size.width * .4,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Discount %'),
                            Container(
                              width: size.width * .4,
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
                          ],
                        ),
                        Column(
                          children: [
                            Text('Bounce'),
                            Container(
                              width: size.width * .4,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff2C4B89),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          width: size.width * .4,
                          child: Center(
                            child: Text(
                              'ok',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * .4,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(child: Text('Cancel')),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget AlirtItem({ItemDetails products, funadd, funremov}) {
    var count = cartitem.cartlist.where((c) => c == products).toList().length;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100].withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('369'),
                  Text(count.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: funadd, child: Text('bol 100+30')),
                  GestureDetector(
                      onTap: funremov, child: Text('Promotion Name')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('bol 100+30'),
                  Text('Promotion Details'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('18-4-2021'),
                  Text('16-4-2021'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//
//
//
//
//
//
//
//
//
//
//
//

//
//
//
// Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// SizedBox(
// height: 8,
// ),
// Text('Safi  - corn oil 1 liter'),
// SizedBox(
// height: 4,
// ),
// Row(
// children: [
// Text('Min Order : 2   box'),
// ],
// ),
// Text('Price - 20.00 JD'),
// Expanded(child: Container()),
// Row(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// color: Colors.orange,
// height: 30,
// width: 30,
// child: Center(
// child: Text(
// "+",
// style: TextStyle(
// fontWeight: FontWeight.bold, fontSize: 20),
// ),
// ),
// ),
// SizedBox(
// width: 20,
// ),
// Text(
// '5',
// style: TextStyle(
// fontWeight: FontWeight.bold, fontSize: 20),
// ),
// SizedBox(
// width: 20,
// ),
// Container(
// color: Colors.orange,
// height: 30,
// width: 30,
// child: Center(
// child: Text(
// "-",
// style: TextStyle(
// fontWeight: FontWeight.bold, fontSize: 20),
// ),
// ),
// ),
// SizedBox(
// width: 20,
// ),
// Text('Details'),
// ],
// )
// ],
// ),
// SizedBox(
// width: 8,
// ),
// Container(
// width: size.width * .3,
// color: Colors.indigo,
// ),
// ],
// ),


import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'carteditproduct.dart';

class Cart extends StatefulWidget {
  @override
  _CartEditProductState createState() => _CartEditProductState();
}

class _CartEditProductState extends State<Cart> {
  String Chequetime = "";

  CartItemController bata = Get.find<CartItemController>();

List<AllItems>listtoshow=[];
  @override
  void initState() {
    super.initState();
    for(int i=0;i<bata.cartlist.length;i++){
if(!listtoshow.contains(bata.cartlist[i])){
  listtoshow.add(bata.cartlist[i]);
}
    }


  }

  @override
  Widget build(BuildContext context) {
    print("${listtoshow.length }      pppppp");
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    String date2 = "";

    Future<String> pickdate() async {
      DateTime time = await showDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2050),
          context: context);
      print(time);

      date2 = time.toString().substring(0, 10);
      return date2;
    }

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
                        left: size.width * .1,
                        top: size.height * .1,
                        child: Text(
                          'Cart',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Positioned(
                      right: size.width * .05,
                      top: size.height * .1,
                      child: Container(
                          child: InkWell(

                              child: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                                size: 30,
                              ))),
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          height: size.height * .4,
                          child: ListView.builder(
                              itemCount: listtoshow.length,
                              itemBuilder: (context, pos) {

                                return Obx((){
                                  return item(size: size,data: listtoshow [pos]);
                                });
                              }),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Center(
                          child: Container(
                            height: size.height * .06,
                            color: Colors.white,
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  height: size.height * .06,
                                  width: size.width * .8),
                              child: ElevatedButton(
                                child: Text('Apply  Promotions'),
                                style: ElevatedButton.styleFrom(
                                  elevation: 20,
                                  primary: Colors.orangeAccent,
                                  onPrimary: Colors.white,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                onPressed: () {
                                  return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Container(
                                          width: sWidth * .8,
                                          height: 60,
                                          child: Center(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('You Get Promotion'),
                                              Text('Bol 50+10'),
                                            ],
                                          )),
                                          color: Colors.orangeAccent,
                                        ),
                                        content: Container(
                                          width: sWidth * .8,
                                          height: sHeight * .5,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('Description'),
                                                    Text('Qty      '),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Expanded(child: Text('Safi  - corn oil 1 liter')),
                                                      Container(
                                                        width: size.width * .2,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5),
                                                              spreadRadius: 5,
                                                              blurRadius: 7,
                                                              offset: Offset(0,
                                                                  3), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            disabledBorder:
                                                                InputBorder
                                                                    .none,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            ,    Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Expanded(child: Text('Safi  - corn oil 1 liter')),
                                                      Container(
                                                        width: size.width * .2,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(10),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                  0.5),
                                                              spreadRadius: 5,
                                                              blurRadius: 7,
                                                              offset: Offset(0,
                                                                  3), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child: TextField(
                                                          decoration:
                                                          InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder:
                                                            InputBorder
                                                                .none,
                                                            enabledBorder:
                                                            InputBorder
                                                                .none,
                                                            errorBorder:
                                                            InputBorder
                                                                .none,
                                                            disabledBorder:
                                                            InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            ),
                                                Expanded(child: Container()),


                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('Total Qty: 5'),
                                                    Text('Due Promotion Qty: 10'),
                                                  ],
                                                ),   SizedBox(height: 8,),
                                                Center(
                                                  child: Container(
                                                    width: size.width * .3,
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
                                                    child: Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.indigo,
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                            'Ok',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 20),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Text('Discount'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: size.width * .6,
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
                                    hintText: '  5%  ',
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * .3,
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
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2C4B89),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Apply',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Text('Payment Method'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(4),
                                width: size.width * .4,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.0,
                                    color: const Color(0xFFEBEBEB),
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Cash',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Image.asset(
                                        'assets/images/dollar.png',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(4),
                                width: size.width * .4,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.0,
                                    color: const Color(0xFFEBEBEB),
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Cheque',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Image.asset(
                                        'assets/images/ch.png',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                pickdate().then((value) {
                                  if (value != null) {
                                    Chequetime = value;
                                    print(Chequetime);
                                    setState(() {});
                                  }
                                });
                              },
                              child: Container(
                                width: size.width * .9,
                                height: 50,
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
                                child: Center(child: Text(Chequetime)),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: Text('Add note'),
                                ),
                                Container(
                                  width: size.width * .9,
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
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  height: 50,
                                  width: size.width * .9,
                                  decoration: BoxDecoration(
                                    color: Color(0xff2C4B89),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Complete',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget item({size,AllItems data}) {
    int numberofitem=0;
    for(int i=0;i<bata.cartlist.length;i++){
      if(bata.cartlist[i]==data){
        numberofitem++;
      }
    }
    return Container(
        height: size.height * .145,
        width: size.width,
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: size.height * .145,
              color: Colors.white,
            ),
            //photo item
            Positioned(
              left: size.width * .05,
              bottom: size.height * .05,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.itemDetails[0].image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            //edit & delete
            Positioned(
              right: size.width * .03,
              top: size.height * .009,
              child: Container(
                  child: InkWell(
                      onTap: () {
                       listtoshow.remove(data);
                        bata.removeAllChooseItexfromcart(item: data);
                        setState(() {

                        });
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.grey,
                        size: 30,
                      ))),
            ),
            Positioned(
              right: size.width * .09,
              top: size.height * .009,
              child: Container(
                  child: InkWell(
                      onTap: () {

                        Get.to(CartEditProduct(data), );
                        //
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => CartEditProduct()),
                        // );
                        //
                        //

                      },
                      child: Icon(
                        Icons.edit,
                        color: Colors.grey,
                        size: 30,
                      ))),
            ),
            //item name
            Positioned(
              left: size.width * .35,
              top: size.height * .009,
              child: Text(
                data.itemDetails[0].itemNameEn,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: const Color(0xff1e2432),
                  letterSpacing: -0.32,
                  height: 1.2,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.left,
              ),
            ),

            //price
            Positioned(
              left: size.width * .35,
              top: size.height * .04,
              child: Text(
               data.itemDetails[0].sellingPrice,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: const Color(0xff191919),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            //counter
            Positioned(
              left: size.width * .3,
              bottom: size.height * .04,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      size: 40,
                    ),
                    onPressed: () {
                      bata.removefromcart(item: data);

                    },
                    color: Colors.orangeAccent,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(numberofitem.toString()),
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle, size: 40),
                    color: Colors.orangeAccent,
                    onPressed: () {
                      bata.addToCart(item: data);
                      print('pppp');

                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

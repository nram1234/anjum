import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bill extends StatefulWidget {
  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  CartItemController bata = Get.find<CartItemController>();
List<AllItems>cartlisttoshow=[];
double totalprice=0;

  @override
  void initState() {
    super.initState();
    for(int i=0;i<bata.cartlist.length;i++){
      totalprice+=double.parse(bata.cartlist[i].itemDetails[0].sellingPrice);
      if(cartlisttoshow.contains(bata.cartlist[i])){

        cartlisttoshow.add(bata.cartlist[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cartlisttoshow.length,
                itemBuilder: (context, pos) {
                  return item(data: cartlisttoshow[pos]);
                }),
          ),
          Container(padding: EdgeInsets.all(4),
            height: size.height * .4,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Cart totals'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('QTY-  53'), Text('Bounce -  10')],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Total - 63'),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: size.width * .9,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Total -'), Text('1080.00 JD')],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                  width: size.width * .9,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discount -'),
                      Text(
                        '- 60.00JD',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax -'),
                      Text(
                        '100.00JD',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                  width: size.width * .9,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Amount-'),
                      Text(
                        '100.00JD',
                        style: TextStyle(color: Colors.red),
                      )
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
                            'Print',
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
                        child: Center(child: Text('Back')),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget item({
    AllItems data
  }) {
    int qty=0;
   double tprice=0;
    for(int i=0;i<bata.cartlist.length;i++){
      if(data.itemId==bata.cartlist[i].itemId){


      }
    }
    tprice=qty*double.parse(data.itemDetails[0].sellingPrice);
    return Card(elevation: 8,
      child: Directionality(textDirection: TextDirection.ltr,
        child: ExpansionTile(expandedAlignment: Alignment.bottomRight,
          title: Text(data.itemDetails[0].itemNameEn),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Unit :EA'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Price :${data.itemDetails[0].sellingPrice}'),
                    ),
                  ],
                )
                , Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Qty: ${qty.toString()}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Discount: 0'),
                    ),
                  ],
                ),


                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Bounce :5.0'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Tax :16'),
                    ),
                  ],
                )
              ],
            )
            , Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total : ${tprice.toString()}', style: TextStyle(color: Colors.teal),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

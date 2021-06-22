import 'package:anjum/controllers/allStockItemsController.dart';
import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/controllers/dropdownMenuItemList.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';



class CartEditProduct extends StatefulWidget {

  AllItems data= Get.arguments;
  @override
  _CartEditProductState createState() => _CartEditProductState();
}

class _CartEditProductState extends State<CartEditProduct> {
  int itemCountinCart=0;
  var stocitem = Get.find<AllStockItemsController>().allStockItems;
  CartItemController bata = Get.find<CartItemController>();
TextEditingController textEditingController =TextEditingController();
  List<AllStockItems> droblist=[];
//  AllStockItems val
  @override
  void initState() {
    super.initState();
    for(int i=0;i<bata.cartlist.length;i++){
      if(bata.cartlist[i].id==widget.data.id)
      {
        itemCountinCart++;
      }
    }
    textEditingController.text=itemCountinCart.toString();

    // for(int z=0;z<stocitem.length;z++){
    //
    //   dropdownMenuItemList.allStockItems[i].add(stocitem[z]);
    //
    // }
  }

  @override
  Widget build(BuildContext context) {

    print(widget.data);

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
                        top: size.height * .12,
                        child: Text(
                          'Edit Product',
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
                  // child:  Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Container(
                  //           height: size.height * .15,
                  //           width: size.height * .15,
                  //           color: Colors.indigo,
                  //           child: Image.network(
                  //            widget.data.itemDetails[0].image,
                  //             height: size.height * .1,
                  //             width: size.height * .1,
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 8,
                  //         ),
                  //         Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             SizedBox(
                  //               height: 8,
                  //             ),
                  //             Text(widget.data.itemDetails[0].itemNameEn),
                  //             SizedBox(
                  //               height: 4,
                  //             ),
                  //             Text(widget.data.itemDetails[0].minimumQuantity),
                  //             //products.itemDetails[0].itemCost
                  //             Text(widget.data.itemDetails[0].sellingPrice),
                  //             //  Expanded(child: Container()),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //     ExpansionTile(
                  //       title: Row(
                  //         children: [
                  //           Text('Details'),
                  //           SizedBox(
                  //             width: size.width * .08,
                  //           ),
                  //           Row(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               InkWell(
                  //                 onTap: () {
                  //                   int i = int.parse(textEditingController
                  //                       .text) +
                  //                       1;
                  //                   textEditingController
                  //                       .text = i.toString();
                  //                 setState(() {
                  //
                  //                 });},
                  //                 child: Container(
                  //                   decoration: BoxDecoration(
                  //                       color: Colors.orange,
                  //                       borderRadius: BorderRadius.circular(2)),
                  //                   height: 30,
                  //                   width: 30,
                  //                   child: Center(
                  //                     child: Text(
                  //                       "+",
                  //                       style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           fontSize: 20,
                  //                           color: Colors.white),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 width: 20,
                  //               ),
                  //               Container(
                  //                 width: size.width * .2,
                  //                 child: Center(
                  //                   child: TextField(
                  //                     controller: textEditingController,
                  //                     textAlign: TextAlign.center,
                  //                   ),
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 width: 20,
                  //               ),
                  //               InkWell(
                  //                 onTap: () {
                  //                   if (int.parse(textEditingController
                  //                       .text) >
                  //                       0) {
                  //                     int i = int.parse(textEditingController
                  //                         .text) -
                  //                         1;
                  //                     textEditingController
                  //                         .text = i.toString();
                  //                   }
                  //               setState(() {
                  //
                  //               });  },
                  //                 child: Container(
                  //                   decoration: BoxDecoration(
                  //                       color: Colors.orange,
                  //                       borderRadius: BorderRadius.circular(2)),
                  //                   height: 30,
                  //                   width: 30,
                  //                   child: Center(
                  //                     child: Text(
                  //                       "-",
                  //                       style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           fontSize: 20,
                  //                           color: Colors.white),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 width: 20,
                  //               ),
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //       children: [
                  //         Column(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 //categories.categoryNameEn
                  //                 child: Text("category Name")),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Text(
                  //                       'item Number: ${widget.data.itemDetails[0].itemNumber}'),
                  //                   Container(
                  //                       child: Text(
                  //                           'item name:  ${widget.data.itemDetails[0].itemNameEn}'))
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Text(
                  //                       'Item Price :${widget.data.itemDetails[0].itemCost}'),
                  //                   Text('Tax:  ${widget.data.itemDetails[0].tax}')
                  //                 ],
                  //               ),
                  //             ),
                  //             Container(
                  //               height: 1,
                  //               color: Colors.grey,
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Text(
                  //                 'Promotion',
                  //                 style: TextStyle(fontWeight: FontWeight.bold),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   Widget okButton = TextButton(
                  //                     child: Text("OK"),
                  //                     onPressed: () {
                  //                       Navigator.of(context).pop();
                  //                     },
                  //                   );
                  //                   // AlertDialog alert = AlertDialog(
                  //                   //   title: Center(
                  //                   //     child: Text(
                  //                   //       "Promotion list",
                  //                   //       style: TextStyle(color: Colors.red),
                  //                   //     ),
                  //                   //   ),
                  //                   //   content: Container(
                  //                   //     height: size.height * .8,
                  //                   //     width: size.width * .8,
                  //                   //     child: ListView(
                  //                   //       children: alert_item,
                  //                   //     ),
                  //                   //   ),
                  //                   //   actions: [
                  //                   //     okButton,
                  //                   //   ],
                  //                   // );
                  //                   // showDialog(
                  //                   //   context: context,
                  //                   //   builder: (BuildContext context) {
                  //                   //     return alert;
                  //                   //   },
                  //                   // );
                  //                 },
                  //                 child: Row(
                  //                   children: [
                  //                     Image.asset(
                  //                       'assets/images/iso.png',
                  //                       width: 30,
                  //                       height: 30,
                  //                     ),
                  //                     Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Text(
                  //                         'Show All Promotion',
                  //                         style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Column(
                  //                     children: [
                  //                       Text('Store ID'),
                  //                       Obx(() => Container(width: size.width*.25,
                  //                         decoration: BoxDecoration(  border: Border.all(
                  //                           color: Colors.grey,
                  //                           width: 1,
                  //                         ),borderRadius: BorderRadius.circular(10)),
                  //                         child: Center(
                  //                           child: DropdownButton<AllStockItems>(
                  //                             value: dropdownMenuItemList
                  //                                 .listdropdownValue[pos],
                  //                             icon: const Icon(Icons.arrow_downward),
                  //                             iconSize: 15,
                  //                             elevation: 16,
                  //                             style: const TextStyle(
                  //                                 color: Colors.deepPurple),
                  //                             // underline: Container(
                  //                             //   height: 2,
                  //                             //   color: Colors.deepPurpleAccent,
                  //                             // ),
                  //                             onChanged: (AllStockItems newValue) {
                  //                               dropdownMenuItemList.setValOfdropdownValue(
                  //                                   pos: pos, dropdownValue: newValue);
                  //
                  //                             },
                  //                             items: dropdownMenuItemList
                  //                                 .allStockItems[pos]
                  //                                 .map<DropdownMenuItem<AllStockItems>>(
                  //                                     (AllStockItems value) {
                  //                                   return DropdownMenuItem<AllStockItems>(
                  //                                     value: value,
                  //                                     child: Text(value.id),
                  //                                   );
                  //                                 }).toList(),
                  //                           ),
                  //                         ),
                  //                       ))
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Text('Unit'),
                  //                       Obx(()=>
                  //                           Container(width: size.width*.25,height: 50,
                  //                             decoration: BoxDecoration(  border: Border.all(
                  //                               color: Colors.grey,
                  //                               width: 1,
                  //                             ),borderRadius: BorderRadius.circular(10)),
                  //                             child: Center(
                  //                               child: Text(   dropdownMenuItemList
                  //                                   .listdropdownValue[pos].measurementUnitName
                  //                               ),
                  //                             ),
                  //                           )
                  //                       )
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Text('Quantity'),
                  //                       Obx(()=>
                  //                           Container(width: size.width*.25,height: 50,
                  //                             decoration: BoxDecoration(  border: Border.all(
                  //                               color: Colors.grey,
                  //                               width: 1,
                  //                             ),borderRadius: BorderRadius.circular(10)),
                  //                             child: Center(
                  //                               child: Text(
                  //                                   dropdownMenuItemList
                  //                                       .listdropdownValue[pos].quantity
                  //                               ),
                  //                             ),
                  //                           )
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Column(
                  //                     children: [
                  //                       Text('Bounce'),
                  //                       Container(
                  //
                  //                         width: size.width*.4,height: 50,
                  //                         decoration: BoxDecoration(color: Colors.grey[200],  border: Border.all(
                  //                           color: Colors.grey,
                  //                           width: 1,
                  //                         ),borderRadius: BorderRadius.circular(10)),
                  //                         child: TextField(
                  //                           textAlign: TextAlign.center,
                  //                           decoration: InputDecoration(
                  //                             border: InputBorder.none,
                  //                             focusedBorder: InputBorder.none,
                  //                             enabledBorder: InputBorder.none,
                  //                             errorBorder: InputBorder.none,
                  //                             disabledBorder: InputBorder.none,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Text('Discount %'),
                  //                       Container(
                  //                         width: size.width*.4,height: 50,
                  //                         decoration: BoxDecoration( color: Colors.grey[200], border: Border.all(
                  //                           color: Colors.grey,
                  //                           width: 1,
                  //                         ),borderRadius: BorderRadius.circular(10)),
                  //                         child: TextField(
                  //                           textAlign: TextAlign.center,
                  //                           decoration: InputDecoration(
                  //                             border: InputBorder.none,
                  //                             focusedBorder: InputBorder.none,
                  //                             enabledBorder: InputBorder.none,
                  //                             errorBorder: InputBorder.none,
                  //                             disabledBorder: InputBorder.none,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Column(
                  //                     children: [
                  //                       Text('stock'),
                  //                       Container(
                  //
                  //                           width: size.width*.4,height: 50,
                  //                           decoration: BoxDecoration(  border: Border.all(
                  //                             color: Colors.grey,
                  //                             width: 1,
                  //                           ),borderRadius: BorderRadius.circular(10)),
                  //                           child: Center(
                  //                               child: Text(widget.data
                  //                                   .itemDetails[0].minimumQuantity))),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Text('Price per Item'),
                  //                       Container(
                  //
                  //                         width: size.width*.4,height: 50,
                  //                         decoration: BoxDecoration(  border: Border.all(
                  //                           color: Colors.grey,
                  //                           width: 1,
                  //                         ),borderRadius: BorderRadius.circular(10)),
                  //                         child: Center(
                  //                             child: Text(
                  //                                 widget.data.itemDetails[0].itemCost ??
                  //                                     "")),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Column(
                  //                     children: [
                  //                       Text('Price'),
                  //                       Container(
                  //
                  //                         width: size.width*.4,height: 50,
                  //                         decoration: BoxDecoration(  border: Border.all(
                  //                           color: Colors.grey,
                  //                           width: 1,
                  //                         ),borderRadius: BorderRadius.circular(10)),
                  //                         child: Center(
                  //                             child: Text(widget.data
                  //                                 .itemDetails[0].sellingPrice)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Text('Tax %'),
                  //                       Container(
                  //
                  //                         width: size.width*.4,height: 50,
                  //                         decoration: BoxDecoration(  border: Border.all(
                  //                           color: Colors.grey,
                  //                           width: 1,
                  //                         ),borderRadius: BorderRadius.circular(10)),
                  //                         child: Center(
                  //                             child: Text(widget.data.itemDetails[0].tax)),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Column(
                  //                     children: [
                  //                       Text('Total Tax'),
                  //                       Container(
                  //
                  //                           width: size.width*.4,height: 50,
                  //                           decoration: BoxDecoration(  border: Border.all(
                  //                             color: Colors.grey,
                  //                             width: 1,
                  //                           ),borderRadius: BorderRadius.circular(10)),
                  //                           child: Center(
                  //                               child: Text((double.tryParse(widget.data
                  //                                   .itemDetails[0]
                  //                                   .sellingPrice) *
                  //                                   double.tryParse(widget.data
                  //                                       .itemDetails[0].tax))
                  //                                   .toString()))),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Text('Total Price'),
                  //                       Container(
                  //
                  //                         width: size.width*.4,height: 50,
                  //                         decoration: BoxDecoration(  border: Border.all(
                  //                           color: Colors.grey,
                  //                           width: 1,
                  //                         ),borderRadius: BorderRadius.circular(10)),
                  //                         child: Center(child: Text('هنشوف الحساب')),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Container(
                  //
                  //                     width: size.width*.4,height: 50,
                  //                     decoration: BoxDecoration(  border: Border.all(
                  //                       color:  Color(0xff2C4B89),
                  //                       width: 1,
                  //                     ),borderRadius: BorderRadius.circular(10)),
                  //                     child: Center(child: Text('Cancel')),
                  //                   ),
                  //                   Container(
                  //                     decoration: BoxDecoration(
                  //                       color: Color(0xff2C4B89),
                  //                       borderRadius: BorderRadius.circular(10),
                  //                     ),
                  //                     height: 50,
                  //                     width: size.width * .4,
                  //                     child: Center(
                  //                       child: Text(
                  //                         'ok',
                  //                         style: TextStyle(color: Colors.white),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             )
                  //           ],
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // ),
                )),
          ],
        ),
      ));

  }
}

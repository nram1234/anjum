import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/myModel.dart';
import 'package:anjum/DB/tabelname/item_tabel.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/controllers/employeePermissionsController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:anjum/utilitie/invoiceOrSalesOrderOrReturnInvoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'all _customer.dart';
import 'carteditproduct.dart';
import 'cashpayment.dart';
import 'chequepay.dart';
import 'dashboard.dart';

class Cart extends StatefulWidget {
  @override
  _CartEditProductState createState() => _CartEditProductState();
}

class _CartEditProductState extends State<Cart> {
  String Chequetime = "choose date";
TextEditingController _textEditingController=TextEditingController();
  CartItemController bata = Get.find<CartItemController>();
  DatabaseHelper _databaseHelper = DatabaseHelper();

  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());
  EmployeePermissionsController employeePermissionsController= Get.find<EmployeePermissionsController>();
  AllChequesController customer =Get.find<AllChequesController>();

  String dropdownvalue ;
  var items =  ['Cash','Cheque' ];


  List<AllItems> listtoshow = [];
Map<String,AllItems>getTaxItemMap={};
bool canApply=true;
bool requestToChangeInvoicePaymentType;
  @override
  void initState() {

    super.initState();
    requestToChangeInvoicePaymentType= employeePermissionsController.employeePermissions[0].requestToChangeInvoicePaymentType=="yes";
    _textEditingController.text=0.toString();

    for (int i = 0; i < bata.cartlist.length; i++) {

      if (!listtoshow.contains(bata.cartlist[i])) {
        listtoshow.add(bata.cartlist[i]);
        getTaxItemMap[bata.cartlist[i].itemId]=bata.cartlist[i] ;   }
    }
  }

  @override
  Widget build(BuildContext context) {
print( customer.customer.customerInfo.paymentType);
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


      date2 = time.toString().substring(0, 10);
      return date2;
    }
 double   total_sal=0;
    double   totalTax=0;
    bata.total_Tax.forEach((key, value) {
      totalTax+=value;
    });
     bata.PriceafterDes.forEach((key, value) {
       total_sal+=value;
     });

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
                          //     height: size.height * .4,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: listtoshow.length,
                              itemBuilder: (context, pos) {
                                return Obx(() {
                                  return item(
                                      size: size, data: listtoshow[pos]);
                                });
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
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
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Description'),
                                                      Text('Qty      '),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                                'Safi  - corn oil 1 liter')),
                                                        Container(
                                                          width:
                                                              size.width * .2,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5),
                                                                spreadRadius: 5,
                                                                blurRadius: 7,
                                                                offset: Offset(
                                                                    0,
                                                                    3), // changes position of shadow
                                                              ),
                                                            ],
                                                          ),
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Expanded(
                                                            child: Text(
                                                                'Safi  - corn oil 1 liter')),
                                                        Container(
                                                          width:
                                                              size.width * .2,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5),
                                                                spreadRadius: 5,
                                                                blurRadius: 7,
                                                                offset: Offset(
                                                                    0,
                                                                    3), // changes position of shadow
                                                              ),
                                                            ],
                                                          ),
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
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
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('Total Qty: 5'),
                                                      Text(
                                                          'Due Promotion Qty: 10'),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Center(
                                                    child: Container(
                                                      width: size.width * .3,
                                                      decoration: BoxDecoration(
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
                                                      child: Container(
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.indigo,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          'Ok',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 16, right: 16),
                        //   child: Text('Discount'),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Text('Discount',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
                                child: TextField(controller: _textEditingController,keyboardType: TextInputType.number,textAlign: TextAlign.center,
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
                              GestureDetector(onTap:canApply? (){
                                canApply=false;
getTaxItemMap.forEach((key, value) {
  print('PriceafterDes befor any thing${ bata .PriceafterDes[key]}');

                                  bata .PriceafterDes[key]=  bata .PriceafterDes[key]-(bata .PriceafterDes[key]*double.parse(_textEditingController.text)/100);
                                 bata .total_Tax[key]=       bata .PriceafterDes[key] * (double.parse(getTaxItemMap[key].itemDetails[0].tax) / 100);;
  print('PriceafterDes after   thing${ bata .PriceafterDes[key]}');
                             });

                            setState(() {

                            });  }:null,
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
                                      color: canApply?Color(0xff2C4B89):Colors.grey,
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
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8,right: 16,left: 16,bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total'),
                              Text(total_sal.toStringAsFixed(3)),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 8,right: 16,left: 16,bottom: 8),
                            child: Divider(
                              height: 1,
                              color: Colors.teal,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 8,right: 16,left: 16,bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount'),
                             Text((total_sal*double.parse(_textEditingController.text??"0")/100).toStringAsFixed(3)),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 8,right: 16,left: 16,bottom: 8),
                            child: Divider(
                              height: 1,
                              color: Colors.teal,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 8,right: 16,left: 16,bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Tax'),
                              Text(totalTax.toStringAsFixed(3)),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 8,right: 16,left: 16,bottom: 8),
                            child: Divider(
                              height: 1,
                              color: Colors.teal,
                            )),
                        Padding(
                          padding:EdgeInsets.only(top: 8,right: 16,left: 16,bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Grand Total'),
                              Text( (totalTax+total_sal).toStringAsFixed(3) ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              child: Text('Payment Method'),
                            ),  requestToChangeInvoicePaymentType?
                            Container(
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
                                child: DropdownButton(underline:   SizedBox(),

                                  value: dropdownvalue, hint: Text('Cash OR Cheque'),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items:items.map((String items) {
                                    return DropdownMenuItem(
                                        value: items,
                                        child: Text(items)
                                    );
                                  }
                                  ).toList(),
                                  onChanged: (String newValue){
                                    setState(() {
                                      dropdownvalue = newValue;
                                    });
                                  },
                                ),
                              ),
                            ):
                            Container(
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
                                child: Text(  customer.customer.customerInfo.paymentType)
                              ),
                            ),
                          ],
                        ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     InkWell(
                        //       onTap: () {
                        //         Get.to(CashPay());
                        //       },
                        //       child: Container(
                        //         padding: EdgeInsets.all(4),
                        //         width: size.width * .4,
                        //         height: 60,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(11.0),
                        //           color: Colors.white,
                        //           border: Border.all(
                        //             width: 1.0,
                        //             color: const Color(0xFFEBEBEB),
                        //           ),
                        //         ),
                        //         child: Center(
                        //           child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceAround,
                        //             children: [
                        //               Text(
                        //                 'Cash' ,
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 20),
                        //               ),
                        //               Image.asset(
                        //                 'assets/images/dollar.png',
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         Get.to(ChequePay());
                        //       },
                        //       child: Container(
                        //         padding: EdgeInsets.all(4),
                        //         width: size.width * .4,
                        //         height: 60,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(11.0),
                        //           color: Colors.white,
                        //           border: Border.all(
                        //             width: 1.0,
                        //             color: const Color(0xFFEBEBEB),
                        //           ),
                        //         ),
                        //         child: Center(
                        //           child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceAround,
                        //             children: [
                        //               Text(
                        //                 'Cheque',
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 20),
                        //               ),
                        //               Image.asset(
                        //                 'assets/images/ch.png',
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                pickdate().then((value) {
                                  if (value != null) {
                                    Chequetime = value;

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
                                GestureDetector(
                                  onTap: () {
                                    double totalprice = 0;

                                    for (int oo = 0;
                                        oo < bata.cartlist.length;
                                        oo++) {
                                      totalprice = totalprice +
                                          double.parse(bata.cartlist[oo]
                                              .itemDetails[0].sellingPrice);
                                    }



                                    _databaseHelper
                                        .insert_sales_order_requests(
                                            Sales_Order_Requests_Model(
                                      user_id: _userAndPermissions.user.id,
                                      customer_id: 10,
                                      // int.parse(_userAndPermissions.user.customerId),
                                      employee_id:
                                          _userAndPermissions.user.userId,
                                      request_status: 'accepted',
                                      salesmanager_id: _userAndPermissions
                                          .user.salesmanagerId,
                                      request_type:
                                          isinvoiceOrSalesOrderOrReturnInvoice,
                                      // 'salesOrder',
                                      salesmanager_status: 'pending',
                                      store_id: 1,
                                      total_price: totalprice,
                                      created_at: DateTime.now().toString(),
                                      supervisor_id:
                                          _userAndPermissions.user.supervisorId,
                                      total_discount: 1000,
                                      is_successfully_submitted: 0,
                                      no_of_items:
                                          bata.cartlist.length.toString(),
                                      salesmanager_note: '',
                                      request_level: 1,
                                      total_tax: 10,
                                      total_price_without_tax_discount: 55,
                                    ))
                                        .then((value) {
                                      insertItemInDataBase(value);
                                    }).catchError((e) {
                                      print(e.toString());
                                    });
                                  },
                                  child: Container(
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
                                  ),
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

  Widget item({size, AllItems data}) {
    int numberofitem = 0;
    for (int i = 0; i < bata.cartlist.length; i++) {
      if (bata.cartlist[i] == data) {
        numberofitem++;
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          //  height: size.height * .145,
          width: size.width,
          // color: Colors.white,
          child: Column(
            children: [
              //photo item
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          // image: DecorationImage(
                          //   image: NetworkImage(data.itemDetails[0].image),
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                CartEditProduct(data),
                              );
                            },
                            child: Text(
                              data.itemDetails[0].itemNameEn,
                              // overflow: TextOverflow.fade,
                              maxLines: 2,

                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                color: const Color(0xff1e2432),
                                letterSpacing: -0.32,
                                height: 1.2,
                              ),
                            ),
                          ),

                          //price
                          Text(
                            data.itemDetails[0].sellingPrice,
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              color: const Color(0xff191919),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: InkWell(
                            onTap: () {
                              listtoshow.remove(data);
                              bata.removeAllChooseItexfromcart(item: data);

                              setState(() {});
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.grey,
                              size: 30,
                            ))),
                    // Container(
                    //     child: InkWell(
                    //         onTap: () {
                    //
                    //           // Get.to(CartEditProduct(data), );
                    //           // //
                    //           // // Navigator.push(
                    //           // //   context,
                    //           // //   MaterialPageRoute(
                    //           // //       builder: (context) => CartEditProduct()),
                    //           // // );
                    //           // //
                    //           // //
                    //
                    //         },
                    //         child: Icon(
                    //           Icons.edit,
                    //           color: Colors.grey,
                    //           size: 30,
                    //         ))),
                  ],
                ),
              ),

              //edit & delete

              //item name

              //counter
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        bata.removefromcart(item: data);

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(2)),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    // IconButton(
                    //   icon: Icon(
                    //     Icons.remove_circle,
                    //     size: 60,
                    //   ),
                    //   onPressed: () {
                    //     bata.removefromcart(item: data);
                    //
                    //   },
                    //   color: Colors.orangeAccent,
                    // ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      numberofitem.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 15,
                    ),

                    InkWell(
                      onTap: () {
                        bata.addToCart(item: data);

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(2)),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.add_circle, size: 60),
                    //   color: Colors.orangeAccent,
                    //   onPressed: () {
                    //     bata.addToCart(item: data);
                    //     print('pppp');
                    //
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  insertItemInDataBase(int i) async {
   
    for (int oo = 0; oo < bata.cartlist.length; oo++) {
      if( bata.itemcount[bata.cartlist[oo].itemId]==null){
        bata.itemcount[bata.cartlist[oo].itemId]=1;
      //  bata.itemInCart.value++;
      }else{
        bata. itemcount[bata.cartlist[oo].itemId]+=1;
      }
     }
      // bata.additemInitemInCart(item: bata.cartlist[oo]);
    bata.itemcount.forEach((key, value) async{
  await DatabaseHelper()
      .insert_item_tabel(Item_Database(
          olderId: i,
          itemId: int.tryParse(key),
          // categoryId:
          //     int.parse(bata.cartlist[oo].itemDetails[0].categoryId), //

          // basePricePerUnit: double.parse(
          //     bata.cartlist[oo].itemDetails[0].itemCost ?? "1")
    quantity: value
  )
  )
      .then((value) {
    print('تم اضافه');
  }).catchError((e) {
    print(e.toString());
  });
});



   // Get.off(Dashboard());
  }
}

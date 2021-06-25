import 'package:anjum/DB/dataBaseHelper.dart';
import 'package:anjum/DB/myModel.dart';
import 'package:anjum/DB/tabelname/insert_visit_DB.dart';
import 'package:anjum/DB/tabelname/item_tabel.dart';
import 'package:anjum/DB/tabelname/make_older.dart';
import 'package:anjum/controllers/allCategoriesController.dart';
import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/controllers/allStockItemsController.dart';
import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/controllers/dropdownMenuItemList.dart';
import 'package:anjum/controllers/employeDataController.dart';
import 'package:anjum/controllers/priceListsInfoController.dart';
import 'package:anjum/controllers/timeController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:anjum/network/json/olderpost_json.dart';
import 'package:anjum/network/json/products_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:anjum/utilitie/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'all _customer.dart';
import 'cart.dart';
import 'filter.dart';

class ProductsScr extends StatefulWidget {
  @override
  _ProductsScrState createState() => _ProductsScrState();
}

class _ProductsScrState extends State<ProductsScr> {
  List<Widget> alert_item = [];

  AllItemsController bata = Get.find<AllItemsController>();

  CartItemController cartListItem =
      Get.put(CartItemController(), permanent: true);

  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());
  DatabaseHelper _databaseHelper = DatabaseHelper();
  final TimeController c = Get.find<TimeController>();

  //============================================

  int totalItem = 0;

  //=========================
  var stocitem = Get.find<AllStockItemsController>().allStockItems;//ده لسته المنتجات وممكن المقارنه بايد الاستور ونضيفه في لسته

  DropdownMenuItemList dropdownMenuItemList = Get.put(DropdownMenuItemList(),permanent: true);

  //====================
  AllStockItems _allStockItems;
  //getstock
  getmeasurementUnit(int idItem){
    List<String>dropdowen=[];
    for(int i=0;i<stocitem.length;i++){

      if(idItem==int.parse(stocitem[i].itemId)){
        dropdownMenuItemList.allStockItems[0].add(stocitem[i]);
      }
    }




     }
  @override
  void initState() {
    super.initState();


    dropdownMenuItemList.allStockItems.clear();
    dropdownMenuItemList.listtextEditingControllerOfItem.clear();

    super.initState();
    for (int i = 0; i < bata.customerListItems.length; i++) {
      List<AllStockItems>p=[];
      dropdownMenuItemList.allStockItems.add(p);
      TextEditingController textEditingControllerOfItem  =TextEditingController();
      textEditingControllerOfItem.text = 0.toString();
      dropdownMenuItemList.addlisttextEditingControllerOfItem(textEditingControllerOfItem);
      AllStockItems allStockItems;
      dropdownMenuItemList.listdropdownValue.add(allStockItems);
      //  for(int z=0;z<stocitem.length;z++){
      //
      //   dropdownMenuItemList.allStockItems[i].add(stocitem[z]);
      //
      // }



      // dropdownMenuItemList.listdropdownValue[i]=dropdownMenuItemList.allStockItems[i][0];

    }

  } //============================================
  //int itemcount=0;

  @override
  Widget build(BuildContext context) {
    print('00000000000000000000000000000000000000000000');
    var size = MediaQuery.of(context).size;
    for (int i = 0; i < 10; i++) {
      alert_item.add(AlirtItem());
    }
    // biledjsonpost();
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
                                Get.to(() => Cart());
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

                        Obx(()=>      Text(   cartListItem.cartlist.length.toString(),
                            style: TextStyle(
                                color: Colors.white, fontSize: 18)),)
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[100]),
                            width: size.width * .8,
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
                          GestureDetector(
                            onTap: () {
                              Get.to(() => Filter());
                            },
                            child: Container(
                              width: size.width * .1,
                              height: size.width * .1,
                              child: Image.asset('assets/images/filter.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                          shrinkWrap: true,
                          addAutomaticKeepAlives: true,
                          itemCount: bata.customerListItems.length
                          // 100, //bata.allItems.length,
                          ,
                          itemBuilder: (context, pos) {
                            // for (int i = 0; i < stocitem.length; i++) {
                            //   if (stocitem[i].itemId ==
                            //       bata.customerListItems[pos].itemId) {
                            //     dropdownMenuItemList.allStockItems[pos]
                            //         .add(stocitem[i]);
                            //     // list.add(stocitem[i])  ;
                            //
                            //   }
                            // }

                            var count = cartListItem.cartlist
                                .where((c) => c == bata.customerListItems[pos])
                                .toList()
                                .length;
                            var cat = Get.find<AllCategoriesController>()
                                .allCategories;
                            AllCategories categories;
                            for (int i = 0;
                                i <
                                    Get.find<AllCategoriesController>()
                                        .allCategories
                                        .length;
                                i++) {
                              if (cat[i].id == bata.customerListItems[pos].id) {
                                categories = cat[i];
                              }
                            }





                            return Obx((){
                              int numberofitem=0;
                              for(int i=0;i<cartListItem.cartlist.length;i++){
                                if(cartListItem.cartlist[i]==bata.customerListItems[pos]){
                                  numberofitem++;
                                }
                              }


                              dropdownMenuItemList
                                  .listtextEditingControllerOfItem[pos].text=numberofitem.toString();
                              return      item(
                                  pos: pos,
                                  list: dropdownMenuItemList.allStockItems[pos],
                                  dropdowenval:
                                  dropdownMenuItemList.listdropdownValue[pos],
                                  textEditingController: dropdownMenuItemList
                                      .listtextEditingControllerOfItem[pos],
                                  size: size,
                                  funadd: () {
                                    int i = int.parse(dropdownMenuItemList
                                        .listtextEditingControllerOfItem[pos]
                                        .text) +
                                        1;
                                    dropdownMenuItemList
                                        .listtextEditingControllerOfItem[pos]
                                        .text = i.toString();
                                  },
                                  products: //cartitem.showItemDataWithPrice[pos].itemDetails[pos]
                                  bata.customerListItems[pos],
                                  funremov: () {
                                    if (int.parse(dropdownMenuItemList
                                        .listtextEditingControllerOfItem[pos]
                                        .text) >
                                        0) {
                                      int i = int.parse(dropdownMenuItemList
                                          .listtextEditingControllerOfItem[
                                      pos]
                                          .text) -
                                          1;
                                      dropdownMenuItemList
                                          .listtextEditingControllerOfItem[pos]
                                          .text = i.toString();
                                    }
                                  });
                            }); // AlirtItem( );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          cartListItem.cartlist.clear();
                          totalItem = 0;
                          double totalprice = 0;
                          for (int i = 0;
                              i <
                                  dropdownMenuItemList
                                      .listtextEditingControllerOfItem.length;
                              i++) {
                            totalItem = totalItem +
                                int.parse(dropdownMenuItemList
                                    .listtextEditingControllerOfItem[i].text);
                            totalprice = totalprice +
                                (int.parse(dropdownMenuItemList
                                        .listtextEditingControllerOfItem[i]
                                        .text) *
                                    double.tryParse(bata.customerListItems[i]
                                        .itemDetails[0].sellingPrice));

                            for (int p = 0;
                                p <
                                    int.parse(dropdownMenuItemList
                                        .listtextEditingControllerOfItem[i]
                                        .text);
                                p++) {print( bata.customerListItems[i].id);
                              cartListItem.addToCart(
                                  item: bata.customerListItems[i]);
                            }
                          }

                          int customer_id = int.tryParse(
                              Get.find<AllChequesController>().customer_id);
                          print('customer_id     $customer_id');

                          // for (int i = 0;
                          //     i < cartListItem.cartlist.length;
                          //     i++) {
                          //   totalprice = totalprice +
                          //       double.tryParse(cartListItem
                          //           .cartlist[i].itemDetails[0].sellingPrice);
                          // }
                          _databaseHelper
                              .insert_sales_order_requests(
                                  Sales_Order_Requests_Model(
                            user_id: _userAndPermissions.user.id,
                            customer_id: customer_id,
                            employee_id: _userAndPermissions.user.userId,
                            request_status: 'accepted',
                            salesmanager_id:
                                _userAndPermissions.user.salesmanagerId,
                            request_type: 'salesOrder',
                            salesmanager_status: 'pending',
                            store_id: 1,
                            total_price: totalprice,
                            created_at: DateTime.now().toString(),
                            supervisor_id:
                                _userAndPermissions.user.supervisorId,
                            total_discount: 1000,
                            is_successfully_submitted: 0,
                            no_of_items: totalItem.toString(),
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
                    Container (
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      height: size.height * .075,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15))),
                            height: size.height * .075,
                            width: size.width * .6,
                            child: Center(
                                child: GetX<TimeController>(
                              init: TimeController(),
                              builder: (c) {
                                return Text(c.stoptimedisplay.value);
                              },
                            )),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (!c.swatch.isRunning) {
                                  getMyLoction(firesvisittlocation);

                                  c.startjor();
                                } else {
                                  getMyLoction(endvisittlocation);
                                  DatabaseHelper()
                                      .insert_insert_visit(Insert_visit_DB(
                                    customer_id:
                                        Get.find<AllChequesController>()
                                            .customer
                                            .customerInfo
                                            .id,
                                    user_id:
                                        _userAndPermissions.user.id.toString(),
                                  ))
                                      .then((value) {
                                    Get.find<AllChequesController>().customer =
                                        null;
                                  });
                                  c.stopjor();
                                  Get.to(() => All_Customer());
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff2C4B89),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15))),
                                height: size.height * .075,
                                child: Center(
                                    child: Obx(() => Text(
                                          c.startswatch.value
                                              ? 'End Visit'
                                              : 'start',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    ));
  }

  insertItemInDataBase(int i) async {


    for (int oo = 0; oo < cartListItem.cartlist.length; oo++) {

      await DatabaseHelper()
          .insert_item_tabel(Item_Database(
              olderId: i,
              itemId: int.tryParse(cartListItem.cartlist[oo].itemId),
              categoryId: int.parse(
                  cartListItem.cartlist[oo].itemDetails[0].categoryId), //

              basePricePerUnit: double.parse(
                  cartListItem.cartlist[oo].itemDetails[0].itemCost ?? "1")))
          .then((value) {
        print('تم اضافه');
      }).catchError((e) {
        print(e.toString());
      });
    }
  }

  Widget item(
      {Size size,
      int pos,
      AllItems products,
      funadd,
      funremov,
      TextEditingController textEditingController,
      AllStockItems dropdowenval,
      List<AllStockItems> list}) {
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
                children: [
                  Container(
                    height: size.height * .15,
                    width: size.height * .15,
                    color: Colors.indigo,
                    child: Image.network(
                      products.itemDetails[0].image,
                      height: size.height * .1,
                      width: size.height * .1,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(products.itemDetails[0].itemNameEn),
                      SizedBox(
                        height: 4,
                      ),
                      Text(products.itemDetails[0].minimumQuantity),
                      //products.itemDetails[0].itemCost
                      Text(products.itemDetails[0].sellingPrice),
                      //  Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                title: Row(
                  children: [
                    Text('Details'),
                    SizedBox(
                      width: size.width * .08,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: funremov,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(2)),
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: size.width * .2,
                          child: Center(
                            child:TextField(
                              controller: textEditingController,
                              textAlign: TextAlign.center,keyboardType:TextInputType.number ,
                            )
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: funadd,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(2)),
                            height: 30,
                            width: 30,
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

                        SizedBox(
                          width: 20,
                        ),
                      ],
                    )
                  ],
                ),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     //categories.categoryNameEn
                      //     child: Text("category Name")),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'item Number: ${products.itemDetails[0].itemNumber}'),
                            Container(
                                child: Text(
                                    'item name:  ${products.itemDetails[0].itemNameEn}'))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(
                            //     'Item Price :${products.itemDetails[0].itemCost}'),
                            Text('Tax:  ${products.itemDetails[0].tax}')
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Promotion',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Widget okButton = TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            );
                            AlertDialog alert = AlertDialog(
                              title: Center(
                                child: Text(
                                  "Promotion list",
                                  style: TextStyle(color: Colors.red),
                                ),
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
                              Image.asset(
                                'assets/images/iso.png',
                                width: 30,
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Show All Promotion',
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Text('Store ID'),
                      //           Obx(() => Container(width: size.width*.25,
                      //             decoration: BoxDecoration(  border: Border.all(
                      //               color: Colors.grey,
                      //               width: 1,
                      //             ),borderRadius: BorderRadius.circular(10)),
                      //             child: Center(
                      //               child: DropdownButton<AllStockItems>(
                      //                     value: dropdownMenuItemList
                      //                         .listdropdownValue[pos],
                      //                     icon: const Icon(Icons.arrow_downward),
                      //                     iconSize: 15,
                      //                     elevation: 16,
                      //                     style: const TextStyle(
                      //                         color: Colors.deepPurple),
                      //                     // underline: Container(
                      //                     //   height: 2,
                      //                     //   color: Colors.deepPurpleAccent,
                      //                     // ),
                      //                     onChanged: (AllStockItems newValue) {
                      //                       dropdownMenuItemList.setValOfdropdownValue(
                      //                           pos: pos, dropdownValue: newValue);
                      //
                      //                     },
                      //                     items: dropdownMenuItemList
                      //                         .allStockItems[pos]
                      //                         .map<DropdownMenuItem<AllStockItems>>(
                      //                             (AllStockItems value) {
                      //                       return DropdownMenuItem<AllStockItems>(
                      //                         value: value,
                      //                         child: Text(value.id),
                      //                       );
                      //                     }).toList(),
                      //                   ),
                      //             ),
                      //           ))
                      //         ],
                      //       ),
                      //       Column(
                      //         children: [
                      //           Text('Unit'),
                      //        Obx(()=>
                      //               Container(width: size.width*.25,height: 50,
                      //                   decoration: BoxDecoration(  border: Border.all(
                      //                     color: Colors.grey,
                      //                     width: 1,
                      //                   ),borderRadius: BorderRadius.circular(10)),
                      //                 child: Center(
                      //                   child: Text(   dropdownMenuItemList
                      //                       .listdropdownValue[pos].measurementUnitName
                      //                    ),
                      //                 ),
                      //               )
                      //         )
                      //         ],
                      //       ),
                      //       Column(
                      //         children: [
                      //           Text('Quantity'),
                      //          Obx(()=>
                      //              Container(width: size.width*.25,height: 50,
                      //                decoration: BoxDecoration(  border: Border.all(
                      //                  color: Colors.grey,
                      //                  width: 1,
                      //                ),borderRadius: BorderRadius.circular(10)),
                      //                child: Center(
                      //                  child: Text(
                      //                      textEditingController.text
                      //          ),
                      //                ),
                      //              )
                      //           )
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Bounce'),
                                Container(

                                  width: size.width*.4,height: 50,
                                  decoration: BoxDecoration(color: Colors.grey[200],  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    textAlign: TextAlign.center,
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
                                Text('Discount %'),
                                Container(
                                  width: size.width*.4,height: 50,
                                  decoration: BoxDecoration( color: Colors.grey[200], border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    textAlign: TextAlign.center,
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
                                Text('stock'),
                                Container(

                                    width: size.width*.4,height: 50,
                                    decoration: BoxDecoration(  border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(products
                                            .itemDetails[0].minimumQuantity))),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Price per Item'),
                                Container(

                                  width: size.width*.4,height: 50,
                                  decoration: BoxDecoration(  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                          products.itemDetails[0].itemCost ??
                                              "")),
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
                                Text('Price'),
                                Container(

                                  width: size.width*.4,height: 50,
                                  decoration: BoxDecoration(  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(products
                                          .itemDetails[0].sellingPrice)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Tax %'),
                                Container(

                                  width: size.width*.4,height: 50,
                                  decoration: BoxDecoration(  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(products.itemDetails[0].tax)),
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
                                Text('Total Tax'),
                                Container(

                                    width: size.width*.4,height: 50,
                                    decoration: BoxDecoration(  border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text((double.tryParse(products
                                                    .itemDetails[0]
                                                    .sellingPrice) *
                                                double.tryParse(products
                                                    .itemDetails[0].tax))
                                            .toString()))),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Total Price'),
                                Container(

                                  width: size.width*.4,height: 50,
                                  decoration: BoxDecoration(  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),borderRadius: BorderRadius.circular(10)),
                                  child: Center(child: Text('هنشوف الحساب')),
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

                              width: size.width*.4,height: 50,
                              decoration: BoxDecoration(  border: Border.all(
                                color:  Color(0xff2C4B89),
                                width: 1,
                              ),borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text('Cancel')),
                            ),
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
                          ],
                        ),
                      )
                    ],
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
                  Text('Promotion No'),
                  Text('369'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: funremov, child: Text('Promotion Name')),
                  GestureDetector(onTap: funadd, child: Text('bol 100+30')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Promotion Details'),
                  Text('bol 100+30'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('16-4-2021'),
                  Text('18-4-2021'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  biledjsonpost(
      {UserAndPermissions userAndPermissions,
      CartItemController cartListItem}) {
    EmployeDataController employeDataController = EmployeDataController();
    OlderPost_json listOrder = OlderPost_json(listOrder: [
      ListOrderToJson(
          item: [],
          userId: userAndPermissions.user.id,
          requestLevel: 5,
          noOfItems: cartListItem.cartlist.length,
          storeId: 44,
          requestType: 'nn',
          employeeId: 5,
          customerId: 5)
    ]);

    String jsonUser = jsonEncode(listOrder);
    print(jsonUser);
  }



  bool isNumericUsing_tryParse(String string) {
    // Null or empty string is not a number
    if (string == null || string.isEmpty) {
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = num.tryParse(string);

    if (number == null) {
      return false;
    }

    return true;
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

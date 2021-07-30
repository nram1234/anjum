import 'package:anjum/controllers/allStockItemsController.dart';
import 'package:anjum/controllers/cartItemController.dart';
import 'package:anjum/controllers/dropdownMenuItemList.dart';
import 'package:anjum/controllers/myProdectListController.dart';
import 'package:anjum/controllers/unitController.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartEditProduct extends StatefulWidget {
  Rx<TheItemInList> data;

  CartEditProduct(this.data);

  @override
  _CartEditProductState createState() => _CartEditProductState();
}

class _CartEditProductState extends State<CartEditProduct> {

  final MyProdectListController _myProdectListController = Get.find<MyProdectListController>();















  final UnitController _UnitController = Get.find<UnitController>();
  int itemCountinCart = 0;
  var stocitem = Get.find<AllStockItemsController>().allStockItems;
  CartItemController bata = Get.find<CartItemController>();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController_discount =
      TextEditingController();
  TextEditingController textEditingController_bounce = TextEditingController();
  List<AllStockItems> droblist = [];
  double total_Tax = 0;
  double net_sal = 0;
  double totalPriceBeforDes = 0;
  double totalPriceafterDes=0;
//  AllStockItems val
  bool showdropdowen ;
  @override
  void initState() {
    super.initState();
    showdropdowen = (_UnitController.MeasurementUnit_map[widget.data.value.id].length > 1);
    textEditingController_discount.text =widget.data.value.diescount.toString();


    for (int i = 0;
    i < bata.cartlist.length;
    i++) {
      if (bata.cartlist[i].id == widget.data.value.id) {
        itemCountinCart++;
      }
    }
    }

  @override
  Widget build(BuildContext context) {
   // allPrice(bata.discount[int.parse(widget.data.itemId)]);
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: size.height * .15,
                              width: size.height * .15,
                              color: Colors.indigo,
                              child: Image.network(
                                widget.data.value.pic,
                                height: size.height * .1,
                                width: size.height * .1,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    widget.data.value.name,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text("minimum Quantity: ${widget
                                      .data.value.minimumQuantity}"),
                                  //products.itemDetails[0].itemCost       _UnitController. val_Of_uint_map[widget.data.itemId]!=null?_UnitController. val_Of_uint_map[widget.data.itemId].sellingPrice:widget.data.itemDetails[0].sellingPrice
                                  Text('Price: ${widget.data.value.price}'),
                                  //  Expanded(child: Container()),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                if(_myProdectListController
                                    .item[widget.data.value.id].value.count>0){
                                  int v = _myProdectListController
                                      .item[widget.data.value.id].value.count - 1;
                                  print(widget.data.value.count);
                                  _myProdectListController.setCount(
                                      id: widget.data.value.id,
                                      count: v);
                                }
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
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: size.width * .2,
                              child: Center(
                                child: GetBuilder<MyProdectListController>(
                                  builder: (logic) {
                                    textEditingController.text=logic.item[widget.data.value.id].value.count.toString();

                                    return TextField(
                                      onChanged: (v) {
                                        if (v != null && v.isNotEmpty) {
                                          _myProdectListController.setCount(
                                              id: widget.data.value.id,
                                              count: int.parse(v));
                                        }
                                      },
                                      onEditingComplete: () {},
                                      controller: textEditingController,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                int v = _myProdectListController
                                    .item[widget.data.value.id].value.count + 1;
                                print(widget.data.value.count);
                                _myProdectListController.setCount(
                                    id: widget.data.value.id,
                                    count: v);
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
                                        fontSize: 30,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            //categories.categoryNameEn
                            child: Text("category Name")),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'item Number: ${widget.data.value.itemNumber}',
                                  maxLines: 2,
                                ),
                              ),
                              // Expanded(
                              //   child: Text(
                              //       'item name:  ${widget.data.itemDetails[0].itemNameEn}', maxLines: 2,),
                              // )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Item Price :${widget.data.value.price}'),
                              Text('Tax:  ${widget.data.value.tex}')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Details'),
                        ),
                        SizedBox(
                          width: size.width * .08,
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
                              // AlertDialog alert = AlertDialog(
                              //   title: Center(
                              //     child: Text(
                              //       "Promotion list",
                              //       style: TextStyle(color: Colors.red),
                              //     ),
                              //   ),
                              //   content: Container(
                              //     height: size.height * .8,
                              //     width: size.width * .8,
                              //     child: ListView(
                              //       children: alert_item,
                              //     ),
                              //   ),
                              //   actions: [
                              //     okButton,
                              //   ],
                              // );
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return alert;
                              //   },
                              // );
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
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Store ID'),
                                  Container(
                                    width: size.width * .25,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(stocitem[0].storeId.toString()
                                          // dropdownMenuItemList
                                          // .listdropdownValue[pos].measurementUnitName
                                          ),
                                    ),
                                  )
                                  // Obx(() => Container(width: size.width*.25,
                                  //   decoration: BoxDecoration(  border: Border.all(
                                  //     color: Colors.grey,
                                  //     width: 1,
                                  //   ),borderRadius: BorderRadius.circular(10)),
                                  //   child: Center(
                                  //     child: DropdownButton<AllStockItems>(
                                  //       value: dropdownMenuItemList
                                  //           .listdropdownValue[pos],
                                  //       icon: const Icon(Icons.arrow_downward),
                                  //       iconSize: 15,
                                  //       elevation: 16,
                                  //       style: const TextStyle(
                                  //           color: Colors.deepPurple),
                                  //       // underline: Container(
                                  //       //   height: 2,
                                  //       //   color: Colors.deepPurpleAccent,
                                  //       // ),
                                  //       onChanged: (AllStockItems newValue) {
                                  //         dropdownMenuItemList.setValOfdropdownValue(
                                  //             pos: pos, dropdownValue: newValue);
                                  //
                                  //       },
                                  //       items: dropdownMenuItemList
                                  //           .allStockItems[pos]
                                  //           .map<DropdownMenuItem<AllStockItems>>(
                                  //               (AllStockItems value) {
                                  //             return DropdownMenuItem<AllStockItems>(
                                  //               value: value,
                                  //               child: Text(value.id),
                                  //             );
                                  //           }).toList(),
                                  //     ),
                                  //   ),
                                  // ))
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Unit'),
                                  Container(
                                    width: size.width * .25,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child:         showdropdowen
                                          ? DropdownButton<ItemUnits>(value:   _UnitController. val_Of_uint_map[widget.data.value.id] ,
                                        icon: const Icon(
                                            Icons.arrow_downward),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.deepPurple),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        onChanged: (ItemUnits newValue) {
                                          _UnitController. val_Of_uint_map[widget.data.value.id]=newValue;
                                       //   print(_UnitController. val_Of_uint_map[widget.data.itemId].itemMeasurementUnits);
                                          setState(() {});
                                        },
                                        items: _UnitController.MeasurementUnit_map[widget.data.value.id].map<
                                            DropdownMenuItem<
                                                ItemUnits>>(
                                                (ItemUnits value) {
                                              return DropdownMenuItem<
                                                  ItemUnits>(
                                                value: value,
                                                child: Text(
                                                    value.itemMeasurementUnits),
                                              );
                                            }).toList(),
                                      )
                                          : Text(  _UnitController.val_Of_uint_map[widget.data.value.id]!=null?
                                         _UnitController.val_Of_uint_map[widget.data.value.id].itemMeasurementUnits:_UnitController.MeasurementUnit_map[widget.data.value.id][0].itemMeasurementUnits ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Quantity'),
                                  Container(
                                    width: size.width * .25,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(widget.data.value
                                          .minimumQuantity
                                          .toString()),
                                    ),
                                  )
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
                                  Text('Bounce'),
                                  Container(
                                    width: size.width * .4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      controller: textEditingController_bounce,
                                      keyboardType: TextInputType.number,
                                      onChanged: (v) {
                                        bata.bounce[
                                                int.parse(widget.data.value.id)] =
                                            double.parse(v);
                                      },
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
                                    width: size.width * .4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      onChanged: (v) {

                                        if (v != null && v.isNotEmpty) {
                                          _myProdectListController.setdiscount(
                                              id: widget.data.value.id, val: v);
                                        }


                                      },
                                      controller:
                                          textEditingController_discount,
                                      keyboardType: TextInputType.number,
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
                                  Text('Input Qty'),
                                  Container(
                                      width: size.width * .4,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child:
                                        GetBuilder<MyProdectListController>(
                                          builder: (logic) {

                                            return Text(logic
                                                .item[widget.data.value.id]
                                                .value
                                                .count
                                                .toString());
                                          },
                                        ),
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Price before discount'),
                                  Container(
                                    width: size.width * .4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child:Center(
                                      child: GetBuilder<MyProdectListController>(
                                        builder: (logic) {
                                          return Text(logic
                                              .item[widget.data.value.id]
                                              .value
                                              .befordes
                                              .toStringAsFixed(3));
                                        },
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
                                  Text('Price after discount'),
                                  Container(
                                    width: size.width * .4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: GetBuilder<MyProdectListController>(
                                        builder: (logic) {
                                          return Text(logic
                                              .item[widget.data.value.id]
                                              .value
                                              .afterdes
                                              .toStringAsFixed(3));
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Tax %'),
                                  Container(
                                    width: size.width * .4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                            widget.data.value.tex.toString())),
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
                                      width: size.width * .4,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child:
                                        GetBuilder<MyProdectListController>(
                                          builder: (logic) {
                                            return Text(
                                               widget.data.value
                                                    .totalTaxForItem
                                                    .toStringAsFixed(3)
                                            );
                                          },
                                        ),
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Net price'),
                                  Container(
                                    width: size.width * .4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child:  Center(child:
                                    GetBuilder<MyProdectListController>(
                                      builder: (logic) {
                                        return Text(
                                            widget.data.value
                                                .totalPriceForItem
                                                .toStringAsFixed(3));
                                      },
                                    )),
                                  )
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
                              // Container(
                              //   width: size.width * .4,
                              //   height: 50,
                              //   decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: Color(0xff2C4B89),
                              //         width: 1,
                              //       ),
                              //       borderRadius: BorderRadius.circular(10)),
                              //   child: Center(child: Text('Cancel')),
                              // ),
                         GestureDetector(onTap: (){
                           Navigator.pop(context);
                         },child:      Container(
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
                         ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    ));
  }
//   allPrice(double v){
//     bata.discount[
//     int.parse(widget.data.itemId)] =
//         v;
//     totalPriceBeforDes = double.parse( _UnitController.val_Of_uint_map[widget.data.itemId]!=null?_UnitController.val_Of_uint_map[widget.data.itemId].sellingPrice:widget.data.itemDetails[0].sellingPrice ) *
//         double.parse(
//             itemCountinCart.toString());
//
//
//
//
//
//
//
// print(totalPriceBeforDes);
//
//     totalPriceafterDes =totalPriceBeforDes-(totalPriceBeforDes*( v/100));
//     total_Tax = totalPriceafterDes*( double.parse( widget.data.itemDetails[0].tax) /100);
//     net_sal =  totalPriceafterDes+(totalPriceafterDes*(double.parse( widget.data.itemDetails[0].tax)/100));
//
//   }
}

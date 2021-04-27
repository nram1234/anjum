import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

// import './catalog.dart';
import 'package:adobe_xd/page_link.dart';

// import './timeline.dart';
import './OrderStatus.dart';

// import './reprint.dart';
// import './allcustomer.dart';
// import './Reports.dart';
// import './PromotionList.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartEditProduct extends StatefulWidget {
  @override
  _CartEditProductState createState() => _CartEditProductState();
}

class _CartEditProductState extends State<CartEditProduct> {
  String dropdownValue = '433';
  String dropdownValueUnit = 'box';

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    var sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            // header container
            Container(
              height: sHeight * .10,
              width: sWidth,
              color: Color(0xff2c4b89),
              child: Stack(
                children: [
                  Container(
                    height: sHeight * .10,
                    color: Color(0xff2c4b89),
                  ),
                  Positioned(
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 27,
                        )),
                    bottom: sHeight*.05,
                    left: sWidth*.03,
                  ),
                  Positioned(
                    bottom: sHeight*.02,
                    left: sWidth*.01,
                    child: Text(
                      "Edit Product",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        color: const Color(0xffffffff),
                        letterSpacing: 0.88,
                      ),
                    ),
                  )
                ],
              ),
            ),
            //item details container
            Container(
                height: sHeight * .145,
                width: sWidth,
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                      height: sHeight * .145,
                      color: Colors.white,
                    ),
                    //photo item
                    Positioned(
                      bottom: sHeight*.032,
                      left: sWidth*.03,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage('assets/images/oil.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    //promotion
                    Positioned(
                      top: sHeight*.005,
                      right: sWidth*.03,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage('assets/images/iso.PNG'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    //item name
                    Positioned(
                      top: sHeight*.004,
                      right: sWidth*.26,
                      child: Text(
                        'Safi  - corn oil 1 liter',
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
                    //min order num
                    Positioned(
                      top: sHeight*.025,
                      right: sWidth*.38,
                      child: Text(
                        'Min Order : 2   box',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          color: const Color(0xffb8bbc6),
                          letterSpacing: -0.24,
                          height: 1.3333333333333333,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //price
                    Positioned(
                      top: sHeight*.055,
                      right: sWidth*.45,
                      child: Text(
                        'Price - 20.00 JD',
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
                      top: sHeight*.08,
                      right: sWidth*.15,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle,
                              size: 40,
                            ),
                            onPressed: () {
                              setState(() {});
                            },
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("2"),
                          SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle, size: 40),
                            color: Colors.orangeAccent,
                            onPressed: () {
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: sHeight*.09,
                      right: sWidth*.5,
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 30),
                        child: ElevatedButton(
                          child: Text('Details'),
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            primary: Colors.grey,
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                )),
            //Container more details
            Container(
              height: sHeight * .11,
              width: sWidth,
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    height: sHeight * .11,
                    width: sWidth,
                    color: Colors.white,
                  ),
                  //category
                  Positioned(
                    top: sHeight*.005,
                    left: sWidth*.055,
                    child: Text(
                      'Category:',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: const Color(0xff27638f),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    top: sHeight*.005,
                    left: sWidth*.22,
                    child: Text(
                      'food',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        color: const Color(0xff27638f),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  //item no
                  Positioned(
                    top: sHeight*.038,
                    left: sWidth*.09,
                    child: Text(
                      'Item  No :',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: const Color(0xffacacac),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    top: sHeight*.038,
                    left: sWidth*.3,
                    child: Text(
                      '12',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        color: const Color(0xff292929),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  //item price
                  Positioned(
                    top: sHeight*.068,
                    left: sWidth*.09,
                    child: Text(
                      'Item Price :',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: const Color(0xffacacac),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    top: sHeight*.068,
                    left: sWidth*.3,
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        color: const Color(0xff292929),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    top: sHeight*.068,
                    left: sWidth*.33,
                    child: Text(
                      ' JO',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        color: const Color(0xff292929),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  //item name
                  Positioned(
                    right: sWidth*.32,
                    top: sHeight*.038,
                    child: Text(
                      'Item  Name :',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: const Color(0xffacacac),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    right: sWidth*.25,
                    top: sHeight*.038,
                    child: Text(
                      'oil',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        color: const Color(0xff292929),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  //Tax
                  Positioned(
                    right: sWidth*.42,
                    top: sHeight*.068,
                    child: Text(
                      'Tax % :',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: const Color(0xffacacac),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    right: sWidth* 0.35,
                    top: sHeight*.068,
                    child: Text(
                      '16 %',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        color: const Color(0xff292929),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: .3,
            ),
            Container(
              width: sWidth,
              height: sHeight * .07,
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                      width: sWidth, height: sHeight * .07, color: Colors.white),
                  Positioned(
                    left: sWidth*0.1,
                    top: sHeight * .003,
                    child: Text(
                      'Promotion',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 17,
                        color: const Color(0xff5a6482),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Positioned(
                    left: sWidth*0.1,
                    top: sHeight * .03,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/iso.PNG'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: sWidth*0.23,
                    top: sHeight * .03,
                    child: Text(
                      'Show All Promotion',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 20,
                        color: const Color(0xffe6563a),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: .3,
            ),
//store  id &Unit  & Quantity
            Container(
              width: sWidth,
              height: sHeight * 0.08,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(children: [
                      Text(
                        "Store ID",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          elevation: 10,
                          style: const TextStyle(color: Colors.grey),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['433', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 2,
                    child:Column(children: [
                      Text(
                        "Unit",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValueUnit,
                          elevation: 10,
                          style: const TextStyle(color: Colors.grey),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValueUnit = newValue;
                            });
                          },
                          items: <String>['box', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(children: [
                      Text(
                        "Quantity",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child:TextField(),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            //Stock  & Price
            Container(
              width: sWidth,
              height: sHeight * 0.08,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Text(
                        "Stock",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child:TextField(),
                      ),
                    ]),
                  ),

                  Expanded(
                    child: Column(children: [
                      Text(
                        "Price Per Item",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child:TextField(),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            //Price & Tax
            Container(
              width: sWidth,
              height: sHeight * 0.08,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child:TextField(),
                      ),
                    ]),
                  ),

                  Expanded(
                    flex: 1,
                    child: Column(children: [
                      Text(
                        "Tax",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child:TextField(),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
////Total Price & Total Tax
            Container(
              width: sWidth,
              height: sHeight * 0.08,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(children: [
                      Text(
                        "Total Tax",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child:TextField(),
                      ),
                    ]),
                  ),

                  Expanded(
                    flex: 1,
                    child: Column(children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child:TextField(),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            //Bounce  & Discount
            Container(
              width: sWidth,
              height: sHeight * 0.08,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(children: [
                      Text(
                        "Bounce",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child:TextField(),
                      ),
                    ]),
                  ),

                  Expanded(
                    flex: 1,
                    child: Column(children: [
                      Text(
                        "Discount",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: const Color(0xff5a6482),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: const Color(0xffffffff),
                          border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                        ),
                        child:TextField(),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
             Row(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(height: 25),
                    child: ElevatedButton(
                      child: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(height: 25),
                    child: ElevatedButton(
                      child: Text('Ok'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        shape: const BeveledRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            //bottom button
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 60),
                        child: ElevatedButton(
                          child: Text('00:10:00'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 60),
                        child: ElevatedButton(
                          child: Text('End Visit'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String _svg_1ofmkv =
    '<svg viewBox="0.0 0.1 10.0 13.7" ><path transform="translate(0.0, 0.13)" d="M 5.003100872039795 13.72500038146973 C 4.806180953979492 13.72500038146973 4.625510692596436 13.62575054168701 4.519800662994385 13.45950031280518 L 0.805500864982605 7.676100254058838 C 0.181770846247673 6.724330425262451 -0.09406914561986923 5.57783031463623 0.0288008525967598 4.447800159454346 C 0.3060108423233032 2.011590242385864 2.283700942993164 0.1444302797317505 4.731300830841064 0.00810028612613678 C 4.824710845947266 0.002820285735651851 4.919450759887695 0.0001402858033543453 5.012900829315186 0.0001402858033543453 C 6.289780616760254 0.0001402858033543453 7.505030632019043 0.4830502867698669 8.43480110168457 1.359900236129761 C 9.426751136779785 2.295450210571289 9.997210502624512 3.614810228347778 9.999900817871094 4.979700088500977 C 10.00261116027832 5.940500259399414 9.725940704345703 6.872900485992432 9.199800491333008 7.676100254058838 L 5.485500812530518 13.45950031280518 C 5.380691051483154 13.62575054168701 5.200350761413574 13.72500038146973 5.003100872039795 13.72500038146973 Z M 5.000401020050049 3.007800340652466 C 3.897210836410522 3.007800340652466 2.999700784683228 3.904910326004028 2.999700784683228 5.0076003074646 C 2.999700784683228 6.110790252685547 3.897210836410522 7.008300304412842 5.000401020050049 7.008300304412842 C 5.525711059570313 7.008300304412842 6.041060924530029 6.794750213623047 6.414300918579102 6.42240047454834 C 6.792120933532715 6.044570446014404 7.000200748443604 5.542120456695557 7.000200748443604 5.0076003074646 C 7.000200748443604 3.904910326004028 6.103090763092041 3.007800340652466 5.000401020050049 3.007800340652466 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_yl7omh =
    '<svg viewBox="74.5 324.5 10.0 1.0" ><path transform="translate(74.5, 324.5)" d="M 0 0 L 10 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_xg5vch =
    '<svg viewBox="92.5 317.5 10.0 1.0" ><path transform="translate(92.5, 317.5)" d="M 0 0 L 10 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_djk1ob =
    '<svg viewBox="97.5 312.5 1.0 10.0" ><path transform="translate(97.5, 312.5)" d="M 0 10 L 0 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_5pslre =
    '<svg viewBox="0.0 0.0 11.8 6.8" ><path transform="translate(-6.19, -11.25)" d="M 12.09374904632568 13.28176879882813 L 16.55859184265137 17.75018692016602 C 16.88906097412109 18.08065986633301 17.42343521118164 18.08065986633301 17.75039100646973 17.75018692016602 C 18.07734298706055 17.41971206665039 18.07734107971191 16.88533020019531 17.75039100646973 16.55485916137695 L 12.69140529632568 11.4922924041748 C 12.37148475646973 11.17236709594727 11.85820198059082 11.16533470153809 11.52773380279541 11.46768379211426 L 6.43359375 16.55134201049805 C 6.268358707427979 16.71657943725586 6.1875 16.93455123901367 6.1875 17.14900588989258 C 6.1875 17.36346244812012 6.268358707427979 17.58143424987793 6.43359375 17.74666976928711 C 6.764062404632568 18.07714462280273 7.298437118530273 18.07714462280273 7.62539005279541 17.74666976928711 L 12.09374904632568 13.28176879882813 Z" fill="#acacac" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gstwpu =
    '<svg viewBox="-112.0 -174.0 417.0 411.0" ><path transform="translate(-112.0, -174.0)" d="M 208.5 0 C 323.6513671875 0 417 92.0054931640625 417 205.5 C 417 318.9945068359375 323.6513671875 411 208.5 411 C 93.3486328125 411 0 318.9945068359375 0 205.5 C 0 92.0054931640625 93.3486328125 0 208.5 0 Z" fill="#ffffff" fill-opacity="0.07" stroke="none" stroke-width="1" stroke-opacity="0.07" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9qtyyu =
    '<svg viewBox="3.5 239.5 343.0 1.0" ><path transform="translate(3.5, 239.5)" d="M 0 0 L 343 0" fill="none" stroke="#ebebeb" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_su6z90 =
    '<svg viewBox="1.0 329.0 343.0 1.0" ><path transform="translate(1.0, 329.0)" d="M 0 0 L 343 0" fill="none" stroke="#ebebeb" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_54ko5x =
    '<svg viewBox="10.1 0.0 20.5 21.3" ><path  d="M 27.43714141845703 17.73624992370605 L 27.50924301147461 16.31289100646973 C 27.52235794067383 16.05703544616699 27.68637847900391 15.82753276824951 27.92903900146484 15.73569774627686 L 29.2573127746582 15.22735977172852 C 29.83779907226563 15.00763893127441 30.28057098388672 14.53863906860352 30.46749114990234 13.95153713226318 C 30.66098403930664 13.36447620391846 30.57901382446289 12.73153972625732 30.23794174194336 12.21333503723145 L 29.46392059326172 11.01302814483643 C 29.31959533691406 10.79655265808105 29.31963348388672 10.52104949951172 29.46392059326172 10.30461692810059 L 30.24119186401367 9.107516288757324 C 30.57572555541992 8.589351654052734 30.66098022460938 7.953086376190186 30.47077941894531 7.362736225128174 C 30.27728271484375 6.775675773620605 29.84104537963867 6.313254356384277 29.25731658935547 6.090286731719971 L 27.9257926940918 5.578659057617188 C 27.68638229370117 5.490112781524658 27.52565002441406 5.263813972473145 27.51253509521484 5.007999897003174 L 27.43381500244141 3.584600687026978 C 27.43710327148438 3.555043697357178 27.43056869506836 3.52885890007019 27.42727661132813 3.499301433563232 C 27.37807083129883 2.912241220474243 27.07305145263672 2.38421106338501 26.59751510620117 2.033356904983521 C 26.0957145690918 1.675841808319092 25.47259902954102 1.557821750640869 24.86913681030273 1.71522331237793 L 23.48841094970703 2.085809946060181 C 23.24246215820313 2.154665231704712 22.98007202148438 2.069449424743652 22.81938171386719 1.869336009025574 L 21.9207649230957 0.7608230710029602 C 21.53052520751953 0.2787518203258514 20.95000076293945 0 20.33346557617188 0 C 19.71689224243164 0 19.13636779785156 0.2787518203258514 18.74942016601563 0.7575754523277283 L 17.84755516052246 1.869377136230469 C 17.68686294555664 2.06940746307373 17.42447280883789 2.154664754867554 17.17852401733398 2.085851192474365 L 15.79779720306396 1.715264320373535 C 15.20086860656738 1.557862877845764 14.57122135162354 1.67592453956604 14.06941795349121 2.033397912979126 C 13.56761455535889 2.403984785079956 13.2626371383667 2.964818716049194 13.23312091827393 3.584641695022583 L 13.15439987182617 5.007999420166016 C 13.14782238006592 5.26385498046875 12.98055458068848 5.49006986618042 12.74114322662354 5.578658103942871 L 11.40957736968994 6.090285778045654 C 10.83238410949707 6.313294410705566 10.38961219787598 6.775716781616211 10.19611740112305 7.362777233123779 C 10.00591087341309 7.953127384185791 10.0911693572998 8.589310646057129 10.42895126342773 9.110804557800293 L 11.20950698852539 10.30461692810059 C 11.34725856781006 10.52109050750732 11.34725856781006 10.79659557342529 11.20625877380371 11.01627540588379 L 10.42899322509766 12.21337604522705 C 10.09121131896973 12.72825145721436 10.00591278076172 13.36455821990967 10.19940567016602 13.95157718658447 C 10.38636493682861 14.5386381149292 10.83238410949707 15.01092529296875 11.40957927703857 15.2273998260498 L 12.7443904876709 15.73573970794678 C 12.98051357269287 15.82757186889648 13.14453411102295 16.05716133117676 13.15764808654785 16.31293296813965 L 13.22983360290527 17.73633193969727 C 13.22983360290527 17.79532051086426 13.23641109466553 17.85435104370117 13.24619388580322 17.91013336181641 C 13.32166862487793 18.45785522460938 13.61678123474121 18.95636940002441 14.06937885284424 19.27779197692871 C 14.57118034362793 19.64837837219238 15.20411777496338 19.76315116882324 15.80100345611572 19.59917259216309 L 17.17519569396973 19.22858619689941 C 17.42447471618652 19.16301918029785 17.68682289123535 19.24823379516602 17.85080337524414 19.45159530639648 L 18.74942016601563 20.56010818481445 C 19.13311958312988 21.04217720031738 19.71364593505859 21.31439399719238 20.33675765991211 21.31439399719238 C 20.95333099365234 21.31439399719238 21.5338134765625 21.04217720031738 21.92409133911133 20.56010818481445 L 22.81613159179688 19.45159530639648 C 22.98015213012695 19.24827575683594 23.24250030517578 19.1629753112793 23.49174118041992 19.22858619689941 L 24.87246704101563 19.59917259216309 C 25.46281433105469 19.76319313049316 26.09575271606445 19.64837837219238 26.59755706787109 19.27775001525879 C 27.09935760498047 18.9201545715332 27.40433502197266 18.35936164855957 27.43714141845703 17.73624992370605 Z" fill="#e6563a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h2r4z8 =
    '<svg viewBox="13.2 3.7 17.3 17.6" ><path transform="translate(-72.51, -85.54)" d="M 99.10436248779297 104.8208465576172 C 98.60256195068359 105.1914367675781 97.96962738037109 105.3062133789063 97.37928009033203 105.1422729492188 L 95.99855041503906 104.7716827392578 C 95.74931335449219 104.7061157226563 95.48691558837891 104.7913360595703 95.32294464111328 104.9947052001953 L 94.43090057373047 106.1032104492188 C 94.04061889648438 106.5852813720703 93.46009826660156 106.8574981689453 92.84356689453125 106.8574981689453 C 92.22045135498047 106.8574981689453 91.63992309570313 106.5852813720703 91.2562255859375 106.1032104492188 L 90.35760498046875 104.9947052001953 C 90.19358825683594 104.7913818359375 89.93128204345703 104.7060852050781 89.6820068359375 104.7716827392578 L 88.30780792236328 105.1422729492188 C 87.71092224121094 105.3062896728516 87.07798767089844 105.1914825439453 86.57618713378906 104.8208923339844 C 86.12355041503906 104.4994659423828 85.82843780517578 104.0009613037109 85.75299835205078 103.4532470703125 L 99.94723510742188 89.25900268554688 L 100.0193405151367 90.55118560791016 C 100.0324554443359 90.80696105957031 100.1931915283203 91.03325653076172 100.4326019287109 91.12184143066406 L 101.7641220092773 91.63346862792969 C 102.3478469848633 91.85647583007813 102.7840881347656 92.31890869140625 102.9775772094727 92.90592193603516 C 103.1677856445313 93.49627685546875 103.0825271606445 94.13249206542969 102.7479934692383 94.65069580078125 L 101.9707336425781 95.84779357910156 C 101.8264389038086 96.06427001953125 101.8264007568359 96.33978271484375 101.9707336425781 96.55621337890625 L 102.744743347168 97.75651550292969 C 103.0858154296875 98.27473449707031 103.1678314208984 98.90769958496094 102.9742965698242 99.49472045898438 C 102.7873764038086 100.0818328857422 102.3446044921875 100.55078125 101.7641220092773 100.7705383300781 L 100.4358444213867 101.2788848876953 C 100.1931381225586 101.3707122802734 100.0291595458984 101.6003112792969 100.0160522460938 101.8560791015625 L 99.94395446777344 103.2794342041016 C 99.91114807128906 103.9025421142578 99.60617065429688 104.4633331298828 99.10436248779297 104.8208465576172 Z" fill="#d9472b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d8mhwy =
    '<svg viewBox="16.1 6.9 2.8 2.8" ><path transform="translate(-138.87, -159.09)" d="M 156.3914184570313 168.7828521728516 C 155.6241607666016 168.7828521728516 155 168.1587066650391 155 167.3914184570313 C 155 166.6241455078125 155.6241607666016 166 156.3914184570313 166 C 157.1587066650391 166 157.7828521728516 166.6241455078125 157.7828521728516 167.3914184570313 C 157.7828521728516 168.1587066650391 157.1587066650391 168.7828521728516 156.3914184570313 168.7828521728516 Z M 156.3914184570313 167.3923034667969 L 156.3959655761719 167.3923034667969 L 156.3914184570313 167.3923034667969 Z M 156.3914184570313 167.3923034667969 L 156.3959655761719 167.3923034667969 L 156.3914184570313 167.3923034667969 Z M 156.3914184570313 167.3917236328125 L 156.3959655761719 167.3916931152344 L 156.3914184570313 167.3917236328125 Z M 156.3914184570313 167.3917236328125 L 156.3959655761719 167.3916931152344 L 156.3914184570313 167.3917236328125 Z M 156.3914184570313 167.3917236328125 L 156.3914184570313 167.3917236328125 L 156.3914184570313 167.3917236328125 Z M 156.3914184570313 167.3917236328125 L 156.3959655761719 167.3916931152344 L 156.3914184570313 167.3917236328125 Z M 156.3914184570313 167.3917236328125 L 156.3959655761719 167.3916931152344 L 156.3914184570313 167.3917236328125 Z M 156.3914184570313 167.3917236328125 L 156.3959655761719 167.3916931152344 L 156.3914184570313 167.3917236328125 Z" fill="#ffc033" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jumpg6 =
    '<svg viewBox="21.2 12.0 2.8 2.8" ><path transform="translate(-256.32, -276.54)" d="M 278.9464111328125 291.3378601074219 C 278.1791381835938 291.3378601074219 277.5549926757813 290.7137145996094 277.5549926757813 289.9464111328125 C 277.5549926757813 289.1791381835938 278.1791381835938 288.5549926757813 278.9464111328125 288.5549926757813 C 279.7136840820313 288.5549926757813 280.3378295898438 289.1791381835938 280.3378295898438 289.9464111328125 C 280.3378295898438 290.7137145996094 279.7136840820313 291.3378601074219 278.9464111328125 291.3378601074219 Z M 278.9464111328125 289.9472961425781 L 278.9509582519531 289.9472961425781 L 278.9464111328125 289.9472961425781 Z M 278.9464111328125 289.9472961425781 L 278.9509582519531 289.9472961425781 L 278.9464111328125 289.9472961425781 Z M 278.9464111328125 289.9467163085938 L 278.9509582519531 289.9466552734375 L 278.9464111328125 289.9467163085938 Z M 278.9464111328125 289.9467163085938 L 278.9509582519531 289.9466552734375 L 278.9464111328125 289.9467163085938 Z M 278.9464111328125 289.9467163085938 L 278.9464111328125 289.9467163085938 L 278.9464111328125 289.9467163085938 Z M 278.9464111328125 289.9467163085938 L 278.9509582519531 289.9466552734375 L 278.9464111328125 289.9467163085938 Z M 278.9464111328125 289.9467163085938 L 278.9509582519531 289.9466552734375 L 278.9464111328125 289.9467163085938 Z M 278.9464111328125 289.9467163085938 L 278.9509582519531 289.9466552734375 L 278.9464111328125 289.9467163085938 Z" fill="#f9a926" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_brn1ss =
    '<svg viewBox="16.2 7.0 8.0 8.0" ><path transform="translate(-140.37, -161.41)" d="M 156.7702484130859 176.17236328125 C 156.4986419677734 175.9007720947266 156.4984741210938 175.4602508544922 156.7702484130859 175.1884918212891 L 163.3294830322266 168.6292419433594 C 163.6012573242188 168.3574829101563 164.0417785644531 168.357666015625 164.3133544921875 168.6292419433594 C 164.5849456787109 168.9008483886719 164.5851135253906 169.3413543701172 164.3133544921875 169.6131286621094 L 157.7541198730469 176.17236328125 C 157.4823913574219 176.444091796875 157.0418395996094 176.4439697265625 156.7702484130859 176.17236328125 Z" fill="#ffc033" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u2sxsd =
    '<svg viewBox="16.4 7.2 7.7 7.7" ><path transform="translate(-145.06, -166.1)" d="M 162.4448699951172 180.8631134033203 L 169.0041198730469 174.3038635253906 C 169.27587890625 174.0321350097656 169.2757110595703 173.5915832519531 169.0041198730469 173.3200073242188 L 161.4609985351563 180.8631134033203 C 161.7325897216797 181.1347045898438 162.1731567382813 181.1348266601563 162.4448699951172 180.8631134033203 Z" fill="#f9a926" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_7s9mbq =
    '<svg viewBox="10.1 0.0 30.5 31.7" ><path  d="M 35.90679550170898 26.39920616149902 L 36.01411437988281 24.28063201904297 C 36.03363418579102 23.89980888366699 36.27776718139648 23.55820846557617 36.63895034790039 23.42151832580566 L 38.61599731445313 22.66489219665527 C 39.48001098632813 22.33785247802734 40.13904571533203 21.63977813720703 40.41726303100586 20.76591682434082 C 40.70526504516602 19.89211654663086 40.58325958251953 18.95003318786621 40.07559585571289 18.17872047424316 L 38.92351913452148 16.39214515686035 C 38.70869827270508 16.06993675231934 38.70875930786133 15.65986824035645 38.92351913452148 15.33772277832031 L 40.0804328918457 13.55592060089111 C 40.57836532592773 12.78466796875 40.70526123046875 11.8376293182373 40.42215728759766 10.95893383026123 C 40.13415145874023 10.08513355255127 39.48484039306641 9.3968505859375 38.61600112915039 9.06497859954834 L 36.63411712646484 8.303455352783203 C 36.27777099609375 8.171660423278809 36.03853225708008 7.834829807281494 36.01901245117188 7.454068183898926 L 35.9018440246582 5.335434913635254 C 35.90673828125 5.291441440582275 35.89701080322266 5.252467155456543 35.89211273193359 5.208472728729248 C 35.81887435913086 4.334673404693604 35.36487197875977 3.548736333847046 34.65707015991211 3.026513814926147 C 33.91017150878906 2.49437689781189 32.98270797729492 2.318711996078491 32.08449554443359 2.552993535995483 L 30.02937698364258 3.104586601257324 C 29.66330146789551 3.207073211669922 29.27274894714355 3.080235242843628 29.03357124328613 2.782379865646362 L 27.69604110717773 1.132433533668518 C 27.11519813537598 0.4149031639099121 26.25112724304199 0 25.33345603942871 0 C 24.41572570800781 0 23.55165481567383 0.4149031639099121 22.97570991516113 1.127599716186523 L 21.63334655761719 2.782441139221191 C 21.39416885375977 3.080172538757324 21.00361824035645 3.207072496414185 20.63754081726074 3.104647874832153 L 18.58242034912109 2.553054571151733 C 17.69393348693848 2.31877326965332 16.75674629211426 2.494499921798706 16.00984573364258 3.026574850082397 C 15.2629451751709 3.578168153762817 14.80900764465332 4.412931442260742 14.76507377624512 5.335495948791504 L 14.64790344238281 7.454067230224609 C 14.63811302185059 7.834891319274902 14.38914680480957 8.171596527099609 14.03279876708984 8.303454399108887 L 12.05085372924805 9.064977645874023 C 11.19174003601074 9.396910667419434 10.5327033996582 10.08519458770752 10.24469947814941 10.95899486541748 C 9.961591720581055 11.83769035339355 10.08849143981934 12.78460597991943 10.59125804901123 13.56081485748291 L 11.75306129455566 15.33772277832031 C 11.95809555053711 15.65993022918701 11.95809555053711 16.06999969482422 11.74822807312012 16.3969783782959 L 10.59132099151611 18.17878150939941 C 10.08855438232422 18.94513893127441 9.961593627929688 19.89223861694336 10.24959564208984 20.76597595214844 C 10.52787113189697 21.6397762298584 11.19174098968506 22.34274482727051 12.05085563659668 22.66495132446289 L 14.03763198852539 23.42158126831055 C 14.38908576965332 23.55826759338379 14.63321876525879 23.89999580383301 14.65273857116699 24.28069305419922 L 14.76018142700195 26.39932632446289 C 14.76018142700195 26.48712730407715 14.76997184753418 26.57498931884766 14.78453254699707 26.65802001953125 C 14.89687156677246 27.47326469421387 15.33612632751465 28.21526908874512 16.00978660583496 28.69368553161621 C 16.75668525695801 29.24527931213379 17.69876861572266 29.41610908508301 18.58719253540039 29.17203903198242 L 20.6325855255127 28.62044525146484 C 21.00362014770508 28.52285385131836 21.39410781860352 28.64969062805176 21.63817977905273 28.95237922668457 L 22.97570991516113 30.60232543945313 C 23.54682159423828 31.31985473632813 24.4108943939209 31.72502899169922 25.33835411071777 31.72502899169922 C 26.25608444213867 31.72502899169922 27.12009429931641 31.31985473632813 27.70099639892578 30.60232543945313 L 29.02873611450195 28.95237922668457 C 29.27286911010742 28.64975166320801 29.66335868835449 28.52278900146484 30.03433227539063 28.62044525146484 L 32.08945083618164 29.17203903198242 C 32.96814346313477 29.41617202758789 33.91022872924805 29.24527931213379 34.65713119506836 28.69362258911133 C 35.40402603149414 28.1613655090332 35.85796737670898 27.32666397094727 35.90679550170898 26.39920616149902 Z" fill="#e6563a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_swg8al =
    '<svg viewBox="14.8 5.5 25.8 26.2" ><path transform="translate(-70.97, -83.73)" d="M 105.6255950927734 112.421760559082 C 104.8787002563477 112.9733505249023 103.9366149902344 113.1441879272461 103.0579223632813 112.9001770019531 L 101.002799987793 112.3485794067383 C 100.6318283081055 112.2509918212891 100.2412719726563 112.3778305053711 99.99720764160156 112.6805191040039 L 98.66946411132813 114.3304595947266 C 98.08856201171875 115.0479888916016 97.2244873046875 115.4531707763672 96.30682373046875 115.4531707763672 C 95.37936401367188 115.4531707763672 94.51528930664063 115.0479888916016 93.94418334960938 114.3304595947266 L 92.60664367675781 112.6805191040039 C 92.36251831054688 112.3778915405273 91.97209167480469 112.2509307861328 91.60105895996094 112.3485794067383 L 89.5556640625 112.9001770019531 C 88.667236328125 113.1443099975586 87.72515106201172 112.9734191894531 86.97825622558594 112.4218292236328 C 86.30453491210938 111.9434051513672 85.86528015136719 111.2014083862305 85.75299835205078 110.3861618041992 L 106.8801574707031 89.25900268554688 L 106.9874801635742 91.18232727050781 C 107.0069961547852 91.56302642822266 107.2462387084961 91.89985656738281 107.6025848388672 92.03171539306641 L 109.5844650268555 92.79323577880859 C 110.4533081054688 93.12516784667969 111.1026153564453 93.81346130371094 111.3906173706055 94.68719482421875 C 111.6737289428711 95.56588745117188 111.5468215942383 96.51286315917969 111.0488891601563 97.2841796875 L 109.8919906616211 99.06597900390625 C 109.6772232055664 99.38819122314453 109.6771621704102 99.79826354980469 109.8919906616211 100.1204071044922 L 111.044059753418 101.906982421875 C 111.5517196655273 102.6782989501953 111.6737899780273 103.6204376220703 111.3857269287109 104.4941711425781 C 111.1075134277344 105.3680419921875 110.4484710693359 106.066047668457 109.5844650268555 106.3931503295898 L 107.6074142456055 107.1497802734375 C 107.2461700439453 107.2864685058594 107.0020980834961 107.6281967163086 106.9825820922852 108.0088958740234 L 106.8752670288086 110.1274642944336 C 106.8264389038086 111.0549240112305 106.3724975585938 111.8896255493164 105.6255950927734 112.421760559082 Z" fill="#d9472b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bv15po =
    '<svg viewBox="19.1 10.3 4.1 4.1" ><path transform="translate(-135.92, -155.71)" d="M 157.071044921875 170.14208984375 C 155.9290161132813 170.14208984375 155 169.2130889892578 155 168.071044921875 C 155 166.9290161132813 155.9290161132813 166 157.071044921875 166 C 158.2130889892578 166 159.14208984375 166.9290161132813 159.14208984375 168.071044921875 C 159.14208984375 169.2130889892578 158.2130889892578 170.14208984375 157.071044921875 170.14208984375 Z M 157.071044921875 168.0723571777344 L 157.0778045654297 168.0723571777344 L 157.071044921875 168.0723571777344 Z M 157.071044921875 168.0723571777344 L 157.0778045654297 168.0723571777344 L 157.071044921875 168.0723571777344 Z M 157.071044921875 168.0714874267578 L 157.0778045654297 168.0714263916016 L 157.071044921875 168.0714874267578 Z M 157.071044921875 168.0714874267578 L 157.0778045654297 168.0714263916016 L 157.071044921875 168.0714874267578 Z M 157.071044921875 168.0714874267578 L 157.071044921875 168.0714874267578 L 157.071044921875 168.0714874267578 Z M 157.071044921875 168.0714874267578 L 157.0778045654297 168.0714263916016 L 157.071044921875 168.0714874267578 Z M 157.071044921875 168.0714874267578 L 157.0778045654297 168.0714263916016 L 157.071044921875 168.0714874267578 Z M 157.071044921875 168.0714874267578 L 157.0778045654297 168.0714263916016 L 157.071044921875 168.0714874267578 Z" fill="#ffc033" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_1ht3p2 =
    '<svg viewBox="26.7 17.9 4.1 4.1" ><path transform="translate(-250.89, -270.68)" d="M 279.6260375976563 292.6970825195313 C 278.4840087890625 292.6970825195313 277.5549926757813 291.7680969238281 277.5549926757813 290.6260375976563 C 277.5549926757813 289.4840087890625 278.4840087890625 288.5549926757813 279.6260375976563 288.5549926757813 C 280.76806640625 288.5549926757813 281.6970825195313 289.4840087890625 281.6970825195313 290.6260375976563 C 281.6970825195313 291.7680969238281 280.76806640625 292.6970825195313 279.6260375976563 292.6970825195313 Z M 279.6260375976563 290.6273498535156 L 279.6328125 290.6273498535156 L 279.6260375976563 290.6273498535156 Z M 279.6260375976563 290.6273498535156 L 279.6328125 290.6273498535156 L 279.6260375976563 290.6273498535156 Z M 279.6260375976563 290.62646484375 L 279.6328125 290.6264038085938 L 279.6260375976563 290.62646484375 Z M 279.6260375976563 290.62646484375 L 279.6328125 290.6264038085938 L 279.6260375976563 290.62646484375 Z M 279.6260375976563 290.62646484375 L 279.6260375976563 290.62646484375 L 279.6260375976563 290.62646484375 Z M 279.6260375976563 290.62646484375 L 279.6328125 290.6264038085938 L 279.6260375976563 290.62646484375 Z M 279.6260375976563 290.62646484375 L 279.6328125 290.6264038085938 L 279.6260375976563 290.62646484375 Z M 279.6260375976563 290.62646484375 L 279.6328125 290.6264038085938 L 279.6260375976563 290.62646484375 Z" fill="#f9a926" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e0ax5a =
    '<svg viewBox="19.2 10.4 11.8 11.8" ><path transform="translate(-137.39, -157.99)" d="M 156.8697814941406 179.9561920166016 C 156.4655151367188 179.5519409179688 156.4652709960938 178.8962554931641 156.8697814941406 178.4917602539063 L 166.6327514648438 168.728759765625 C 167.0372619628906 168.3242797851563 167.6929473876953 168.3245239257813 168.0971832275391 168.728759765625 C 168.5014343261719 169.1330261230469 168.5016784667969 169.7886962890625 168.0971832275391 170.1932067871094 L 158.3341979980469 179.9561920166016 C 157.9297637939453 180.3606262207031 157.2740173339844 180.3604431152344 156.8697814941406 179.9561920166016 Z" fill="#ffc033" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iymsxz =
    '<svg viewBox="19.5 10.7 11.5 11.5" ><path transform="translate(-141.99, -162.58)" d="M 162.9254150390625 184.5474090576172 L 172.6884155273438 174.784423828125 C 173.0929107666016 174.3799438476563 173.0926666259766 173.7242431640625 172.6884155273438 173.3200073242188 L 161.4609985351563 184.5474090576172 C 161.865234375 184.95166015625 162.52099609375 184.9518432617188 162.9254150390625 184.5474090576172 Z" fill="#f9a926" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wj8au7 =
    '<svg viewBox="27.0 47.0 24.0 24.0" ><path transform="translate(21.0, 41.0)" d="M 30 16.5 L 11.74499988555908 16.5 L 20.13000106811523 8.114999771118164 L 18 6 L 6 18 L 18 30 L 20.11499977111816 27.88500022888184 L 11.74499988555908 19.5 L 30 19.5 L 30 16.5 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

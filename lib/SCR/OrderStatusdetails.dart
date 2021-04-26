import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import './home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatusdetails extends StatelessWidget {
  OrderStatusdetails({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-219.8, -519.9, 682.0, 906.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child: Transform.rotate(
              angle: 0.0175,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  color: const Color(0xff2c4b89),
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-1.0, 143.0, 376.0, 682.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xfffaf8ff),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-112.0, -258.0, 631.0, 495.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'header' (group)
                Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(112.0, 254.0, 375.0, 172.0),
                  size: Size(631.0, 495.0),
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff2c4b89),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 84.0, 417.0, 411.0),
                  size: Size(631.0, 495.0),
                  pinLeft: true,
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0x12ffffff),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(291.0, 0.0, 340.0, 331.0),
                  size: Size(631.0, 495.0),
                  pinRight: true,
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0x26ffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(31.0, 91.0, 182.0, 31.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Request Details',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                color: const Color(0xffffffff),
                letterSpacing: 0.88,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(27.0, 47.0, 24.0, 24.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Icon material-arrow…' (shape)
                PageLink(
              links: [
                PageLinkInfo(),
              ],
              child: SvgPicture.string(
                _svg_wj8au7,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(0.0, 330.0, 375.0, 352.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 120.0),
                  size: Size(375.0, 352.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfffcfcfc),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffd8dbe9)),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(15.0, 9.0, 90.0, 86.0),
                  size: Size(375.0, 352.0),
                  pinLeft: true,
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'heart-disease-sugar…' (shape)
                      Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: const AssetImage('assets/images/sugar.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(136.0, 11.0, 109.0, 19.0),
                  size: Size(375.0, 352.0),
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Fine Grain Sugar',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(229.0, 59.0, 9.0, 23.0),
                  size: Size(375.0, 352.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(136.0, 35.0, 102.0, 19.0),
                  size: Size(375.0, 352.0),
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
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
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(137.0, 59.0, 74.0, 19.0),
                  size: Size(375.0, 352.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'No of items',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 112.0, 375.0, 120.0),
                  size: Size(375.0, 352.0),
                  pinLeft: true,
                  pinRight: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfffcfcfc),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffd8dbe9)),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(15.0, 129.0, 90.0, 86.0),
                  size: Size(375.0, 352.0),
                  pinLeft: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: '636685546802336427-…' (shape)
                      Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(133.0, 131.0, 127.0, 19.0),
                  size: Size(375.0, 352.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Safi  - corn oil 1 liter',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(229.0, 177.0, 13.0, 23.0),
                  size: Size(375.0, 352.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    '3 ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(133.0, 155.0, 102.0, 19.0),
                  size: Size(375.0, 352.0),
                  fixedWidth: true,
                  fixedHeight: true,
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
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(107.0, 314.0, 18.0, 15.0),
                  size: Size(375.0, 352.0),
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'ic_like' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 18.0, 15.0),
                        size: Size(18.0, 15.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 18.0, 15.0),
                              size: Size(18.0, 15.0),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              pinBottom: true,
                              child: SvgPicture.string(
                                _svg_qzi6ls,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 232.0, 375.0, 120.0),
                  size: Size(375.0, 352.0),
                  pinLeft: true,
                  pinRight: true,
                  pinBottom: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfffcfcfc),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffd8dbe9)),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(15.0, 249.0, 90.0, 86.0),
                  size: Size(375.0, 352.0),
                  pinLeft: true,
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'Rice' (shape)
                      Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: const AssetImage('assets/images/rice.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(136.0, 251.0, 74.0, 19.0),
                  size: Size(375.0, 352.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Dawat Rice',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(228.0, 299.0, 6.0, 23.0),
                  size: Size(375.0, 352.0),
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(136.0, 275.0, 103.0, 19.0),
                  size: Size(375.0, 352.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Price - 40.00 JD',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(136.0, 299.0, 74.0, 19.0),
                  size: Size(375.0, 352.0),
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'No of items',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(10.0, 122.0, 96.0, 96.0),
                  size: Size(375.0, 352.0),
                  pinLeft: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      image: DecorationImage(
                        image: const AssetImage('assets/images/oil.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(133.0, 179.0, 74.0, 19.0),
                  size: Size(375.0, 352.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'No of items',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xff191919),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(19.0, 693.0, 338.0, 90.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            pinBottom: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Login Input' (group)
                Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 26.0, 338.0, 64.0),
                  size: Size(338.0, 90.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child:
                      // Adobe XD layer: 'Input' (shape)
                      Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffebebeb)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x0d000000),
                          offset: Offset(0, 6),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(16.0, 43.0, 59.0, 19.0),
                  size: Size(338.0, 90.0),
                  pinLeft: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Add note',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: const Color(0xffacacac),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 68.0, 21.0),
                  size: Size(338.0, 90.0),
                  pinLeft: true,
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Text(
                    'Add note',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-12.0, 196.0, 387.0, 120.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 387.0, 120.0),
                  size: Size(387.0, 120.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(31.0, 47.0, 158.0, 24.0),
                  size: Size(387.0, 120.0),
                  pinLeft: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 158.0, 24.0),
                        size: Size(158.0, 24.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 121.0, 24.0),
                              size: Size(158.0, 24.0),
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Sandwich Classic' (text)
                                  Text(
                                'Order Number',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: const Color(0xff222b45),
                                  height: 0.9411764705882353,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(133.0, 0.0, 25.0, 24.0),
                              size: Size(158.0, 24.0),
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Sandwich Classic' (text)
                                  Text(
                                '123',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: const Color(0x70000000),
                                  height: 0.9411764705882353,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(31.0, 15.0, 180.0, 24.0),
                  size: Size(387.0, 120.0),
                  pinLeft: true,
                  pinTop: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 140.0, 24.0),
                        size: Size(180.0, 24.0),
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'Sandwich Classic' (text)
                            Text(
                          'Customer Name',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            color: const Color(0xff222b45),
                            height: 0.9411764705882353,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(133.0, 0.0, 47.0, 24.0),
                        size: Size(180.0, 24.0),
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'Sandwich Classic' (text)
                            Text(
                          'Soudi',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            color: const Color(0x70000000),
                            height: 0.9411764705882353,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(31.0, 78.0, 223.0, 24.0),
                  size: Size(387.0, 120.0),
                  pinLeft: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(133.0, 0.0, 90.0, 24.0),
                        size: Size(223.0, 24.0),
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'Sandwich Classic' (text)
                            Text(
                          'Main Store',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            color: const Color(0x70000000),
                            height: 0.9411764705882353,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 92.0, 24.0),
                        size: Size(223.0, 24.0),
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'Sandwich Classic' (text)
                            Text(
                          'From Store',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            color: const Color(0xff222b45),
                            height: 0.9411764705882353,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(150.5, -393.5, 0.0, 0.0),
            size: Size(375.0, 812.0),
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Stack(
              children: <Widget>[],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(22.0, 162.9, 24.0, 24.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'cancel (1)' (group)
                Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 24.0, 24.0),
                  size: Size(24.0, 24.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xffe24c4b),
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(2.6, 2.6, 21.4, 21.4),
                  size: Size(24.0, 24.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child: SvgPicture.string(
                    _svg_2iryg8,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(6.2, 6.2, 11.6, 11.6),
                  size: Size(24.0, 24.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child: SvgPicture.string(
                    _svg_n33ok7,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(56.0, 164.0, 66.0, 23.0),
            size: Size(375.0, 812.0),
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Sandwich Classic' (text)
                Text(
              'Rejected',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 17,
                color: const Color(0xffec0d4a),
                height: 0.9411764705882353,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(328.9, 80.9, 27.1, 27.1),
            size: Size(375.0, 812.0),
            pinRight: true,
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'home' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Home(),
                ),
              ],
              child: SvgPicture.string(
                _svg_5p2c1k,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_qzi6ls =
    '<svg viewBox="0.0 0.0 18.0 15.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="1" stdDeviation="6"/></filter></defs><path  d="M 15.3643045425415 0.633370578289032 C 14.63902378082275 0.2349601536989212 13.80130672454834 0 12.91254997253418 0 C 11.33936977386475 0 9.929612159729004 0.7150958180427551 8.999987602233887 1.838822484016418 C 8.060142517089844 0.7150958180427551 6.650386810302734 0 5.0771803855896 0 C 4.188411235809326 0 3.350731611251831 0.2349601536989212 2.625425577163696 0.633370578289032 C 1.062427043914795 1.501701593399048 0 3.166853427886963 0 5.087387561798096 C 0 5.639036178588867 0.09194087237119675 6.160035133361816 0.2553908228874207 6.650386810302734 C 0.8887614607810974 9.510766983032227 5.261058807373047 12.92278480529785 7.580011367797852 14.55728530883789 C 8.438132286071777 15.1600227355957 9.572063446044922 15.1600227355957 10.43017196655273 14.55728530883789 C 12.73896789550781 12.92278480529785 17.11124610900879 9.520986557006836 17.74455451965332 6.650386810302734 C 17.90803146362305 6.160035133361816 18 5.628828048706055 18 5.087387561798096 C 17.98976707458496 3.166853427886963 16.92730331420898 1.501701593399048 15.3643045425415 0.633370578289032 Z" fill="#27c96d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_wj8au7 =
    '<svg viewBox="27.0 47.0 24.0 24.0" ><path transform="translate(21.0, 41.0)" d="M 30 16.5 L 11.74499988555908 16.5 L 20.13000106811523 8.114999771118164 L 18 6 L 6 18 L 18 30 L 20.11499977111816 27.88500022888184 L 11.74499988555908 19.5 L 30 19.5 L 30 16.5 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2iryg8 =
    '<svg viewBox="2.6 2.6 21.4 21.4" ><path transform="translate(-47.15, -47.15)" d="M 71.15198516845703 59.15394973754883 C 71.15198516845703 65.75395965576172 65.75199890136719 71.15394592285156 59.15198516845703 71.15394592285156 C 55.32701110839844 71.15394592285156 51.95201873779297 69.428955078125 49.77699279785156 66.65397644042969 C 51.80198669433594 68.30397796630859 54.42699432373047 69.27898406982422 57.27696228027344 69.27898406982422 C 63.87697601318359 69.27898406982422 69.27696990966797 63.87899017333984 69.27696990966797 57.27898406982422 C 69.27696990966797 54.42901229858398 68.30196380615234 51.80400466918945 66.65196228027344 49.77900695800781 C 69.42699432373047 51.95392990112305 71.15198516845703 55.32892227172852 71.15198516845703 59.15394973754883 Z" fill="#d1403f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n33ok7 =
    '<svg viewBox="6.2 6.2 11.6 11.6" ><path transform="translate(-111.15, -111.15)" d="M 128.6217041015625 128.6217041015625 C 128.1717224121094 129.0716857910156 127.4216766357422 129.0716857910156 126.9716949462891 128.6217041015625 L 123.146728515625 124.7967224121094 L 119.3217468261719 128.6217041015625 C 118.8717651367188 129.0716857910156 118.1217346191406 129.0716857910156 117.6717529296875 128.6217041015625 C 117.2217712402344 128.1717224121094 117.2217712402344 127.4216766357422 117.6717529296875 126.9716949462891 L 121.4967193603516 123.146728515625 L 117.6717529296875 119.3217468261719 C 117.2217712402344 118.8717651367188 117.2217712402344 118.1217346191406 117.6717529296875 117.6717529296875 C 118.1217346191406 117.2217712402344 118.8717651367188 117.2217712402344 119.3217468261719 117.6717529296875 L 123.146728515625 121.4967193603516 L 126.9716949462891 117.6717529296875 C 127.4216766357422 117.2217712402344 128.1717224121094 117.2217712402344 128.6217041015625 117.6717529296875 C 129.0716857910156 118.1217346191406 129.0716857910156 118.8717651367188 128.6217041015625 119.3217468261719 L 124.7967224121094 123.146728515625 L 128.6217041015625 126.9716949462891 C 129.0716857910156 127.4216766357422 129.0716857910156 128.1716613769531 128.6217041015625 128.6217041015625 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_5p2c1k =
    '<svg viewBox="328.9 80.9 27.1 27.1" ><path transform="translate(328.36, 80.86)" d="M 26.91234016418457 11.80575466156006 C 26.9115104675293 11.80513191223145 26.910888671875 11.80430507659912 26.91026878356934 11.80368232727051 L 15.83762741088867 0.731412947177887 C 15.36566066741943 0.2592398226261139 14.73816585540771 -0.0006628036499023438 14.07070732116699 -0.0006628036499023438 C 13.40324687957764 -0.0006628036499023438 12.77575206756592 0.2592392861843109 12.30358028411865 0.731412947177887 L 1.236717939376831 11.79806327819824 C 1.232990384101868 11.80179119110107 1.229055523872375 11.80572509765625 1.225534915924072 11.80945301055908 C 0.2563349902629852 12.78424072265625 0.2579943537712097 14.36581707000732 1.230298042297363 15.33811855316162 C 1.674513816833496 15.78254127502441 2.261001825332642 16.03975296020508 2.888286352157593 16.06687927246094 C 2.913965940475464 16.06936645507813 2.939645528793335 16.07060813903809 2.965532064437866 16.07060813903809 L 3.406641006469727 16.07060813903809 L 3.406641006469727 24.21888732910156 C 3.406641006469727 25.83152770996094 4.718784809112549 27.14346694946289 6.331422328948975 27.14346694946289 L 10.66340160369873 27.14346694946289 C 11.10264682769775 27.14346694946289 11.45864009857178 26.78726577758789 11.45864009857178 26.34822463989258 L 11.45864009857178 19.95980644226074 C 11.45864009857178 19.2240047454834 12.05734920501709 18.62550354003906 12.79315185546875 18.62550354003906 L 15.34827136993408 18.62550354003906 C 16.08407402038574 18.62550354003906 16.68257713317871 19.2240047454834 16.68257713317871 19.95980644226074 L 16.68257713317871 26.34822463989258 C 16.68257713317871 26.78726577758789 17.03857040405273 27.14346694946289 17.47781562805176 27.14346694946289 L 21.80979347229004 27.14346694946289 C 23.42263984680176 27.14346694946289 24.73457717895508 25.83152770996094 24.73457717895508 24.21888732910156 L 24.73457717895508 16.07060813903809 L 25.14379501342773 16.07060813903809 C 25.81104850769043 16.07060813903809 26.43854331970215 15.81070613861084 26.91092109680176 15.33832550048828 C 27.8842601776123 14.36457347869873 27.88467407226563 12.78010177612305 26.9123706817627 11.80572700500488 Z M 25.78616333007813 14.21383857727051 C 25.6144847869873 14.38551807403564 25.38626670837402 14.4801607131958 25.14376258850098 14.4801607131958 L 23.93930435180664 14.4801607131958 C 23.50005722045898 14.4801607131958 23.14406585693359 14.83615398406982 23.14406585693359 15.27539920806885 L 23.14406585693359 24.21891975402832 C 23.14406585693359 24.95451354980469 22.54556274414063 25.55301475524902 21.80976104736328 25.55301475524902 L 18.27301979064941 25.55301475524902 L 18.27301979064941 19.95983505249023 C 18.27301979064941 18.34719848632813 16.96108245849609 17.03505516052246 15.34823513031006 17.03505516052246 L 12.79311752319336 17.03505516052246 C 11.18027210235596 17.03505516052246 9.868127822875977 18.34719848632813 9.868127822875977 19.95983505249023 L 9.868127822875977 25.55301475524902 L 6.331387996673584 25.55301475524902 C 5.595791339874268 25.55301475524902 4.997082710266113 24.95451354980469 4.997082710266113 24.21891975402832 L 4.997082710266113 15.27539920806885 C 4.997082710266113 14.83615398406982 4.64108943939209 14.4801607131958 4.201844215393066 14.4801607131958 L 3.018099546432495 14.4801607131958 C 3.005673885345459 14.47933101654053 2.993455171585083 14.47871017456055 2.980822563171387 14.47850322723389 C 2.743907690048218 14.47436237335205 2.521696329116821 14.38034057617188 2.3551926612854 14.21363067626953 C 2.001062631607056 13.85950088500977 2.001062631607056 13.28316020965576 2.3551926612854 12.9288215637207 C 2.355399608612061 12.9288215637207 2.355399608612061 12.92861461639404 2.355606555938721 12.92840671539307 L 2.356228113174438 12.9277868270874 L 13.42849826812744 1.855940818786621 C 13.59997177124023 1.684260487556458 13.82798099517822 1.589825868606567 14.07069492340088 1.589825868606567 C 14.31320190429688 1.589825868606567 14.54121208190918 1.684260487556458 14.71289443969727 1.855940818786621 L 25.78267288208008 12.92550659179688 C 25.78433036804199 12.92716407775879 25.78619384765625 12.92881965637207 25.78784942626953 12.93047714233398 C 26.14011573791504 13.28522777557373 26.13949394226074 13.86032772064209 25.78619384765625 14.21383380889893 Z M 25.78616333007813 14.21383857727051" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

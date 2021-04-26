import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

// import './catalog.dart';
import 'package:adobe_xd/page_link.dart';

// import './timeline.dart';

// import './reprint.dart';
// import './allcustomer.dart';
// import './Reports.dart';
// import './PromotionList.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'OrderStatus.dart';
import 'all _customer.dart';

class Home extends StatelessWidget {
  Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2c4b89),
      body: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-482.6, -567.8, 1001.6, 917.8),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'bk' (group)
                Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(7.9, 5.9, 682.0, 906.0),
                  size: Size(1001.6, 917.8),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
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
                  bounds: Rect.fromLTWH(370.6, 393.8, 417.0, 411.0),
                  size: Size(1001.6, 917.8),
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
                  bounds: Rect.fromLTWH(661.6, 309.8, 340.0, 331.0),
                  size: Size(1001.6, 917.8),
                  pinRight: true,
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
            bounds: Rect.fromLTWH(-1.0, 162.0, 375.0, 650.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            pinBottom: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(21.0),
                  topRight: Radius.circular(21.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [const Color(0xffffffff), const Color(0xffebebeb)],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(18.0, 202.0, 340.0, 535.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            pinBottom: true,
            fixedHeight: true,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(236.0, 131.0, 103.0, 120.0),
                  size: Size(340.0, 535.0),
                  pinRight: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'catalog' (group)
                      PageLink(
                    links: [
                      PageLinkInfo(
                        transition: LinkTransition.Fade,
                        ease: Curves.easeOut,
                        duration: 0.3,
                    //     pageBuilder: () => CartEditProduct(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 103.0, 120.0),
                          size: Size(103.0, 120.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(24.0, 84.0, 56.0, 20.0),
                          size: Size(103.0, 120.0),
                          pinBottom: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Catalog',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: const Color(0xff88d9d1),
                              letterSpacing: -0.168,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(32.0, 23.8, 40.0, 36.7),
                          size: Size(103.0, 120.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'image-gallery (1)' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 11.8, 35.1, 24.9),
                                size: Size(40.0, 36.7),
                                pinLeft: true,
                                pinRight: true,
                                pinBottom: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 35.1, 24.9),
                                      size: Size(35.1, 24.9),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: SvgPicture.string(
                                        _svg_jg91bb,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(5.2, 0.0, 34.8, 27.8),
                                size: Size(40.0, 36.7),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 34.8, 27.8),
                                      size: Size(34.8, 27.8),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: SvgPicture.string(
                                        _svg_eeolfq,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(11.6, 5.2, 7.0, 7.0),
                                size: Size(40.0, 36.7),
                                pinTop: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds: Rect.fromLTWH(0.0, 0.0, 7.0, 7.0),
                                      size: Size(7.0, 7.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: SvgPicture.string(
                                        _svg_v1u4ry,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(5.3, 8.9, 34.7, 16.3),
                                size: Size(40.0, 36.7),
                                pinLeft: true,
                                pinRight: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 34.7, 16.3),
                                      size: Size(34.7, 16.3),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: SvgPicture.string(
                                        _svg_omxnv3,
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
                      ],
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(120.0, 131.0, 103.0, 120.0),
                  size: Size(340.0, 535.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'timeline' (group)
                      PageLink(
                    links: [
                      PageLinkInfo(
                        transition: LinkTransition.Fade,
                        ease: Curves.easeOut,
                        duration: 0.3,
                        // pageBuilder: () => timeline(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 103.0, 120.0),
                          size: Size(103.0, 120.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: SvgPicture.string(
                            _svg_97xnef,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(26.0, 83.0, 57.0, 20.0),
                          size: Size(103.0, 120.0),
                          pinBottom: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Timeline',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: const Color(0xfff6818b),
                              letterSpacing: -0.168,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(32.0, 21.0, 40.0, 37.9),
                          size: Size(103.0, 120.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'increasing-stocks-g…' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 37.9),
                                size: Size(40.0, 37.9),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 40.0, 37.9),
                                      size: Size(40.0, 37.9),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: SvgPicture.string(
                                        _svg_8lebwx,
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
                      ],
                    ),
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(2.0, 131.0, 103.0, 120.0),
                  size: Size(340.0, 535.0),
                  pinLeft: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'slales order' (group)
                      PageLink(
                    links: [
                      PageLinkInfo(
                        transition: LinkTransition.Fade,
                        ease: Curves.easeOut,
                        duration: 0.3,
                        pageBuilder: () => OrderStatus(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 103.0, 120.0),
                          size: Size(103.0, 120.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: SvgPicture.string(
                            _svg_v5v8mf,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(5.0, 83.0, 93.0, 20.0),
                          size: Size(103.0, 120.0),
                          pinLeft: true,
                          pinRight: true,
                          pinBottom: true,
                          fixedHeight: true,
                          child: Text(
                            'Orders Status',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: const Color(0xfffcb284),
                              letterSpacing: -0.168,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(32.0, 18.4, 40.0, 37.0),
                          size: Size(103.0, 120.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'box' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(7.7, 4.1, 23.6, 11.5),
                                size: Size(40.0, 37.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_nk74ue,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 12.1, 13.6, 23.5),
                                size: Size(40.0, 37.0),
                                pinLeft: true,
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_9hmmra,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(28.3, 27.2, 1.5, 1.5),
                                size: Size(40.0, 37.0),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xfffcb284),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(17.0, 12.1, 13.5, 23.5),
                                size: Size(40.0, 37.0),
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_cul3fs,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(31.0, 15.5, 4.8, 1.6),
                                size: Size(40.0, 37.0),
                                pinRight: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.16),
                                    color: const Color(0xfffcb284),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.5, 0.0, 19.6, 11.3),
                                size: Size(40.0, 37.0),
                                pinLeft: true,
                                pinTop: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_1d3jm8,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(26.8, 18.8, 13.2, 18.3),
                                size: Size(40.0, 37.0),
                                pinRight: true,
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: SvgPicture.string(
                                  _svg_hpbnir,
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
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 415.0, 103.0, 120.0),
                  size: Size(340.0, 535.0),
                  pinLeft: true,
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'reprint' (group)
                      PageLink(
                    links: [
                      PageLinkInfo(
                        transition: LinkTransition.Fade,
                        ease: Curves.easeOut,
                        duration: 0.3,
                        // pageBuilder: () => reprint(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 103.0, 120.0),
                          size: Size(103.0, 120.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.0),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(28.0, 86.0, 48.0, 20.0),
                          size: Size(103.0, 120.0),
                          pinBottom: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Reprint',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: const Color(0xffaec5e1),
                              letterSpacing: -0.168,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(32.0, 27.0, 46.0, 40.0),
                          size: Size(103.0, 120.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'reprint' (group)
                              Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                                size: Size(46.0, 40.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                                      size: Size(40.0, 40.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 40.0, 40.0),
                                            size: Size(40.0, 40.0),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child: SvgPicture.string(
                                              _svg_vgzs7,
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
                                bounds: Rect.fromLTWH(15.3, 29.1, 13.0, 2.0),
                                size: Size(46.0, 40.0),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 13.0, 2.0),
                                      size: Size(13.0, 2.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 13.0, 2.0),
                                            size: Size(13.0, 2.0),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xffaec5e1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(12.0, 33.0, 16.0, 1.0),
                                size: Size(46.0, 40.0),
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 16.0, 1.0),
                                      size: Size(16.0, 1.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 16.0, 1.0),
                                            size: Size(16.0, 1.0),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xffaec5e1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(11.7, 35.0, 13.0, 1.0),
                                size: Size(46.0, 40.0),
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 13.0, 1.0),
                                      size: Size(13.0, 1.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 13.0, 1.0),
                                            size: Size(13.0, 1.0),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xffaec5e1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(11.2, 29.1, 2.0, 2.0),
                                size: Size(46.0, 40.0),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds: Rect.fromLTWH(0.0, 0.0, 2.0, 2.0),
                                      size: Size(2.0, 2.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 2.0, 2.0),
                                            size: Size(2.0, 2.0),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xffaec5e1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(2.4, 16.2, 6.0, 3.6),
                                size: Size(46.0, 40.0),
                                pinLeft: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds: Rect.fromLTWH(0.0, 0.0, 6.0, 3.6),
                                      size: Size(6.0, 3.6),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 6.0, 3.6),
                                            size: Size(6.0, 3.6),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child: SvgPicture.string(
                                              _svg_yy0p9k,
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
                                bounds: Rect.fromLTWH(11.3, 18.9, 6.0, 1.0),
                                size: Size(46.0, 40.0),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds: Rect.fromLTWH(0.0, 0.0, 6.0, 1.0),
                                      size: Size(6.0, 1.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 6.0, 1.0),
                                            size: Size(6.0, 1.0),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xffaec5e1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(18.9, 18.9, 1.0, 1.0),
                                size: Size(46.0, 40.0),
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds: Rect.fromLTWH(0.0, 0.0, 1.0, 1.0),
                                      size: Size(1.0, 1.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 1.0, 1.0),
                                            size: Size(1.0, 1.0),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xffaec5e1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(31.0, 21.4, 14.0, 14.0),
                                size: Size(46.0, 40.0),
                                pinRight: true,
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(30.0, 22.3, 16.0, 13.7),
                                size: Size(46.0, 40.0),
                                pinRight: true,
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child:
                                    // Adobe XD layer: 'Icon material-setti…' (shape)
                                    SvgPicture.string(
                                  _svg_g0zdls,
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
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(124.0, 415.0, 214.0, 120.0),
                  size: Size(340.0, 535.0),
                  pinRight: true,
                  pinBottom: true,
                  fixedWidth: true,
                  fixedHeight: true,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 214.0, 120.0),
                        size: Size(214.0, 120.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: SvgPicture.string(
                          _svg_imyqqe,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(50.0, 43.0, 57.0, 25.0),
                        size: Size(214.0, 120.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child: Text(
                          'logout',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: const Color(0xffffffff),
                            letterSpacing: -0.216,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(145.5, 36.0, 40.0, 40.0),
                        size: Size(214.0, 120.0),
                        pinRight: true,
                        fixedWidth: true,
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'log-out' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 27.8, 40.0),
                              size: Size(40.0, 40.0),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              pinBottom: true,
                              child: SvgPicture.string(
                                _svg_ol2qm1,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(20.9, 8.1, 19.1, 17.4),
                              size: Size(40.0, 40.0),
                              pinRight: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child: SvgPicture.string(
                                _svg_gpq4qc,
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
                  bounds: Rect.fromLTWH(0.0, 0.0, 336.0, 72.0),
                  size: Size(340.0, 535.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  fixedHeight: true,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 336.0, 72.0),
                        size: Size(336.0, 72.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child: PageLink(
                          links: [
                            PageLinkInfo(
                              transition: LinkTransition.Fade,
                              ease: Curves.easeOut,
                              duration: 0.3,
                              pageBuilder: () => All_Customer(),
                            ),
                          ],
                          child: SvgPicture.string(
                            _svg_x64aa7,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(83.0, 24.0, 140.0, 25.0),
                        size: Size(336.0, 72.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child: Text(
                          'Start of Journey',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: const Color(0xffffffff),
                            letterSpacing: -0.216,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(268.3, 22.0, 40.0, 28.8),
                        size: Size(336.0, 72.0),
                        pinRight: true,
                        fixedWidth: true,
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'van' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(29.2, 22.5, 4.0, 4.0),
                              size: Size(40.0, 28.8),
                              pinBottom: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child: SvgPicture.string(
                                _svg_lbww5r,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 28.8),
                              size: Size(40.0, 28.8),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              pinBottom: true,
                              child: SvgPicture.string(
                                _svg_r7yvs0,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(8.1, 22.5, 4.0, 4.0),
                              size: Size(40.0, 28.8),
                              pinBottom: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child: SvgPicture.string(
                                _svg_vcgexu,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(4.6, 12.1, 13.8, 1.1),
                              size: Size(40.0, 28.8),
                              pinLeft: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child: SvgPicture.string(
                                _svg_d2gfqh,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(4.6, 16.0, 13.8, 1.1),
                              size: Size(40.0, 28.8),
                              pinLeft: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child: SvgPicture.string(
                                _svg_jkb73q,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(4.6, 8.1, 13.8, 1.1),
                              size: Size(40.0, 28.8),
                              pinLeft: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child: SvgPicture.string(
                                _svg_wyotk2,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(4.6, 3.6, 13.8, 1.1),
                              size: Size(40.0, 28.8),
                              pinLeft: true,
                              pinTop: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child: SvgPicture.string(
                                _svg_epbm5y,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(26.3, 8.8, 5.2, 4.3),
                              size: Size(40.0, 28.8),
                              fixedWidth: true,
                              fixedHeight: true,
                              child: SvgPicture.string(
                                _svg_r2snzx,
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
                  bounds: Rect.fromLTWH(1.0, 273.0, 339.0, 120.0),
                  size: Size(340.0, 535.0),
                  pinLeft: true,
                  pinRight: true,
                  fixedHeight: true,
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(236.0, 0.0, 103.0, 120.0),
                        size: Size(339.0, 120.0),
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        fixedWidth: true,
                        child:
                            // Adobe XD layer: 'printers' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 103.0, 120.0),
                              size: Size(103.0, 120.0),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              pinBottom: true,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11.0),
                                  color: const Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(26.0, 90.0, 51.0, 20.0),
                              size: Size(103.0, 120.0),
                              pinBottom: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child: Text(
                                'Printers',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: const Color(0xfffcb284),
                                  letterSpacing: -0.168,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(32.0, 18.0, 40.0, 40.0),
                              size: Size(103.0, 120.0),
                              fixedWidth: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'printer (1)' (group)
                                  Stack(
                                children: <Widget>[
                                  Pinned.fromSize(
                                    bounds: Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                                    size: Size(40.0, 40.0),
                                    pinLeft: true,
                                    pinRight: true,
                                    pinTop: true,
                                    pinBottom: true,
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromSize(
                                          bounds: Rect.fromLTWH(
                                              0.0, 0.0, 40.0, 40.0),
                                          size: Size(40.0, 40.0),
                                          pinLeft: true,
                                          pinRight: true,
                                          pinTop: true,
                                          pinBottom: true,
                                          child: Stack(
                                            children: <Widget>[
                                              Pinned.fromSize(
                                                bounds: Rect.fromLTWH(
                                                    0.0, 0.0, 40.0, 40.0),
                                                size: Size(40.0, 40.0),
                                                pinLeft: true,
                                                pinRight: true,
                                                pinTop: true,
                                                pinBottom: true,
                                                child: SvgPicture.string(
                                                  _svg_3md7im,
                                                  allowDrawingOutsideViewBox:
                                                      true,
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
                                    bounds:
                                        Rect.fromLTWH(15.3, 29.1, 13.0, 2.0),
                                    size: Size(40.0, 40.0),
                                    fixedWidth: true,
                                    fixedHeight: true,
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromSize(
                                          bounds: Rect.fromLTWH(
                                              0.0, 0.0, 13.0, 2.0),
                                          size: Size(13.0, 2.0),
                                          pinLeft: true,
                                          pinRight: true,
                                          pinTop: true,
                                          pinBottom: true,
                                          child: Stack(
                                            children: <Widget>[
                                              Pinned.fromSize(
                                                bounds: Rect.fromLTWH(
                                                    0.0, 0.0, 13.0, 2.0),
                                                size: Size(13.0, 2.0),
                                                pinLeft: true,
                                                pinRight: true,
                                                pinTop: true,
                                                pinBottom: true,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfffcb284),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromSize(
                                    bounds:
                                        Rect.fromLTWH(12.0, 33.0, 16.0, 1.0),
                                    size: Size(40.0, 40.0),
                                    pinBottom: true,
                                    fixedWidth: true,
                                    fixedHeight: true,
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromSize(
                                          bounds: Rect.fromLTWH(
                                              0.0, 0.0, 16.0, 1.0),
                                          size: Size(16.0, 1.0),
                                          pinLeft: true,
                                          pinRight: true,
                                          pinTop: true,
                                          pinBottom: true,
                                          child: Stack(
                                            children: <Widget>[
                                              Pinned.fromSize(
                                                bounds: Rect.fromLTWH(
                                                    0.0, 0.0, 16.0, 1.0),
                                                size: Size(16.0, 1.0),
                                                pinLeft: true,
                                                pinRight: true,
                                                pinTop: true,
                                                pinBottom: true,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfffcb284),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromSize(
                                    bounds:
                                        Rect.fromLTWH(11.7, 35.0, 13.0, 1.0),
                                    size: Size(40.0, 40.0),
                                    pinBottom: true,
                                    fixedWidth: true,
                                    fixedHeight: true,
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromSize(
                                          bounds: Rect.fromLTWH(
                                              0.0, 0.0, 13.0, 1.0),
                                          size: Size(13.0, 1.0),
                                          pinLeft: true,
                                          pinRight: true,
                                          pinTop: true,
                                          pinBottom: true,
                                          child: Stack(
                                            children: <Widget>[
                                              Pinned.fromSize(
                                                bounds: Rect.fromLTWH(
                                                    0.0, 0.0, 13.0, 1.0),
                                                size: Size(13.0, 1.0),
                                                pinLeft: true,
                                                pinRight: true,
                                                pinTop: true,
                                                pinBottom: true,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfffcb284),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromSize(
                                    bounds: Rect.fromLTWH(11.2, 29.1, 2.0, 2.0),
                                    size: Size(40.0, 40.0),
                                    fixedWidth: true,
                                    fixedHeight: true,
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromSize(
                                          bounds:
                                              Rect.fromLTWH(0.0, 0.0, 2.0, 2.0),
                                          size: Size(2.0, 2.0),
                                          pinLeft: true,
                                          pinRight: true,
                                          pinTop: true,
                                          pinBottom: true,
                                          child: Stack(
                                            children: <Widget>[
                                              Pinned.fromSize(
                                                bounds: Rect.fromLTWH(
                                                    0.0, 0.0, 2.0, 2.0),
                                                size: Size(2.0, 2.0),
                                                pinLeft: true,
                                                pinRight: true,
                                                pinTop: true,
                                                pinBottom: true,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfffcb284),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromSize(
                                    bounds: Rect.fromLTWH(2.4, 16.2, 6.0, 3.6),
                                    size: Size(40.0, 40.0),
                                    pinLeft: true,
                                    fixedWidth: true,
                                    fixedHeight: true,
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromSize(
                                          bounds:
                                              Rect.fromLTWH(0.0, 0.0, 6.0, 3.6),
                                          size: Size(6.0, 3.6),
                                          pinLeft: true,
                                          pinRight: true,
                                          pinTop: true,
                                          pinBottom: true,
                                          child: Stack(
                                            children: <Widget>[
                                              Pinned.fromSize(
                                                bounds: Rect.fromLTWH(
                                                    0.0, 0.0, 6.0, 3.6),
                                                size: Size(6.0, 3.6),
                                                pinLeft: true,
                                                pinRight: true,
                                                pinTop: true,
                                                pinBottom: true,
                                                child: SvgPicture.string(
                                                  _svg_xc74z5,
                                                  allowDrawingOutsideViewBox:
                                                      true,
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
                                    bounds: Rect.fromLTWH(11.3, 18.9, 6.0, 1.0),
                                    size: Size(40.0, 40.0),
                                    fixedWidth: true,
                                    fixedHeight: true,
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromSize(
                                          bounds:
                                              Rect.fromLTWH(0.0, 0.0, 6.0, 1.0),
                                          size: Size(6.0, 1.0),
                                          pinLeft: true,
                                          pinRight: true,
                                          pinTop: true,
                                          pinBottom: true,
                                          child: Stack(
                                            children: <Widget>[
                                              Pinned.fromSize(
                                                bounds: Rect.fromLTWH(
                                                    0.0, 0.0, 6.0, 1.0),
                                                size: Size(6.0, 1.0),
                                                pinLeft: true,
                                                pinRight: true,
                                                pinTop: true,
                                                pinBottom: true,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfffcb284),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromSize(
                                    bounds: Rect.fromLTWH(18.9, 18.9, 1.0, 1.0),
                                    size: Size(40.0, 40.0),
                                    fixedWidth: true,
                                    fixedHeight: true,
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromSize(
                                          bounds:
                                              Rect.fromLTWH(0.0, 0.0, 1.0, 1.0),
                                          size: Size(1.0, 1.0),
                                          pinLeft: true,
                                          pinRight: true,
                                          pinTop: true,
                                          pinBottom: true,
                                          child: Stack(
                                            children: <Widget>[
                                              Pinned.fromSize(
                                                bounds: Rect.fromLTWH(
                                                    0.0, 0.0, 1.0, 1.0),
                                                size: Size(1.0, 1.0),
                                                pinLeft: true,
                                                pinRight: true,
                                                pinTop: true,
                                                pinBottom: true,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfffcb284),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(118.0, 0.0, 103.0, 120.0),
                        size: Size(339.0, 120.0),
                        pinTop: true,
                        pinBottom: true,
                        fixedWidth: true,
                        child:
                            // Adobe XD layer: 'reports' (group)
                            PageLink(
                          links: [
                            PageLinkInfo(
                              transition: LinkTransition.Fade,
                              ease: Curves.easeOut,
                              duration: 0.3,
                              // pageBuilder: () => Reports(),
                            ),
                          ],
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 103.0, 120.0),
                                size: Size(103.0, 120.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11.0),
                                    color: const Color(0xffffffff),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x29000000),
                                        offset: Offset(0, 3),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(32.0, 87.0, 45.0, 20.0),
                                size: Size(103.0, 120.0),
                                pinBottom: true,
                                fixedWidth: true,
                                fixedHeight: true,
                                child: Text(
                                  'Report',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: const Color(0xff3db9d2),
                                    letterSpacing: -0.168,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(32.0, 19.0, 40.0, 40.0),
                                size: Size(103.0, 120.0),
                                fixedWidth: true,
                                fixedHeight: true,
                                child:
                                    // Adobe XD layer: 'analytics (1)' (group)
                                    Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 40.0, 40.0),
                                      size: Size(40.0, 40.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: SvgPicture.string(
                                        _svg_pr4u32,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds: Rect.fromLTWH(4.7, 4.7, 2.3, 2.3),
                                      size: Size(40.0, 40.0),
                                      pinLeft: true,
                                      pinTop: true,
                                      fixedWidth: true,
                                      fixedHeight: true,
                                      child: SvgPicture.string(
                                        _svg_ae3xu0,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds: Rect.fromLTWH(9.4, 4.7, 2.3, 2.3),
                                      size: Size(40.0, 40.0),
                                      pinTop: true,
                                      fixedWidth: true,
                                      fixedHeight: true,
                                      child: SvgPicture.string(
                                        _svg_ks6pav,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(14.1, 4.7, 2.3, 2.3),
                                      size: Size(40.0, 40.0),
                                      pinTop: true,
                                      fixedWidth: true,
                                      fixedHeight: true,
                                      child: SvgPicture.string(
                                        _svg_39091t,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(4.7, 14.1, 30.6, 16.6),
                                      size: Size(40.0, 40.0),
                                      pinLeft: true,
                                      pinRight: true,
                                      fixedHeight: true,
                                      child: SvgPicture.string(
                                        _svg_3fabvs,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(4.7, 33.0, 8.6, 2.3),
                                      size: Size(40.0, 40.0),
                                      pinLeft: true,
                                      pinBottom: true,
                                      fixedWidth: true,
                                      fixedHeight: true,
                                      child: SvgPicture.string(
                                        _svg_rw5fyy,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(15.7, 33.0, 8.6, 2.3),
                                      size: Size(40.0, 40.0),
                                      pinBottom: true,
                                      fixedWidth: true,
                                      fixedHeight: true,
                                      child: SvgPicture.string(
                                        _svg_ampgr7,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(26.7, 33.0, 8.6, 2.3),
                                      size: Size(40.0, 40.0),
                                      pinRight: true,
                                      pinBottom: true,
                                      fixedWidth: true,
                                      fixedHeight: true,
                                      child: SvgPicture.string(
                                        _svg_bcm0ai,
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
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 103.0, 120.0),
                        size: Size(339.0, 120.0),
                        pinLeft: true,
                        pinTop: true,
                        pinBottom: true,
                        fixedWidth: true,
                        child:
                            // Adobe XD layer: 'Promotion list' (group)
                            PageLink(
                          links: [
                            PageLinkInfo(
                              transition: LinkTransition.Fade,
                              ease: Curves.easeOut,
                              duration: 0.3,
                              // pageBuilder: () => PromotionList(),
                            ),
                          ],
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(0.0, 0.0, 103.0, 120.0),
                                size: Size(103.0, 120.0),
                                pinLeft: true,
                                pinRight: true,
                                pinTop: true,
                                pinBottom: true,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11.0),
                                    color: const Color(0xffffffff),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x29000000),
                                        offset: Offset(0, 3),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(4.0, 89.0, 96.0, 20.0),
                                size: Size(103.0, 120.0),
                                pinLeft: true,
                                pinRight: true,
                                pinBottom: true,
                                fixedHeight: true,
                                child: Text(
                                  'Promotion List',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: const Color(0xffc88ed8),
                                    letterSpacing: -0.168,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Pinned.fromSize(
                                bounds: Rect.fromLTWH(32.0, 19.9, 40.0, 39.1),
                                size: Size(103.0, 120.0),
                                fixedWidth: true,
                                fixedHeight: true,
                                child:
                                    // Adobe XD layer: 'promotions (1)' (group)
                                    Stack(
                                  children: <Widget>[
                                    Pinned.fromSize(
                                      bounds:
                                          Rect.fromLTWH(0.0, 0.0, 40.0, 39.1),
                                      size: Size(40.0, 39.1),
                                      pinLeft: true,
                                      pinRight: true,
                                      pinTop: true,
                                      pinBottom: true,
                                      child: Stack(
                                        children: <Widget>[
                                          Pinned.fromSize(
                                            bounds: Rect.fromLTWH(
                                                0.0, 0.0, 40.0, 39.1),
                                            size: Size(40.0, 39.1),
                                            pinLeft: true,
                                            pinRight: true,
                                            pinTop: true,
                                            pinBottom: true,
                                            child: Stack(
                                              children: <Widget>[
                                                Pinned.fromSize(
                                                  bounds: Rect.fromLTWH(
                                                      0.0, 0.0, 40.0, 39.1),
                                                  size: Size(40.0, 39.1),
                                                  pinLeft: true,
                                                  pinRight: true,
                                                  pinTop: true,
                                                  pinBottom: true,
                                                  child: SvgPicture.string(
                                                    _svg_5nvyk1,
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Pinned.fromSize(
                                                  bounds: Rect.fromLTWH(
                                                      7.2, 6.6, 25.7, 25.8),
                                                  size: Size(40.0, 39.1),
                                                  pinLeft: true,
                                                  pinRight: true,
                                                  pinTop: true,
                                                  pinBottom: true,
                                                  child: SvgPicture.string(
                                                    _svg_29s551,
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Pinned.fromSize(
                                                  bounds: Rect.fromLTWH(
                                                      12.8, 14.5, 12.3, 12.3),
                                                  size: Size(40.0, 39.1),
                                                  fixedWidth: true,
                                                  fixedHeight: true,
                                                  child: SvgPicture.string(
                                                    _svg_18eez0,
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Pinned.fromSize(
                                                  bounds: Rect.fromLTWH(
                                                      24.5, 13.0, 2.1, 2.1),
                                                  size: Size(40.0, 39.1),
                                                  fixedWidth: true,
                                                  fixedHeight: true,
                                                  child: SvgPicture.string(
                                                    _svg_lcwbki,
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Pinned.fromSize(
                                                  bounds: Rect.fromLTWH(
                                                      12.1, 11.6, 7.7, 7.7),
                                                  size: Size(40.0, 39.1),
                                                  fixedWidth: true,
                                                  fixedHeight: true,
                                                  child: SvgPicture.string(
                                                    _svg_6zjv6p,
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Pinned.fromSize(
                                                  bounds: Rect.fromLTWH(
                                                      20.3, 19.8, 7.7, 7.7),
                                                  size: Size(40.0, 39.1),
                                                  fixedWidth: true,
                                                  fixedHeight: true,
                                                  child: SvgPicture.string(
                                                    _svg_7y4v6w,
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(34.0, 55.0, 64.0, 69.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(-18.0, -17.0, 99.0, 99.0),
                  size: Size(64.0, 69.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child:
                      // Adobe XD layer: 'Oval 219 Copy 3' (shape)
                      Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      image: DecorationImage(
                        image: const AssetImage('assets/images/pesonimg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromSize(
                    bounds: Rect.fromLTWH(100.0, 20.0, 300.0, 300.0),
                    size: Size(74.0, 100),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Text(
                      'Hello , Omar Ahmed',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: const Color(0xffffffff),
                        letterSpacing: 0.68,
                      ),
                      textAlign: TextAlign.left,
                    )
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_jg91bb =
    '<svg viewBox="0.0 0.0 35.1 24.9" ><path transform="translate(0.0, -9.7)" d="M 30.36988067626953 34.58288192749023 C 30.07754135131836 34.58288192749023 29.77824020385742 34.54634475708008 29.48241996765137 34.46803665161133 L 2.575019121170044 27.2622184753418 C 0.7304969429969788 26.75410461425781 -0.3692560195922852 24.84346008300781 0.1144960001111031 22.99893569946289 L 3.509460687637329 10.34482002258301 C 3.634748935699463 9.880207061767578 4.111539840698242 9.610490798950195 4.574410915374756 9.728818893432617 C 5.039021492004395 9.852367401123047 5.313960075378418 10.33089733123779 5.190411567687988 10.79376697540283 L 1.797187566757202 23.44440460205078 C 1.555311441421509 24.36666870117188 2.108668088912964 25.32720947265625 3.032669305801392 25.5830078125 L 29.92963027954102 32.78534317016602 C 30.85363006591797 33.02896118164063 31.80721664428711 32.47908020019531 32.0473518371582 31.560302734375 L 33.4063835144043 26.52441024780273 C 33.53166961669922 26.05979919433594 34.00846481323242 25.78311920166016 34.47307205200195 25.9101448059082 C 34.93768692016602 26.03543853759766 35.21088409423828 26.51396942138672 35.08733749389648 26.97684097290039 L 33.73004531860352 32.00577163696289 C 33.32111740112305 33.55447387695313 31.91162490844727 34.58288192749023 30.36988258361816 34.58288192749023 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_eeolfq =
    '<svg viewBox="0.0 0.0 34.8 27.8" ><path transform="translate(-4.0, -2.0)" d="M 35.32207107543945 29.84184265136719 L 7.480230331420898 29.84184265136719 C 5.560883045196533 29.84184265136719 4 28.28096199035645 4 26.36161231994629 L 4 5.480230808258057 C 4 3.560883045196533 5.560883045196533 2 7.480230331420898 2 L 35.32207107543945 2 C 37.24142074584961 2 38.80229949951172 3.560883522033691 38.80229949951172 5.480230808258057 L 38.80229949951172 26.36161231994629 C 38.80229949951172 28.28096199035645 37.24142074584961 29.84184265136719 35.32207107543945 29.84184265136719 Z M 7.480230331420898 3.740115165710449 C 6.521426677703857 3.740115165710449 5.740115165710449 4.521426677703857 5.740115165710449 5.480230808258057 L 5.740115165710449 26.36161231994629 C 5.740115165710449 27.32041931152344 6.521426677703857 28.10172843933105 7.480230331420898 28.10172843933105 L 35.32207107543945 28.10172843933105 C 36.28087615966797 28.10172843933105 37.06218719482422 27.32041931152344 37.06218719482422 26.36161231994629 L 37.06218719482422 5.480230808258057 C 37.06218719482422 4.521426677703857 36.28087615966797 3.740115165710449 35.32207107543945 3.740115165710449 L 7.480230331420898 3.740115165710449 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v1u4ry =
    '<svg viewBox="0.0 0.0 7.0 7.0" ><path transform="translate(-7.0, -5.0)" d="M 10.48022842407227 11.96045970916748 C 8.560882568359375 11.96045970916748 7.000000476837158 10.39957618713379 7.000000476837158 8.480230331420898 C 7.000000476837158 6.560883522033691 8.560882568359375 5 10.48022842407227 5 C 12.39957809448242 5 13.96046257019043 6.560882568359375 13.96046257019043 8.480230331420898 C 13.96046257019043 10.39957904815674 12.39957809448242 11.96045970916748 10.48022842407227 11.96045970916748 Z M 10.48022842407227 6.740114212036133 C 9.521427154541016 6.740114212036133 8.740114212036133 7.521426200866699 8.740114212036133 8.480230331420898 C 8.740114212036133 9.439033508300781 9.521427154541016 10.22034549713135 10.48022842407227 10.22034549713135 C 11.43903160095215 10.22034549713135 12.22034645080566 9.439033508300781 12.22034645080566 8.480230331420898 C 12.22034645080566 7.521426200866699 11.43903160095215 6.740114212036133 10.48022842407227 6.740114212036133 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_omxnv3 =
    '<svg viewBox="0.0 0.0 34.7 16.3" ><path transform="translate(-4.07, -7.55)" d="M 4.940243244171143 23.87228012084961 C 4.717509269714355 23.87228012084961 4.494773387908936 23.78701591491699 4.32424259185791 23.61822319030762 C 3.984919548034668 23.27890205383301 3.984919548034668 22.72728538513184 4.32424259185791 22.38796043395996 L 12.54280662536621 14.16939735412598 C 13.52771186828613 13.18449211120605 15.24868583679199 13.18449211120605 16.23359298706055 14.16939735412598 L 18.68019485473633 16.61599922180176 L 25.45272064208984 8.489662170410156 C 25.94516944885254 7.899764537811279 26.66905975341797 7.556959629058838 27.4399299621582 7.549999713897705 L 27.45907402038574 7.549999713897705 C 28.22124290466309 7.549999713897705 28.94339179992676 7.880622386932373 29.44106483459473 8.460081100463867 L 38.54186630249023 19.07826232910156 C 38.85508728027344 19.44194793701172 38.81332397460938 19.99182319641113 38.44789886474609 20.30504417419434 C 38.08421325683594 20.61826705932617 37.53607559204102 20.5782413482666 37.22111511230469 20.21107864379883 L 28.12031555175781 9.5928955078125 C 27.95152282714844 9.398000717163086 27.71834754943848 9.290115356445313 27.45907402038574 9.290115356445313 C 27.27809906005859 9.274454116821289 26.95965766906738 9.399742126464844 26.79086685180664 9.603336334228516 L 19.40756034851074 18.46226501464844 C 19.25094795227051 18.65019607543945 19.02299499511719 18.76330375671387 18.77763938903809 18.77374267578125 C 18.53054046630859 18.79114532470703 18.29562568664551 18.69370079040527 18.12335395812988 18.51968765258789 L 15.00332832336426 15.39966011047363 C 14.67444610595703 15.07251930236816 14.10194778442383 15.07251930236816 13.7730655670166 15.39966011047363 L 5.554502010345459 23.61822319030762 C 5.3857102394104 23.78701591491699 5.162975788116455 23.87228012084961 4.940240859985352 23.87228012084961 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_97xnef =
    '<svg viewBox="133.0 253.0 103.0 120.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path transform="translate(133.0, 253.0)" d="M 11 0 L 92 0 C 98.07513427734375 0 103 4.924867630004883 103 11 L 103 109 C 103 115.0751342773438 98.07513427734375 120 92 120 L 11 120 C 4.924867630004883 120 0 115.0751342773438 0 109 L 0 11 C 0 4.924867630004883 4.924867630004883 0 11 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_8lebwx =
    '<svg viewBox="0.0 0.0 40.0 37.9" ><path transform="translate(0.0, -2.43)" d="M 34.82227325439453 5.269469738006592 L 38.77127075195313 5.269469738006592 L 38.77127075195313 36.61471557617188 L 34.82227325439453 36.61471557617188 L 34.82227325439453 5.269469738006592 Z M 26.95891952514648 6.403972625732422 L 26.41216087341309 6.573831558227539 C 25.72765731811523 6.790169239044189 24.92315483093262 6.488901615142822 24.64639282226563 5.915524482727051 C 24.51371765136719 5.637919902801514 24.50737953186035 5.331159591674805 24.62907028198242 5.05059814453125 C 24.77019500732422 4.726091384887695 25.07019424438477 4.472148895263672 25.45089721679688 4.35341739654541 L 31.6160831451416 2.433001041412354 L 32.36650466918945 7.926362037658691 C 32.40876007080078 8.206080436706543 32.33016967773438 8.49171257019043 32.14467620849609 8.72833251953125 C 31.91777038574219 9.019035339355469 31.55312728881836 9.207487106323242 31.14411163330078 9.246358871459961 C 31.0950984954834 9.251429557800293 31.04016876220703 9.253964424133301 30.98735237121582 9.253964424133301 C 30.28974914550781 9.253964424133301 29.69735527038574 8.80945873260498 29.60946846008301 8.221291542053223 L 29.51440048217773 7.390167713165283 C 22.38921546936035 17.25590515136719 5.981809616088867 27.82981109619141 5.269840717315674 28.28530502319336 C 5.028151512145996 28.43995094299316 4.739138126373291 28.5223445892334 4.433224201202393 28.5223445892334 C 4.020831108093262 28.5223445892334 3.63294529914856 28.3702335357666 3.369706630706787 28.10361289978027 C 3.127594947814941 27.85981178283691 3.014355897903442 27.548828125 3.049426078796387 27.22939109802246 C 3.086186408996582 26.89770317077637 3.285199880599976 26.5926342010498 3.596184492111206 26.39488792419434 C 3.763085603713989 26.28756141662598 20.01415634155273 15.7821102142334 26.95891952514648 6.403972625732422 Z M 31.63045120239258 12.23155879974365 L 31.63045120239258 36.61386871337891 L 27.68229675292969 36.61386871337891 L 27.68229675292969 12.23155879974365 L 31.63045120239258 12.23155879974365 Z M 24.725830078125 19.47674369812012 L 24.725830078125 36.61471557617188 L 20.77640533447266 36.61471557617188 L 20.77640533447266 19.47674369812012 L 24.725830078125 19.47674369812012 Z M 17.58458709716797 27.00333595275879 L 17.58458709716797 36.61344528198242 L 13.63600826263428 36.61344528198242 L 13.63600826263428 27.00333595275879 L 17.58458709716797 27.00333595275879 Z M 10.03517532348633 30.76853561401367 L 10.03517532348633 36.61386871337891 L 6.087020874023438 36.61386871337891 L 6.087020874023438 30.76853561401367 L 10.03517532348633 30.76853561401367 Z M 39.99958038330078 40.376953125 L 0 40.376953125 L 0 37.44710540771484 L 40 37.44710540771484 L 39.99958038330078 40.376953125 L 39.99958038330078 40.376953125 Z" fill="#f6838d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v5v8mf =
    '<svg viewBox="15.0 253.0 103.0 120.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path transform="translate(15.0, 253.0)" d="M 11 0 L 92 0 C 98.07513427734375 0 103 4.924867630004883 103 11 L 103 109 C 103 115.0751342773438 98.07513427734375 120 92 120 L 11 120 C 4.924867630004883 120 0 115.0751342773438 0 109 L 0 11 C 0 4.924867630004883 4.924867630004883 0 11 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_nk74ue =
    '<svg viewBox="30.7 44.9 23.6 11.5" ><path transform="translate(-91.26, -48.96)" d="M 129.5231323242188 105.3179092407227 L 145.5485229492188 97.49658966064453 L 138.0113983154297 93.81800079345703 L 121.9860076904297 101.6393127441406 L 129.5231323242188 105.3179092407227 Z" fill="#fcb284" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9hmmra =
    '<svg viewBox="23.0 52.9 13.6 23.5" ><path transform="translate(0.0, -100.23)" d="M 36.57501220703125 160.9069519042969 L 23 153.0850067138672 L 23 168.7301330566406 L 36.57501220703125 176.5520629882813 L 36.57501220703125 160.9069519042969 Z" fill="#fcb284" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cul3fs =
    '<svg viewBox="40.0 52.9 13.5 23.5" ><path transform="translate(-170.99, -100.23)" d="M 211 160.9069519042969 L 211 176.5520629882813 L 218.4116516113281 172.2661743164063 L 218.4116516113281 160.9723205566406 C 218.4053955078125 159.6781311035156 219.449462890625 158.6238708496094 220.74365234375 158.6176147460938 L 222.6869812011719 158.6176147460938 C 222.9143981933594 157.7943115234375 223.6598205566406 157.2213134765625 224.513916015625 157.2132873535156 L 224.4969787597656 157.2132873535156 L 224.4969787597656 153.0850067138672 L 211 160.9069519042969 Z" fill="#fcb284" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_1d3jm8 =
    '<svg viewBox="23.5 40.7 19.6 11.3" ><path transform="translate(-6.47, 0.0)" d="M 49.64333343505859 44.22918319702148 L 43.56000518798828 40.71699905395508 L 30.01300048828125 48.53839111328125 L 36.09624481201172 52.05057525634766 L 49.64333343505859 44.22918319702148 Z" fill="#fcb284" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hpbnir =
    '<svg viewBox="49.8 59.5 13.2 18.3" ><path transform="translate(-270.18, -178.52)" d="M 331.9293518066406 238 L 329.9646606445313 238 C 329.7241516113281 238.7940063476563 328.9887084960938 239.334228515625 328.1591186523438 239.3262939453125 L 325.0093078613281 239.3262939453125 C 324.1796875 239.334228515625 323.4442138671875 238.7940063476563 323.2036743164063 238 L 321.2390441894531 238 C 320.9071350097656 238.002685546875 320.5899047851563 238.1372985839844 320.3573303222656 238.3741149902344 C 320.124755859375 238.6109619140625 319.9959411621094 238.9305725097656 319.999267578125 239.2624816894531 L 319.999267578125 255.02978515625 C 319.9973449707031 255.3579406738281 320.1277465820313 255.6730346679688 320.361083984375 255.90380859375 C 320.5944213867188 256.1345825195313 320.9109191894531 256.2615661621094 321.2390441894531 256.2560424804688 L 331.9293518066406 256.2560424804688 C 332.2590637207031 256.2621459960938 332.577392578125 256.1358337402344 332.813232421875 255.9053344726563 C 333.049072265625 255.6748962402344 333.1826782226563 255.3595275878906 333.1842041015625 255.02978515625 L 333.1842041015625 239.2624816894531 C 333.1842041015625 238.5685424804688 332.6238403320313 238.0045471191406 331.9296569824219 238 Z M 321.3255615234375 241.6693725585938 C 321.3245544433594 241.5246887207031 321.3811645507813 241.3855590820313 321.4828491210938 241.2826232910156 C 321.5845642089844 241.1796875 321.7230224609375 241.1214294433594 321.8677062988281 241.1206970214844 L 324.4403076171875 241.1206970214844 C 324.7435913085938 241.1213989257813 324.9898071289063 241.3661193847656 324.9923706054688 241.6693725585938 L 324.9923706054688 242.0368347167969 C 324.9908752441406 242.3388061523438 324.7452392578125 242.5825500488281 324.4432983398438 242.5817260742188 C 324.2069702148438 242.5895080566406 323.9945373535156 242.4385986328125 323.924072265625 242.2129211425781 L 322.4177856445313 242.2129211425781 L 322.4177856445313 243.6952514648438 L 322.4393310546875 243.6952514648438 C 322.740966796875 243.6952514648438 322.9854736328125 243.9397583007813 322.9854736328125 244.2413635253906 C 322.9854736328125 244.5429992675781 322.740966796875 244.7875061035156 322.4393310546875 244.7875061035156 L 321.8677062988281 244.7875061035156 C 321.7234191894531 244.7875061035156 321.5849914550781 244.7299499511719 321.4832153320313 244.6275634765625 C 321.3814086914063 244.5251159667969 321.3246765136719 244.3863525390625 321.3255615234375 244.2420043945313 L 321.3255615234375 241.6693725585938 Z M 321.3255615234375 246.659912109375 C 321.3255615234375 246.3583068847656 321.570068359375 246.1138000488281 321.8717041015625 246.1138000488281 L 324.4462585449219 246.1138000488281 C 324.7478637695313 246.1138000488281 324.9923706054688 246.3583068847656 324.9923706054688 246.659912109375 L 324.9923706054688 249.2344970703125 C 324.9923706054688 249.5361022949219 324.7478637695313 249.7806091308594 324.4462585449219 249.7806091308594 L 321.8716735839844 249.7806091308594 C 321.570068359375 249.7806091308594 321.3255615234375 249.5361022949219 321.3255615234375 249.2344970703125 L 321.3255615234375 246.659912109375 Z M 322.4394226074219 254.7737426757813 L 321.8677062988281 254.7737426757813 C 321.7252807617188 254.7778625488281 321.5872802734375 254.7241821289063 321.485107421875 254.6248474121094 C 321.3829650878906 254.5255432128906 321.3254089355469 254.3890991210938 321.3255615234375 254.2466430664063 L 321.3255615234375 251.6740112304688 C 321.3220825195313 251.3690490722656 321.5628967285156 251.1171569824219 321.8677062988281 251.1069030761719 L 324.4403076171875 251.1069030761719 C 324.7470703125 251.1163330078125 324.9912109375 251.3671264648438 324.9923706054688 251.6740112304688 L 324.9923706054688 252.2002563476563 C 324.9921875 252.5034484863281 324.7461242675781 252.7490234375 324.4429626464844 252.7486877441406 C 324.1397399902344 252.7484130859375 323.8941650390625 252.5023498535156 323.8945007324219 252.1991577148438 L 322.4177856445313 252.1991577148438 L 322.4177856445313 253.6814880371094 L 322.4394226074219 253.6814880371094 C 322.7410278320313 253.6814880371094 322.9855346679688 253.9259948730469 322.9855346679688 254.2276000976563 C 322.9855346679688 254.5292053222656 322.7410278320313 254.7737426757813 322.4394226074219 254.7737426757813 Z M 326.4700927734375 252.6470336914063 L 324.4844055175781 254.6327514648438 C 324.2711181640625 254.8460388183594 323.92529296875 254.8460388183594 323.7120361328125 254.6327514648438 L 322.8390808105469 253.7600402832031 C 322.6258239746094 253.5467529296875 322.6258239746094 253.2009582519531 322.8390808105469 252.9876708984375 C 323.0523681640625 252.7743835449219 323.3981628417969 252.7743835449219 323.6114501953125 252.9876708984375 L 324.0979919433594 253.4742736816406 L 325.6973571777344 251.8749084472656 C 325.9106140136719 251.66162109375 326.2564086914063 251.66162109375 326.4696960449219 251.8749084472656 C 326.6829833984375 252.0881958007813 326.6829833984375 252.4339904785156 326.4696960449219 252.6472778320313 Z M 326.4700927734375 242.5633850097656 L 324.4844055175781 244.549072265625 C 324.2711181640625 244.7623901367188 323.92529296875 244.7623901367188 323.7120361328125 244.549072265625 L 322.8390808105469 243.6763916015625 C 322.6258239746094 243.4631042480469 322.6258239746094 243.1172790527344 322.8390808105469 242.9040222167969 C 323.0523681640625 242.6907348632813 323.3981628417969 242.6907348632813 323.6114501953125 242.9040222167969 L 324.0979919433594 243.3905944824219 L 325.6973571777344 241.7912292480469 C 325.9106140136719 241.5779724121094 326.2564086914063 241.5779724121094 326.4696960449219 241.7912292480469 C 326.6829833984375 242.0045166015625 326.6829833984375 242.350341796875 326.4696960449219 242.5635986328125 Z M 331.3006286621094 253.5254516601563 L 327.8705139160156 253.5254516601563 C 327.5689086914063 253.5254516601563 327.3244018554688 253.2809448242188 327.3244018554688 252.9793090820313 C 327.3244018554688 252.6777038574219 327.5689086914063 252.4331970214844 327.8705139160156 252.4331970214844 L 331.3006286621094 252.4331970214844 C 331.6022338867188 252.4331970214844 331.8467407226563 252.6777038574219 331.8467407226563 252.9793090820313 C 331.8467407226563 253.2809448242188 331.6022338867188 253.5254516601563 331.3006286621094 253.5254516601563 Z M 331.3006286621094 248.5323486328125 L 327.8705139160156 248.5323486328125 C 327.5689086914063 248.5323486328125 327.3244018554688 248.287841796875 327.3244018554688 247.9862060546875 C 327.3244018554688 247.6846008300781 327.5689086914063 247.4400939941406 327.8705139160156 247.4400939941406 L 331.3006286621094 247.4400939941406 C 331.6022338867188 247.4400939941406 331.8467407226563 247.6846008300781 331.8467407226563 247.9862060546875 C 331.8467407226563 248.287841796875 331.6022338867188 248.5323486328125 331.3006286621094 248.5323486328125 Z M 331.3006286621094 243.5392150878906 L 327.8705139160156 243.5392150878906 C 327.5689086914063 243.5392456054688 327.3244018554688 243.2947387695313 327.3244018554688 242.9931030273438 C 327.3244018554688 242.6914978027344 327.5689086914063 242.4469909667969 327.8705139160156 242.4469909667969 L 331.3006286621094 242.4469909667969 C 331.6022338867188 242.4469909667969 331.8467407226563 242.6914978027344 331.8467407226563 242.9931030273438 C 331.8467407226563 243.2947387695313 331.6022338867188 243.5392456054688 331.3006286621094 243.5392456054688 Z" fill="#fcb284" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vgzs7 =
    '<svg viewBox="0.0 0.0 40.0 40.0" ><path  d="M 39.33333587646484 13.33333396911621 L 36.00000381469727 13.33333396911621 L 36.00000381469727 8.666666984558105 C 36.00000381469727 8.298501014709473 35.70150375366211 8.000000953674316 35.33333587646484 8.000000953674316 L 33.33333587646484 8.000000953674316 L 33.33333587646484 0.6666667461395264 C 33.33333587646484 0.2985000014305115 33.03483581542969 0 32.66667175292969 0 L 7.333333969116211 0 C 6.96516752243042 0 6.666666984558105 0.2985000312328339 6.666666984558105 0.6666667461395264 L 6.666666984558105 8.000000953674316 L 4.666666984558105 8.000000953674316 C 4.298500537872314 8.000000953674316 4.000000476837158 8.298501014709473 4.000000476837158 8.666666984558105 L 4.000000476837158 13.33333396911621 L 0.6666667461395264 13.33333396911621 C 0.2985000014305115 13.33333396911621 0 13.63183498382568 0 14.00000095367432 L 0 32.66667175292969 C 0 33.03483581542969 0.2985000312328339 33.33333587646484 0.6666667461395264 33.33333587646484 L 6.666666984558105 33.33333587646484 L 6.666666984558105 39.33333587646484 C 6.666666984558105 39.70149993896484 6.96516752243042 40 7.333333969116211 40 L 32.66667175292969 40 C 33.03483581542969 40 33.33333587646484 39.70149993896484 33.33333587646484 39.33333587646484 L 33.33333587646484 33.33333587646484 L 39.33333587646484 33.33333587646484 C 39.70149993896484 33.33333587646484 40 33.03483581542969 40 32.66667175292969 L 40 14.00000095367432 C 40 13.63183498382568 39.70149993896484 13.33333396911621 39.33333587646484 13.33333396911621 Z M 33.33333587646484 9.333333969116211 L 34.66666793823242 9.333333969116211 L 34.66666793823242 13.33333396911621 L 33.33333587646484 13.33333396911621 L 33.33333587646484 9.333333969116211 Z M 8.000000953674316 1.333333492279053 L 32.00000381469727 1.333333492279053 L 32.00000381469727 13.33333396911621 L 8.000000953674316 13.33333396911621 L 8.000000953674316 1.333333492279053 Z M 5.333333969116211 9.333333969116211 L 6.666666984558105 9.333333969116211 L 6.666666984558105 13.33333396911621 L 5.333333969116211 13.33333396911621 L 5.333333969116211 9.333333969116211 Z M 6.666666984558105 29.33333587646484 L 6.000000476837158 29.33333587646484 L 6.000000476837158 27.33333587646484 L 6.666666984558105 27.33333587646484 L 6.666666984558105 29.33333587646484 Z M 32.00000381469727 38.66667175292969 L 8.000000953674316 38.66667175292969 L 8.000000953674316 27.33333587646484 L 32.00000381469727 27.33333587646484 L 32.00000381469727 38.66667175292969 Z M 38.66667175292969 32.00000381469727 L 33.33333587646484 32.00000381469727 L 33.33333587646484 30.66666793823242 L 34.66666793823242 30.66666793823242 C 35.03483581542969 30.66666793823242 35.33333587646484 30.36816787719727 35.33333587646484 30.00000381469727 L 35.33333587646484 26.66666793823242 C 35.33333587646484 26.29850387573242 35.03483581542969 26.00000381469727 34.66666793823242 26.00000381469727 L 5.333333969116211 26.00000381469727 C 4.965167045593262 26.00000381469727 4.666666984558105 26.29850387573242 4.666666984558105 26.66666793823242 L 4.666666984558105 30.00000381469727 C 4.666666984558105 30.36816787719727 4.965167045593262 30.66666793823242 5.333333969116211 30.66666793823242 L 6.666666984558105 30.66666793823242 L 6.666666984558105 32.00000381469727 L 1.333333492279053 32.00000381469727 L 1.333333492279053 14.66666793823242 L 38.66667175292969 14.66666793823242 L 38.66667175292969 32.00000381469727 Z M 33.33333587646484 29.33333587646484 L 33.33333587646484 27.33333587646484 L 34.00000381469727 27.33333587646484 L 34.00000381469727 29.33333587646484 L 33.33333587646484 29.33333587646484 Z" fill="#aec5e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yy0p9k =
    '<svg viewBox="0.0 0.0 6.0 3.6" ><path transform="translate(-32.0, -192.0)" d="M 37.40000152587891 192 L 32.59999847412109 192 C 32.26865005493164 192 32 192.2686614990234 32 192.6000061035156 L 32 195 C 32 195.3313598632813 32.26865005493164 195.6000061035156 32.59999847412109 195.6000061035156 L 37.40000152587891 195.6000061035156 C 37.73134994506836 195.6000061035156 38 195.3313598632813 38 195 L 38 192.6000061035156 C 38 192.2686614990234 37.73134994506836 192 37.40000152587891 192 Z M 36.79999923706055 194.4000091552734 L 33.20000076293945 194.4000091552734 L 33.20000076293945 193.2000122070313 L 36.79999923706055 193.2000122070313 L 36.79999923706055 194.4000091552734 Z" fill="#aec5e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g0zdls =
    '<svg viewBox="30.0 22.3 16.0 13.7" ><path transform="translate(30.0, 17.79)" d="M 10.66539192199707 11.3563232421875 C 10.66539192199707 10.5183277130127 9.979759216308594 9.832695960998535 9.141764640808105 9.832695960998535 C 8.303769111633301 9.832695960998535 7.618136882781982 10.5183277130127 7.618136882781982 11.3563232421875 C 7.618136882781982 12.19431781768799 8.303769111633301 12.87995052337646 9.141764640808105 12.87995052337646 C 9.979759216308594 12.87995052337646 10.66539192199707 12.19431781768799 10.66539192199707 11.3563232421875 Z M 9.141764640808105 4.5 C 5.355550289154053 4.5 2.285441160202026 7.570109367370605 2.285441160202026 11.3563232421875 L 0 11.3563232421875 L 3.047254800796509 14.40357780456543 L 6.094509601593018 11.3563232421875 L 3.809068441390991 11.3563232421875 C 3.809068441390991 8.408103942871094 6.193545341491699 6.023627281188965 9.141764640808105 6.023627281188965 C 12.08998394012451 6.023627281188965 14.47446060180664 8.408103942871094 14.47446060180664 11.3563232421875 C 14.47446060180664 14.30454254150391 12.08998394012451 16.68902015686035 9.141764640808105 16.68902015686035 C 7.991425514221191 16.68902015686035 6.924886703491211 16.31573104858398 6.048800468444824 15.6986608505249 L 4.967025279998779 16.79567337036133 C 6.124982357025146 17.67937850952148 7.572428226470947 18.212646484375 9.141764640808105 18.212646484375 C 12.927978515625 18.212646484375 15.99808788299561 15.14253711700439 15.99808788299561 11.3563232421875 C 15.99808788299561 7.570109367370605 12.927978515625 4.5 9.141764640808105 4.5 Z" fill="#f891b8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_imyqqe =
    '<svg viewBox="261.0 409.0 214.0 120.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#fffce5e6"  /><stop offset="1.0" stop-color="#fff68591"  /></linearGradient></defs><path transform="translate(261.0, 409.0)" d="M 10.89814758300781 0 L 203.1018524169922 0 C 209.1207275390625 0 214 4.924867630004883 214 11 L 214 109 C 214 115.0751342773438 209.1207275390625 120 203.1018524169922 120 L 10.89814758300781 120 C 4.879266738891602 120 0 115.0751342773438 0 109 L 0 11 C 0 4.924867630004883 4.879266738891602 0 10.89814758300781 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_ol2qm1 =
    '<svg viewBox="0.0 0.0 27.8 40.0" ><path transform="translate(0.0, 0.0)" d="M 26.04167747497559 21.66644096374512 C 25.08160781860352 21.66644096374512 24.30556488037109 22.41310119628906 24.30556488037109 23.33309173583984 L 24.30556488037109 29.99968910217285 C 24.30556488037109 30.91801452636719 23.52778625488281 31.66633987426758 22.5694522857666 31.66633987426758 L 17.36111831665039 31.66633987426758 L 17.36111831665039 6.666597366333008 C 17.36111831665039 5.243278503417969 16.41667366027832 3.971625089645386 14.9965353012085 3.498296976089478 L 14.48264694213867 3.333298683166504 L 22.56945610046387 3.333298683166504 C 23.52778816223145 3.333298683166504 24.30556678771973 4.081624031066895 24.30556678771973 4.999948024749756 L 24.30556678771973 9.999896049499512 C 24.30556678771973 10.91988658905029 25.08160781860352 11.66654586791992 26.04167938232422 11.66654586791992 C 27.00175094604492 11.66654586791992 27.77778816223145 10.91988658905029 27.77778816223145 9.999896049499512 L 27.77778816223145 4.999948024749756 C 27.77778816223145 2.243310213088989 25.44098281860352 0 22.5694522857666 0 L 3.906251668930054 0 C 3.840279102325439 0 3.78472375869751 0.0283330399543047 3.720487356185913 0.03666628524661064 C 3.63715386390686 0.02999968826770782 3.557292699813843 0 3.472223281860352 0 C 1.557292222976685 0 -1.19209303761636e-07 1.49498450756073 -1.19209303761636e-07 3.333298683166504 L -1.19209303761636e-07 33.33298873901367 C -1.19209303761636e-07 34.75630569458008 0.9444447159767151 36.02796173095703 2.36458420753479 36.50128936767578 L 12.81250476837158 39.84458923339844 C 13.166672706604 39.94958877563477 13.51910305023193 39.99958801269531 13.88889408111572 39.99958801269531 C 15.80382537841797 39.99958801269531 17.36111831665039 38.50460433959961 17.36111831665039 36.66629028320313 L 17.36111831665039 34.99964141845703 L 22.5694522857666 34.99964141845703 C 25.44098281860352 34.99964141845703 27.77778816223145 32.75632858276367 27.77778816223145 29.99969100952148 L 27.77778816223145 23.33309364318848 C 27.77778816223145 22.41310501098633 27.00174713134766 21.66644477844238 26.04167747497559 21.66644477844238 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gpq4qc =
    '<svg viewBox="20.9 8.1 19.1 17.4" ><path transform="translate(7.9, 3.09)" d="M 31.58855247497559 12.45326900482178 L 24.64410400390625 5.508820533752441 C 24.1475772857666 5.012292385101318 23.40105056762695 4.862987041473389 22.75174140930176 5.132084846496582 C 22.10417175292969 5.401182174682617 21.6805591583252 6.034862995147705 21.6805591583252 6.736251354217529 L 21.6805591583252 11.94458675384521 L 14.73611259460449 11.94458675384521 C 13.77777862548828 11.94458675384521 13 12.7223653793335 13 13.68069934844971 C 13 14.63903331756592 13.77777862548828 15.41681098937988 14.73611259460449 15.41681098937988 L 21.6805591583252 15.41681098937988 L 21.6805591583252 20.62514495849609 C 21.6805591583252 21.32653427124023 22.10416984558105 21.96021461486816 22.75174140930176 22.22931289672852 C 23.40105056762695 22.49840927124023 24.1475772857666 22.34910202026367 24.64410400390625 21.85257720947266 L 31.58855247497559 14.90812969207764 C 32.26736831665039 14.22931098937988 32.26736831665039 13.13208770751953 31.58855247497559 12.45326614379883 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_x64aa7 =
    '<svg viewBox="261.0 409.0 336.0 72.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff58d376"  /><stop offset="1.0" stop-color="#ff95dca6"  /></linearGradient></defs><path transform="translate(261.0, 409.0)" d="M 17.11111068725586 0 L 318.888916015625 0 C 328.339111328125 0 336 2.954920768737793 336 6.600000381469727 L 336 65.40000915527344 C 336 69.04508209228516 328.339111328125 72 318.888916015625 72 L 17.11111068725586 72 C 7.660904884338379 72 0 69.04508209228516 0 65.40000915527344 L 0 6.600000381469727 C 0 2.954920768737793 7.660904884338379 0 17.11111068725586 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_lbww5r =
    '<svg viewBox="29.2 94.0 4.0 4.0" ><path transform="translate(-340.0, -256.21)" d="M 371.2639770507813 350.2520141601563 C 370.1534729003906 350.2520141601563 369.25 351.1553955078125 369.25 352.2658386230469 C 369.25 353.3773803710938 370.1534729003906 354.2816162109375 371.2639770507813 354.2816162109375 C 372.3734130859375 354.2816162109375 373.2760009765625 353.3773193359375 373.2760009765625 352.2658386230469 C 373.2759094238281 351.1553955078125 372.3733520507813 350.2520141601563 371.2639770507813 350.2520141601563 Z M 371.2639770507813 353.2269287109375 C 370.7350769042969 353.2269287109375 370.3048400878906 352.7957763671875 370.3048400878906 352.2658386230469 C 370.3048400878906 351.7370300292969 370.7350769042969 351.3067932128906 371.2639770507813 351.3067932128906 C 371.791748046875 351.3067932128906 372.2211303710938 351.7370300292969 372.2211303710938 352.2658386230469 C 372.2210693359375 352.7957763671875 371.7916564941406 353.2269287109375 371.2639770507813 353.2269287109375 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r7yvs0 =
    '<svg viewBox="0.0 71.5 40.0 28.8" ><path  d="M 38.6007080078125 92.07511901855469 L 38.6007080078125 86.91926574707031 C 38.6007080078125 85.34677124023438 37.59000778198242 84.24848937988281 36.14290237426758 84.24848937988281 L 35.52743911743164 84.24848937988281 C 35.03657913208008 84.24848937988281 34.86462783813477 84.0198974609375 34.39509582519531 83.29740905761719 C 34.3244743347168 83.18873596191406 34.25072479248047 83.07528686523438 34.17220687866211 82.95864868164063 L 31.89166259765625 79.56005859375 C 31.85135078430176 79.50006103515625 31.81197547912598 79.44076538085938 31.77314758300781 79.38240051269531 C 31.16838264465332 78.47256469726563 30.54299354553223 77.53170776367188 28.73948287963867 77.53170776367188 L 28.70440483093262 77.53170776367188 L 28.70440483093262 76.50711059570313 C 28.70440483093262 75.2899169921875 27.71503067016602 74.2996826171875 26.49893951416016 74.2996826171875 L 24.55987930297852 74.2996826171875 L 24.55987930297852 72.89836120605469 C 24.55987930297852 72.12725830078125 23.93300628662109 71.5 23.16254043579102 71.5 L 2.840862512588501 71.5 C 2.070317506790161 71.5 1.443521857261658 72.12725830078125 1.443521857261658 72.89836120605469 L 1.443521857261658 79.41342163085938 C 1.443521857261658 79.74006652832031 1.708365082740784 80.00482177734375 2.03500509262085 80.00482177734375 C 2.361644983291626 80.00482177734375 2.626488208770752 79.74006652832031 2.626488208770752 79.41342163085938 L 2.626488208770752 72.89836120605469 C 2.626488208770752 72.77952575683594 2.722659826278687 72.68289184570313 2.840862512588501 72.68289184570313 L 23.16254043579102 72.68289184570313 C 23.28074264526367 72.68289184570313 23.37691307067871 72.77952575683594 23.37691307067871 72.89836120605469 L 23.37691307067871 92.00057983398438 L 13.51420021057129 92.00057983398438 C 12.66240501403809 91.22042846679688 11.52896976470947 90.74371337890625 10.28631591796875 90.74371337890625 C 9.043661117553711 90.74371337890625 7.910227298736572 91.22050476074219 7.058432579040527 92.00057983398438 L 2.626488208770752 92.00057983398438 L 2.626488208770752 82.12223815917969 C 2.626488208770752 81.79560852050781 2.361644983291626 81.53083801269531 2.03500509262085 81.53083801269531 C 1.708365201950073 81.53083801269531 1.443521976470947 81.79560852050781 1.443521976470947 82.12223815917969 L 1.443521976470947 92.06205749511719 C 0.6142269968986511 92.27737426757813 9.5367431640625e-06 93.03363037109375 9.5367431640625e-06 93.93089294433594 C 9.5367431640625e-06 94.99409484863281 0.8642265796661377 95.8590087890625 1.9264897108078 95.8590087890625 L 5.511483192443848 95.8590087890625 C 5.678201198577881 98.35111999511719 7.75538444519043 100.3279876708984 10.28631591796875 100.3279876708984 C 12.81724739074707 100.3279876708984 14.89435386657715 98.35111999511719 15.06114864349365 95.8590087890625 L 19.51622009277344 95.8590087890625 C 19.84285736083984 95.8590087890625 20.10770225524902 95.59423828125 20.10770225524902 95.26760864257813 C 20.10770225524902 94.94096374511719 19.84285926818848 94.67620849609375 19.51622009277344 94.67620849609375 L 14.99458885192871 94.67620849609375 C 14.8976354598999 94.14276123046875 14.71248054504395 93.64002990722656 14.45435619354248 93.18339538574219 L 26.9382381439209 93.18339538574219 C 26.68011474609375 93.63995361328125 26.49495697021484 94.14268493652344 26.39800453186035 94.67620849609375 L 22.22168350219727 94.67620849609375 C 21.89504623413086 94.67620849609375 21.63020133972168 94.94096374511719 21.63020133972168 95.26760864257813 C 21.63020133972168 95.59423828125 21.89504623413086 95.8590087890625 22.22168350219727 95.8590087890625 L 26.33144378662109 95.8590087890625 C 26.49816131591797 98.35111999511719 28.57526779174805 100.3279876708984 31.10619926452637 100.3279876708984 C 33.63713455200195 100.3279876708984 35.71423721313477 98.35111999511719 35.88103485107422 95.8590087890625 L 38.07134246826172 95.8590087890625 C 39.13485336303711 95.8590087890625 40.0000114440918 94.99409484863281 40.0000114440918 93.93089294433594 C 39.99993133544922 93.05026245117188 39.40750885009766 92.30604553222656 38.60071563720703 92.07511901855469 Z M 5.578043460845947 94.67620849609375 L 1.926487922668457 94.67620849609375 C 1.516488671302795 94.67620849609375 1.182973742485046 94.34182739257813 1.182973742485046 93.93089294433594 C 1.182973742485046 93.51870727539063 1.516488671302795 93.18339538574219 1.926487922668457 93.18339538574219 L 6.118354797363281 93.18339538574219 C 5.860152244567871 93.64002990722656 5.675074577331543 94.14276123046875 5.578043460845947 94.67620849609375 Z M 10.2863130569458 99.14524841308594 C 8.299053192138672 99.14524841308594 6.682415008544922 97.526123046875 6.682415008544922 95.53596496582031 C 6.682415008544922 93.54574584960938 8.299130439758301 91.92658996582031 10.2863130569458 91.92658996582031 C 12.27349758148193 91.92658996582031 13.89021301269531 93.54574584960938 13.89021301269531 95.53596496582031 C 13.89021301269531 97.52604675292969 12.2735767364502 99.14524841308594 10.2863130569458 99.14524841308594 Z M 24.55995559692383 75.48265075683594 L 26.49901390075684 75.48265075683594 C 27.06284141540527 75.48265075683594 27.52151489257813 75.9422607421875 27.52151489257813 76.50718688964844 L 27.52151489257813 77.53178405761719 L 24.55995941162109 77.53178405761719 L 24.55995559692383 75.48265075683594 Z M 24.55995559692383 92.00057983398438 L 24.55995559692383 78.71467590332031 L 28.73947715759277 78.71467590332031 C 29.90877151489258 78.71467590332031 30.22103500366211 79.18443298339844 30.78791046142578 80.03726196289063 C 30.82783126831055 80.09724426269531 30.86829948425293 80.15818786621094 30.90947341918945 80.21951293945313 L 33.19033050537109 83.61857604980469 C 33.26564025878906 83.73036193847656 33.33587646484375 83.8385009765625 33.40306091308594 83.94192504882813 C 33.90087509155273 84.70794677734375 34.37095260620117 85.43138122558594 35.5273551940918 85.43138122558594 L 36.14281845092773 85.43138122558594 C 37.08274078369141 85.43138122558594 37.41766357421875 86.19996643066406 37.41766357421875 86.91926574707031 L 37.41766357421875 87.24559020996094 L 35.67782211303711 87.24559020996094 C 34.90118408203125 87.24559020996094 34.26939010620117 87.87786865234375 34.26939010620117 88.65504455566406 L 34.26939010620117 89.27130126953125 C 34.26939010620117 90.04965209960938 34.90118789672852 90.68292236328125 35.67782592773438 90.68292236328125 L 37.41766357421875 90.68292236328125 L 37.41766357421875 92.00057983398438 L 34.33399963378906 92.00057983398438 C 33.48220443725586 91.22042846679688 32.3487663269043 90.74371337890625 31.10611534118652 90.74371337890625 C 29.86346435546875 90.74371337890625 28.73002624511719 91.22050476074219 27.87822914123535 92.00057983398438 L 24.55995559692383 92.00057983398438 Z M 37.41774368286133 88.42848205566406 L 37.41774368286133 89.5001220703125 L 35.67790603637695 89.5001220703125 C 35.55571746826172 89.5001220703125 35.4525146484375 89.39535522460938 35.4525146484375 89.27130126953125 L 35.4525146484375 88.65504455566406 C 35.4525146484375 88.53224182128906 35.55571746826172 88.42848205566406 35.67790603637695 88.42848205566406 L 37.41774368286133 88.42848205566406 Z M 31.10619354248047 99.145263671875 C 29.11901092529297 99.145263671875 27.50229454040527 97.526123046875 27.50229454040527 95.53596496582031 C 27.50229454040527 93.54574584960938 29.11901092529297 91.92660522460938 31.10619354248047 91.92660522460938 C 33.09346008300781 91.92660522460938 34.7100944519043 93.54574584960938 34.7100944519043 95.53596496582031 C 34.7100944519043 97.52604675292969 33.09337997436523 99.145263671875 31.10619354248047 99.145263671875 Z M 38.07125854492188 94.67620849609375 L 35.81438827514648 94.67620849609375 C 35.71743392944336 94.14276123046875 35.53227996826172 93.64002990722656 35.27415466308594 93.18339538574219 L 38.07125854492188 93.18339538574219 C 38.48242950439453 93.18339538574219 38.81695556640625 93.51870727539063 38.81695556640625 93.93089294433594 C 38.81695556640625 94.34190368652344 38.48242950439453 94.67620849609375 38.07125854492188 94.67620849609375 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vcgexu =
    '<svg viewBox="8.1 94.0 4.0 4.0" ><path transform="translate(-94.64, -256.21)" d="M 104.7959442138672 350.2520141601563 C 103.6865615844727 350.2520141601563 102.7839965820313 351.1553955078125 102.7839965820313 352.2658386230469 C 102.7839965820313 353.3773803710938 103.6865615844727 354.2816162109375 104.7959442138672 354.2816162109375 C 105.9064483642578 354.2816162109375 106.8099212646484 353.3773193359375 106.8099212646484 352.2658386230469 C 106.8099212646484 351.1553955078125 105.9064559936523 350.2520141601563 104.7959442138672 350.2520141601563 Z M 104.7959442138672 353.2269287109375 C 104.268180847168 353.2269287109375 103.8388442993164 352.7957763671875 103.8388442993164 352.2658386230469 C 103.8388442993164 351.7370300292969 104.268180847168 351.3067932128906 104.7959442138672 351.3067932128906 C 105.3248291015625 351.3067932128906 105.7550735473633 351.7370300292969 105.7550735473633 352.2658386230469 C 105.7550735473633 352.7957763671875 105.3248291015625 353.2269287109375 104.7959442138672 353.2269287109375 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d2gfqh =
    '<svg viewBox="4.6 83.6 13.8 1.1" ><path transform="translate(-61.72, -141.51)" d="M 66.867431640625 226.1186828613281 L 79.61255645751953 226.1186828613281 C 79.90382385253906 226.1186828613281 80.13998413085938 225.8825836181641 80.13998413085938 225.5913238525391 C 80.13998413085938 225.3000640869141 79.90382385253906 225.0639801025391 79.61255645751953 225.0639801025391 L 66.867431640625 225.0639801025391 C 66.576171875 225.0639801025391 66.34001159667969 225.3000640869141 66.34001159667969 225.5913238525391 C 66.34001159667969 225.8825836181641 66.576171875 226.1186828613281 66.867431640625 226.1186828613281 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jkb73q =
    '<svg viewBox="4.6 87.5 13.8 1.1" ><path transform="translate(-61.72, -188.34)" d="M 66.867431640625 276.9377136230469 L 79.61255645751953 276.9377136230469 C 79.90382385253906 276.9377136230469 80.13998413085938 276.7016296386719 80.13998413085938 276.4103698730469 C 80.13998413085938 276.1191101074219 79.90382385253906 275.8829956054688 79.61255645751953 275.8829956054688 L 66.867431640625 275.8829956054688 C 66.576171875 275.8829956054688 66.34001159667969 276.1191101074219 66.34001159667969 276.4103698730469 C 66.34001159667969 276.7016296386719 66.576171875 276.9377136230469 66.867431640625 276.9377136230469 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wyotk2 =
    '<svg viewBox="4.6 79.6 13.8 1.1" ><path transform="translate(-61.72, -94.68)" d="M 66.867431640625 175.2996826171875 L 79.61255645751953 175.2996826171875 C 79.90382385253906 175.2996826171875 80.13998413085938 175.0635833740234 80.13998413085938 174.7723236083984 C 80.13998413085938 174.4810638427734 79.90382385253906 174.2449645996094 79.61255645751953 174.2449645996094 L 66.867431640625 174.2449645996094 C 66.576171875 174.2449645996094 66.34001159667969 174.4810638427734 66.34001159667969 174.7723236083984 C 66.34001159667969 175.0635833740234 66.576171875 175.2996826171875 66.867431640625 175.2996826171875 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_epbm5y =
    '<svg viewBox="4.6 75.1 13.8 1.1" ><path transform="translate(-61.72, -48.31)" d="M 66.867431640625 124.4806900024414 L 79.61255645751953 124.4806900024414 C 79.90382385253906 124.4806900024414 80.13998413085938 124.2445983886719 80.13998413085938 123.9533386230469 C 80.13998413085938 123.6620712280273 79.90382385253906 123.4259872436523 79.61255645751953 123.4259872436523 L 66.867431640625 123.4259872436523 C 66.576171875 123.4259872436523 66.34001159667969 123.6620788574219 66.34001159667969 123.9533386230469 C 66.34001159667969 124.2445983886719 66.576171875 124.4806900024414 66.867431640625 124.4806900024414 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r2snzx =
    '<svg viewBox="26.3 80.3 5.2 4.3" ><path transform="translate(-304.24, -101.7)" d="M 335.136962890625 186.3330535888672 C 335.4965209960938 186.3230895996094 335.778076171875 186.0454711914063 335.778076171875 185.7011260986328 L 335.778076171875 185.5608215332031 C 335.778076171875 185.3287811279297 335.7192077636719 185.1433410644531 335.5873413085938 184.9601287841797 L 333.9212036132813 182.5929565429688 C 333.6421508789063 182.1960144042969 333.2917175292969 182.0189971923828 332.7849426269531 182.0189971923828 L 331.2174987792969 182.0189971923828 C 330.8600463867188 182.0189971923828 330.5629577636719 182.284423828125 330.5411376953125 182.6231994628906 C 330.5403747558594 182.6346130371094 330.5400390625 182.6460418701172 330.5400390625 182.657470703125 L 330.5419921875 185.2880249023438 C 330.5419921875 185.8644256591797 331.0540161132813 186.333251953125 331.683349609375 186.333251953125 L 335.1223449707031 186.333251953125 C 335.1272277832031 186.333251953125 335.1321105957031 186.3331909179688 335.136962890625 186.3330535888672 Z M 331.683349609375 185.2785491943359 C 331.6366577148438 185.2785491943359 331.6094970703125 185.2671356201172 331.5968322753906 185.2583465576172 L 331.59521484375 183.0737762451172 L 332.7850036621094 183.0737762451172 C 332.9698791503906 183.0737762451172 332.9886169433594 183.1004638671875 333.0585021972656 183.1997985839844 L 334.5216369628906 185.2785491943359 L 331.683349609375 185.2785491943359 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_3md7im =
    '<svg viewBox="0.0 0.0 40.0 40.0" ><path  d="M 39.33333587646484 13.33333396911621 L 36.00000381469727 13.33333396911621 L 36.00000381469727 8.666666984558105 C 36.00000381469727 8.298501014709473 35.70150375366211 8.000000953674316 35.33333587646484 8.000000953674316 L 33.33333587646484 8.000000953674316 L 33.33333587646484 0.6666667461395264 C 33.33333587646484 0.2985000014305115 33.03483581542969 0 32.66667175292969 0 L 7.333333969116211 0 C 6.96516752243042 0 6.666666984558105 0.2985000312328339 6.666666984558105 0.6666667461395264 L 6.666666984558105 8.000000953674316 L 4.666666984558105 8.000000953674316 C 4.298500537872314 8.000000953674316 4.000000476837158 8.298501014709473 4.000000476837158 8.666666984558105 L 4.000000476837158 13.33333396911621 L 0.6666667461395264 13.33333396911621 C 0.2985000014305115 13.33333396911621 0 13.63183498382568 0 14.00000095367432 L 0 32.66667175292969 C 0 33.03483581542969 0.2985000312328339 33.33333587646484 0.6666667461395264 33.33333587646484 L 6.666666984558105 33.33333587646484 L 6.666666984558105 39.33333587646484 C 6.666666984558105 39.70149993896484 6.96516752243042 40 7.333333969116211 40 L 32.66667175292969 40 C 33.03483581542969 40 33.33333587646484 39.70149993896484 33.33333587646484 39.33333587646484 L 33.33333587646484 33.33333587646484 L 39.33333587646484 33.33333587646484 C 39.70149993896484 33.33333587646484 40 33.03483581542969 40 32.66667175292969 L 40 14.00000095367432 C 40 13.63183498382568 39.70149993896484 13.33333396911621 39.33333587646484 13.33333396911621 Z M 33.33333587646484 9.333333969116211 L 34.66666793823242 9.333333969116211 L 34.66666793823242 13.33333396911621 L 33.33333587646484 13.33333396911621 L 33.33333587646484 9.333333969116211 Z M 8.000000953674316 1.333333492279053 L 32.00000381469727 1.333333492279053 L 32.00000381469727 13.33333396911621 L 8.000000953674316 13.33333396911621 L 8.000000953674316 1.333333492279053 Z M 5.333333969116211 9.333333969116211 L 6.666666984558105 9.333333969116211 L 6.666666984558105 13.33333396911621 L 5.333333969116211 13.33333396911621 L 5.333333969116211 9.333333969116211 Z M 6.666666984558105 29.33333587646484 L 6.000000476837158 29.33333587646484 L 6.000000476837158 27.33333587646484 L 6.666666984558105 27.33333587646484 L 6.666666984558105 29.33333587646484 Z M 32.00000381469727 38.66667175292969 L 8.000000953674316 38.66667175292969 L 8.000000953674316 27.33333587646484 L 32.00000381469727 27.33333587646484 L 32.00000381469727 38.66667175292969 Z M 38.66667175292969 32.00000381469727 L 33.33333587646484 32.00000381469727 L 33.33333587646484 30.66666793823242 L 34.66666793823242 30.66666793823242 C 35.03483581542969 30.66666793823242 35.33333587646484 30.36816787719727 35.33333587646484 30.00000381469727 L 35.33333587646484 26.66666793823242 C 35.33333587646484 26.29850387573242 35.03483581542969 26.00000381469727 34.66666793823242 26.00000381469727 L 5.333333969116211 26.00000381469727 C 4.965167045593262 26.00000381469727 4.666666984558105 26.29850387573242 4.666666984558105 26.66666793823242 L 4.666666984558105 30.00000381469727 C 4.666666984558105 30.36816787719727 4.965167045593262 30.66666793823242 5.333333969116211 30.66666793823242 L 6.666666984558105 30.66666793823242 L 6.666666984558105 32.00000381469727 L 1.333333492279053 32.00000381469727 L 1.333333492279053 14.66666793823242 L 38.66667175292969 14.66666793823242 L 38.66667175292969 32.00000381469727 Z M 33.33333587646484 29.33333587646484 L 33.33333587646484 27.33333587646484 L 34.00000381469727 27.33333587646484 L 34.00000381469727 29.33333587646484 L 33.33333587646484 29.33333587646484 Z" fill="#fcb284" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xc74z5 =
    '<svg viewBox="0.0 0.0 6.0 3.6" ><path transform="translate(-32.0, -192.0)" d="M 37.40000152587891 192 L 32.59999847412109 192 C 32.26865005493164 192 32 192.2686614990234 32 192.6000061035156 L 32 195 C 32 195.3313598632813 32.26865005493164 195.6000061035156 32.59999847412109 195.6000061035156 L 37.40000152587891 195.6000061035156 C 37.73134994506836 195.6000061035156 38 195.3313598632813 38 195 L 38 192.6000061035156 C 38 192.2686614990234 37.73134994506836 192 37.40000152587891 192 Z M 36.79999923706055 194.4000091552734 L 33.20000076293945 194.4000091552734 L 33.20000076293945 193.2000122070313 L 36.79999923706055 193.2000122070313 L 36.79999923706055 194.4000091552734 Z" fill="#fcb284" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pr4u32 =
    '<svg viewBox="0.0 0.0 40.0 40.0" ><path  d="M 0 0 L 0 40 L 40 40 L 40 0 L 0 0 Z M 37.65625 2.34375 L 37.65625 9.375 L 2.34375 9.375 L 2.34375 2.34375 L 37.65625 2.34375 Z M 2.34375 37.65625 L 2.34375 11.71875 L 37.65625 11.71875 L 37.65625 37.65625 L 2.34375 37.65625 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ae3xu0 =
    '<svg viewBox="4.7 4.7 2.3 2.3" ><path transform="translate(-55.31, -55.31)" d="M 60 60 L 62.34375 60 L 62.34375 62.34375 L 60 62.34375 L 60 60 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ks6pav =
    '<svg viewBox="9.4 4.7 2.3 2.3" ><path transform="translate(-110.62, -55.31)" d="M 120 60 L 122.34375 60 L 122.34375 62.34375 L 120 62.34375 L 120 60 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_39091t =
    '<svg viewBox="14.1 4.7 2.3 2.3" ><path transform="translate(-165.94, -55.31)" d="M 180 60 L 182.34375 60 L 182.34375 62.34375 L 180 62.34375 L 180 60 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_3fabvs =
    '<svg viewBox="4.7 14.1 30.6 16.6" ><path transform="translate(-55.31, -165.94)" d="M 67.50297546386719 188.6321868896484 L 71.04484558105469 190.9934387207031 L 75.58250427246094 185.8924255371094 L 81.15781402587891 188.7807769775391 L 85.9375 184.0010070800781 L 85.9375 187.03125 L 88.28125 187.03125 L 88.28125 180 L 81.25 180 L 81.25 182.34375 L 84.28023529052734 182.34375 L 80.71311950683594 185.9107818603516 L 75.04250335693359 182.9731292724609 L 70.64867401123047 187.9124298095703 L 66.92546844482422 185.4303131103516 L 62.34375 191.7689056396484 L 62.34375 180 L 60 180 L 60 196.5625 L 90.625 196.5625 L 90.625 194.21875 L 63.46492004394531 194.21875 L 67.50297546386719 188.6321868896484 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rw5fyy =
    '<svg viewBox="4.7 33.0 8.6 2.3" ><path transform="translate(-55.31, -389.03)" d="M 59.99999237060547 422 L 68.64585113525391 422 L 68.64585113525391 424.34375 L 59.99999237060547 424.34375 L 59.99999237060547 422 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ampgr7 =
    '<svg viewBox="15.7 33.0 8.6 2.3" ><path transform="translate(-184.99, -389.03)" d="M 200.6670227050781 422 L 209.3128814697266 422 L 209.3128814697266 424.34375 L 200.6670227050781 424.34375 L 200.6670227050781 422 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bcm0ai =
    '<svg viewBox="26.7 33.0 8.6 2.3" ><path transform="translate(-314.67, -389.03)" d="M 341.3330078125 422 L 349.9788818359375 422 L 349.9788818359375 424.34375 L 341.3330078125 424.34375 L 341.3330078125 422 Z" fill="#88d9d1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_5nvyk1 =
    '<svg viewBox="0.0 0.0 40.0 39.1" ><path transform="translate(0.0, -5.61)" d="M 38.68148040771484 27.87421035766602 C 39.29945755004883 27.11123847961426 40 26.24655151367188 40 25.17108154296875 C 40 24.09568977355957 39.29945755004883 23.23092651367188 38.68148040771484 22.46803283691406 C 38.29531478881836 21.9913158416748 37.89601516723633 21.49826622009277 37.80686950683594 21.1065502166748 C 37.71086120605469 20.68428611755371 37.86023712158203 20.04748916625977 38.00468826293945 19.43170547485352 C 38.22491836547852 18.49240875244141 38.47468566894531 17.42787933349609 38.02265930175781 16.49084663391113 C 37.56296920776367 15.53811168670654 36.56453323364258 15.06709575653076 35.68367004394531 14.6516284942627 C 35.12007904052734 14.3856897354126 34.53734588623047 14.11084651947021 34.27758026123047 13.78553295135498 C 34.01476669311523 13.45631408691406 33.8747673034668 12.82397079467773 33.73945617675781 12.21233081817627 C 33.52992630004883 11.26467323303223 33.29227066040039 10.19061088562012 32.470703125 9.534594535827637 C 31.6529712677002 8.881625175476074 30.55539321899414 8.887408256530762 29.58788871765137 8.893033027648926 C 28.95859718322754 8.896469116210938 28.30851745605469 8.900063514709473 27.92453193664551 8.714829444885254 C 27.55539321899414 8.536783218383789 27.1603889465332 8.03342342376709 26.77836227416992 7.546782970428467 C 26.17437744140625 6.777251720428467 25.48984336853027 5.904907703399658 24.44992446899414 5.668501377105713 C 23.44578552246094 5.440142631530762 22.46969223022461 5.91787576675415 21.6085205078125 6.339438438415527 C 21.0351619720459 6.619986534118652 20.44219398498535 6.910220623016357 19.99992561340332 6.910220623016357 C 19.55773735046387 6.910220623016357 18.96477127075195 6.619986534118652 18.39133262634277 6.339282035827637 C 17.53016090393066 5.917798519134521 16.55445671081543 5.440220832824707 15.54984569549561 5.668344974517822 C 14.50992488861084 5.904751300811768 13.82531547546387 6.777017116546631 13.22133255004883 7.546704769134521 C 12.83930206298828 8.03342342376709 12.44437885284424 8.536626815795898 12.07531642913818 8.714673042297363 C 11.69133281707764 8.899907112121582 11.04172420501709 8.896549224853516 10.41195774078369 8.892876625061035 C 9.444378852844238 8.887640953063965 8.346879005432129 8.8814697265625 7.529066562652588 9.534438133239746 C 6.707581996917725 10.19045448303223 6.469925880432129 11.26451683044434 6.260395050048828 12.21217441558838 C 6.125082015991211 12.82381439208984 5.985160350799561 13.4561595916748 5.722269535064697 13.78537559509277 C 5.462504863739014 14.11068820953369 4.879769802093506 14.38553237915039 4.316097736358643 14.65146923065186 C 3.435238838195801 15.06701564788818 2.436801195144653 15.53795337677002 1.977113723754883 16.49069213867188 C 1.525082588195801 17.42764472961426 1.774848103523254 18.49232864379883 1.995082497596741 19.43162727355957 C 2.139613628387451 20.04748725891113 2.288988828659058 20.68420600891113 2.192973136901855 21.10647010803223 C 2.10391092300415 21.49818992614746 1.7046138048172 21.99116134643555 1.318363904953003 22.4678783416748 C 0.7005468606948853 23.23092651367188 0 24.09568977355957 0 25.17108154296875 C 0 26.24647521972656 0.7005468606948853 27.11123847961426 1.318593859672546 27.87421035766602 C 1.704687356948853 28.35092163085938 2.104062557220459 28.84396934509277 2.193203210830688 29.23561096191406 C 2.289218664169312 29.65787696838379 2.139843702316284 30.2946720123291 1.995390653610229 30.91045188903809 C 1.775078058242798 31.84975242614746 1.525312542915344 32.91436004638672 1.97726571559906 33.85139083862305 C 2.436953067779541 34.80412673950195 3.435468435287476 35.275146484375 4.316250324249268 35.69068908691406 C 4.879843711853027 35.9565544128418 5.462656021118164 36.23147201538086 5.722421646118164 36.55670547485352 C 5.985235214233398 36.88592147827148 6.125078201293945 37.51827239990234 6.260390758514404 38.12982940673828 C 6.469922065734863 39.07748794555664 6.707499504089355 40.1516227722168 7.529141426086426 40.80764007568359 C 8.346797943115234 41.46060943603516 9.443984985351563 41.45467376708984 10.41195392608643 41.4492073059082 C 11.04125118255615 41.4459228515625 11.69140625 41.44216918945313 12.07531356811523 41.62740707397461 C 12.44445514678955 41.80553436279297 12.83945274353027 42.30881500244141 13.22148609161377 42.7955322265625 C 13.82547092437744 43.56506729125977 14.50999927520752 44.43740463256836 15.54992389678955 44.67381286621094 C 16.55390739440918 44.90186309814453 17.53007888793945 44.42436218261719 18.39140510559082 44.00287246704102 C 18.96476745605469 43.72225189208984 19.55773735046387 43.43201065063477 19.99992370605469 43.43201065063477 C 20.44219017028809 43.43201065063477 21.03516006469727 43.72225189208984 21.60859680175781 44.00295257568359 C 22.31562423706055 44.34896850585938 23.10000038146973 44.73295211791992 23.91406631469727 44.73295211791992 C 24.09148597717285 44.73295211791992 24.27023506164551 44.71474838256836 24.45000076293945 44.67388916015625 C 25.48992538452148 44.43748474121094 26.17453193664551 43.56521987915039 26.77851676940918 42.79552841186523 C 27.16054725646973 42.30881500244141 27.55547142028809 41.80560684204102 27.92453193664551 41.6275634765625 C 28.30851745605469 41.44232177734375 28.95851898193359 41.4459228515625 29.58788871765137 41.44935607910156 C 30.55508232116699 41.45443344116211 31.65304946899414 41.46076202392578 32.47078704833984 40.80779647827148 C 33.29227066040039 40.15177536010742 33.52992630004883 39.07771682739258 33.73945617675781 38.13005828857422 C 33.8747673034668 37.51841735839844 34.01469039916992 36.88607406616211 34.27758407592773 36.55685806274414 C 34.53734970092773 36.23154449462891 35.12007904052734 35.95669937133789 35.68375778198242 35.69076156616211 C 36.56460952758789 35.27521514892578 37.56304931640625 34.80420303344727 38.02273941040039 33.85154342651367 C 38.47476959228516 32.91458892822266 38.22500228881836 31.84998321533203 38.00476837158203 30.91068649291992 C 37.86031341552734 30.29482841491699 37.71094131469727 29.65795135498047 37.80695724487305 29.23560523986816 C 37.89601516723633 28.84381484985352 38.29531478881836 28.35092163085938 38.68148040771484 27.87421035766602 Z M 37.33008193969727 26.77952194213867 C 36.81859588623047 27.41092491149902 36.28976821899414 28.06381797790527 36.11101531982422 28.85014533996582 C 35.92593765258789 29.66412925720215 36.12195205688477 30.49967575073242 36.31156158447266 31.30780220031738 C 36.47359466552734 31.99858474731445 36.64109420776367 32.7128791809082 36.45632553100586 33.09576797485352 C 36.26422119140625 33.49397277832031 35.59194946289063 33.81108093261719 34.94171905517578 34.11780166625977 C 34.1985969543457 34.46834945678711 33.43016052246094 34.83084869384766 32.91851806640625 35.47163009643555 C 32.40382385253906 36.11624145507813 32.21953201293945 36.94904708862305 32.04148483276367 37.75436401367188 C 31.88687133789063 38.45342254638672 31.72695350646973 39.17616271972656 31.38562774658203 39.44873428344727 C 31.04804420471191 39.71819305419922 30.31101417541504 39.7141227722168 29.59749984741211 39.7102165222168 C 28.77070236206055 39.70568466186523 27.91546821594238 39.70100402832031 27.1688289642334 40.06115341186523 C 26.43640518188477 40.41452026367188 25.91484260559082 41.07912445068359 25.4103889465332 41.72185897827148 C 24.96413993835449 42.29045486450195 24.50273132324219 42.87834548950195 24.06437492370605 42.97803497314453 C 23.65913963317871 43.07021713256836 23.0052318572998 42.75037384033203 22.37312507629395 42.44100189208984 C 21.62179374694824 42.07319259643555 20.84492301940918 41.69287872314453 19.99991989135742 41.69287872314453 C 19.15484046936035 41.69287872314453 18.37804412841797 42.07311248779297 17.62671852111816 42.44084167480469 C 16.99460792541504 42.75022125244141 16.34054565429688 43.07052993774414 15.93538856506348 42.97795867919922 C 15.49710845947266 42.87827301025391 15.03562259674072 42.29037857055664 14.58945083618164 41.72186279296875 C 14.08492088317871 41.07904815673828 13.56335830688477 40.41443634033203 12.83077907562256 40.06108474731445 C 12.16788959503174 39.74123764038086 11.4196081161499 39.70920562744141 10.6813268661499 39.70920562744141 C 10.58819961547852 39.70920562744141 10.4949197769165 39.70975494384766 10.40218544006348 39.7102165222168 C 9.689061164855957 39.71389389038086 8.951483726501465 39.71819305419922 8.614060401916504 39.4487419128418 C 8.272576332092285 39.17616271972656 8.112732887268066 38.45334243774414 7.958124160766602 37.7542839050293 C 7.779999256134033 36.94897079467773 7.5958571434021 36.11615753173828 7.081170558929443 35.47154998779297 C 6.569451808929443 34.83084869384766 5.801092147827148 34.46835327148438 5.057968139648438 34.11780548095703 C 4.407734394073486 33.81108474731445 3.735467672348022 33.493896484375 3.543359041213989 33.0956916809082 C 3.358592510223389 32.71272277832031 3.526171207427979 31.9984245300293 3.688123941421509 31.30756568908691 C 3.877655267715454 30.49959754943848 4.07374906539917 29.66397285461426 3.888749122619629 28.8499870300293 C 3.709999322891235 28.0635814666748 3.181092977523804 27.41069412231445 2.66960883140564 26.77936363220215 C 2.212108612060547 26.21452140808105 1.738983869552612 25.63038063049316 1.738983869552612 25.17092704772949 C 1.738983869552612 24.71147155761719 2.212108612060547 24.12741279602051 2.669764757156372 23.56249046325684 C 3.181249141693115 22.93116188049316 3.710077524185181 22.27835083007813 3.888905048370361 21.49178695678711 C 4.073983669281006 20.67788124084473 3.877889394760132 19.84233474731445 3.688280344009399 19.03421020507813 C 3.526249170303345 18.34342956542969 3.358748912811279 17.62912940979004 3.543514490127563 17.24608421325684 C 3.735624074935913 16.84788131713867 4.407889366149902 16.53077125549316 5.058123588562012 16.22405242919922 C 5.801249027252197 15.87350368499756 6.569686412811279 15.51100540161133 7.08132791519165 14.87022399902344 C 7.596014022827148 14.22561550140381 7.780312061309814 13.39280033111572 7.958358287811279 12.58748722076416 C 8.112967491149902 11.88842582702637 8.272889137268066 11.16569137573242 8.614217758178711 10.89311408996582 C 8.95179557800293 10.62365913391113 9.688593864440918 10.62764453887939 10.40234279632568 10.63162994384766 C 11.22937488555908 10.63639450073242 12.08437538146973 10.64092540740967 12.83101654052734 10.28069114685059 C 13.56343746185303 9.927331924438477 14.08500003814697 9.262722969055176 14.58945274353027 8.619989395141602 C 15.03570175170898 8.051395416259766 15.49711036682129 7.463503360748291 15.93546962738037 7.363816738128662 C 16.34062576293945 7.271394729614258 16.99468803405762 7.591472148895264 17.62679672241211 7.900924682617188 C 18.3780460357666 8.268738746643066 19.15492248535156 8.649052619934082 19.99991989135742 8.649052619934082 C 20.84499931335449 8.649052619934082 21.62187385559082 8.268816947937012 22.37320137023926 7.900924682617188 C 23.00531005859375 7.591552257537842 23.65913963317871 7.271629333496094 24.064453125 7.363894939422607 C 24.50273132324219 7.463582038879395 24.96421813964844 8.051472663879395 25.4103889465332 8.619989395141602 C 25.9149227142334 9.262801170349121 26.43648338317871 9.927410125732422 27.1690616607666 10.28076934814453 C 27.91554641723633 10.64092540740967 28.76952934265137 10.6360034942627 29.59765243530273 10.63162994384766 C 30.31007766723633 10.62779998779297 31.0483570098877 10.62365913391113 31.38578033447266 10.89311408996582 C 31.72718811035156 11.16569137573242 31.88710784912109 11.888503074646 32.04171371459961 12.58748722076416 C 32.21976089477539 13.39287757873535 32.40406036376953 14.22569179534912 32.91874694824219 14.87030029296875 C 33.43039321899414 15.51108169555664 34.19882965087891 15.87350368499756 34.94187545776367 16.2241325378418 C 35.59210586547852 16.53084754943848 36.26437377929688 16.84795761108398 36.45648193359375 17.24615859985352 C 36.64125061035156 17.62912940979004 36.47366333007813 18.34334945678711 36.31171417236328 19.03413009643555 C 36.12218475341797 19.84210205078125 35.92616653442383 20.67780303955078 36.11116790771484 21.49162864685059 C 36.28983688354492 22.27803802490234 36.81874847412109 22.93100547790527 37.33023452758789 23.56241226196289 C 37.7877311706543 24.1273307800293 38.26086044311523 24.71147155761719 38.26086044311523 25.17084884643555 C 38.26086044311523 25.63022422790527 37.78773498535156 26.21467590332031 37.33008193969727 26.77952194213867 Z" fill="#c88ed8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_29s551 =
    '<svg viewBox="7.2 6.6 25.7 25.8" ><path transform="translate(-70.75, -71.27)" d="M 90.74986267089844 77.91300201416016 C 83.67155456542969 77.91300201416016 77.91299438476563 83.70638275146484 77.91299438476563 90.82733917236328 C 77.91299438476563 97.94829559326172 83.67155456542969 103.7416763305664 90.74986267089844 103.7416763305664 C 97.82817077636719 103.7416763305664 103.5867233276367 97.94829559326172 103.5867233276367 90.82733917236328 C 103.5867233276367 83.70638275146484 97.82817077636719 77.91300201416016 90.74986267089844 77.91300201416016 Z M 90.74986267089844 102.1273803710938 C 84.55642700195313 102.1273803710938 79.51760864257813 97.05815124511719 79.51760864257813 90.82733917236328 C 79.51760864257813 84.59652709960938 84.55635070800781 79.52730560302734 90.74986267089844 79.52730560302734 C 96.94336700439453 79.52730560302734 101.9821090698242 84.59645843505859 101.9821090698242 90.82733917236328 C 101.9821090698242 97.05823516845703 96.94336700439453 102.1273803710938 90.74986267089844 102.1273803710938 Z" fill="#c88ed8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_18eez0 =
    '<svg viewBox="12.8 14.5 12.3 12.3" ><path transform="translate(-161.58, -189.24)" d="M 186.3605804443359 204.0171966552734 C 185.9608459472656 203.6176452636719 185.3131561279297 203.6176452636719 184.9132995605469 204.0171966552734 L 174.6461944580078 214.2843170166016 C 174.2466278076172 214.6838989257813 174.2466278076172 215.3318634033203 174.6461944580078 215.7316131591797 C 174.8460693359375 215.9314880371094 175.1078948974609 216.0313262939453 175.3697204589844 216.0313262939453 C 175.6315612792969 216.0313262939453 175.8935089111328 215.931396484375 176.0932922363281 215.7316131591797 L 186.3604125976563 205.46435546875 C 186.7601470947266 205.0647430419922 186.7601470947266 204.4167785644531 186.3605804443359 204.0171966552734 Z" fill="#c88ed8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lcwbki =
    '<svg viewBox="24.5 13.0 2.1 2.1" ><path transform="translate(-291.23, -160.27)" d="M 316.7091369628906 175.3708038330078 C 316.9712524414063 175.3708038330078 317.233154296875 175.2706756591797 317.4329528808594 175.0709381103516 L 317.5066833496094 174.9971923828125 C 317.9061279296875 174.5973663330078 317.9059448242188 173.9495697021484 317.5061340332031 173.5500183105469 C 317.1065368652344 173.1504364013672 316.4584655761719 173.1508178710938 316.0589599609375 173.5503540039063 L 315.9852294921875 173.6240997314453 C 315.5857543945313 174.02392578125 315.5859069824219 174.6717376708984 315.9857788085938 175.0712738037109 C 316.1856384277344 175.2710723876953 316.4472961425781 175.3708038330078 316.7091369628906 175.3708038330078 Z" fill="#c88ed8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6zjv6p =
    '<svg viewBox="12.1 11.6 7.7 7.7" ><path transform="translate(-147.86, -148.29)" d="M 167.5957946777344 163.7593841552734 C 167.5957946777344 161.6433563232422 165.8743438720703 159.9219970703125 163.7584075927734 159.9219970703125 C 161.6424560546875 159.9219970703125 159.9210205078125 161.6434326171875 159.9210205078125 163.7593841552734 C 159.9210205078125 165.8753204345703 161.6424560546875 167.5967559814453 163.7584075927734 167.5967559814453 C 165.8743438720703 167.5967559814453 167.5957946777344 165.8752288818359 167.5957946777344 163.7593841552734 Z M 161.9676361083984 163.7593841552734 C 161.9676361083984 162.7719573974609 162.7710876464844 161.9686126708984 163.7584075927734 161.9686126708984 C 164.7457427978516 161.9686126708984 165.5491790771484 162.7719573974609 165.5491790771484 163.7593841552734 C 165.5491790771484 164.7467956542969 164.7457427978516 165.5501556396484 163.7584075927734 165.5501556396484 C 162.7710876464844 165.5501556396484 161.9676361083984 164.7467956542969 161.9676361083984 163.7593841552734 Z" fill="#c88ed8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_7y4v6w =
    '<svg viewBox="20.3 19.8 7.7 7.7" ><path transform="translate(-248.34, -248.78)" d="M 272.4383850097656 268.6010131835938 C 270.3223571777344 268.6010131835938 268.6010131835938 270.3224182128906 268.6010131835938 272.4383850097656 C 268.6010131835938 274.5543212890625 270.3224182128906 276.2757263183594 272.4383850097656 276.2757263183594 C 274.5543212890625 276.2757263183594 276.2757263183594 274.5543212890625 276.2757263183594 272.4383850097656 C 276.2757263183594 270.3223571777344 274.5543212890625 268.6010131835938 272.4383850097656 268.6010131835938 Z M 272.4383850097656 274.2290954589844 C 271.4509887695313 274.2290954589844 270.6476440429688 273.4257202148438 270.6476440429688 272.4383850097656 C 270.6476440429688 271.4510803222656 271.4510803222656 270.6476440429688 272.4383850097656 270.6476440429688 C 273.4257202148438 270.6476440429688 274.2290954589844 271.4510803222656 274.2290954589844 272.4383850097656 C 274.2290954589844 273.4257202148438 273.4258728027344 274.2290954589844 272.4383850097656 274.2290954589844 Z" fill="#c88ed8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

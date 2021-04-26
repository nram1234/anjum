import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './OrderStatusdetails.dart';
import 'package:adobe_xd/page_link.dart';
import './home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatus extends StatefulWidget {
  OrderStatus({
    Key key,
  }) : super(key: key);

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  String dropdownValue = 'All Categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(0.0, 158.0, 375.0, 667.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.05, -1.0),
                  end: Alignment(0.07, 1.0),
                  colors: [
                    const Color(0xffffffff),
                    const Color(0xfffefefe),
                    const Color(0xffe5e5e5)
                  ],
                  stops: [0.0, 0.013, 1.0],
                ),
              ),
            ),
          ),

          //blue header
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

          //white board
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-1.0, 143.0, 376.0, 1200.0),
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

          //chape l
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-112.0, -174.0, 417.0, 411.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinTop: true,
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

          //chape r
          Pinned.fromSize(
            bounds: Rect.fromLTWH(179.0, -258.0, 340.0, 331.0),
            size: Size(375.0, 812.0),
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

          //order status
          Pinned.fromSize(
            bounds: Rect.fromLTWH(31.0, 91.0, 147.0, 31.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Order Status',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                color: const Color(0xffffffff),
                letterSpacing: 0.88,
              ),
              textAlign: TextAlign.left,
            ),
          ),

          //back button
          Pinned.fromSize(
            bounds: Rect.fromLTWH(27.0, 47.0, 24.0, 24.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child:
                // Adobe XD layer: 'Icon material-arrow…' (shape)
                SvgPicture.string(
              _svg_wj8au7,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          //home  button
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
          //dropdown list
          Pinned.fromSize(
            bounds: Rect.fromLTWH(15.0, 150.0, 345.0, 40.0),
            size: Size(375.0, 812.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                elevation: 30,
                style: const TextStyle(color: Colors.grey),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['All Categories', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(15.0, 200.0, 345.0, 712.0),
            size: Size(375.0, 1200.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child: ListView.separated(
              shrinkWrap: true,
              // padding: const EdgeInsets.all(8),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                final List<String> status = <String>[
                  'rejected',
                  'accepted',
                  'pending',
                  'pending'
                ];
                final List<String> customerName = <String>[
                  'Soudi',
                  'Soudi',
                  'Soudi',
                  'Soudi'
                ];
                final List<int> orderNumber = <int>[123, 123, 123, 123];
                final List<String> store = <String>[
                  'Main store',
                  'Main store',
                  'Main store',
                  'Main store'
                ];
                Color textColor = Colors.black;
                Color getColor(textColor) {
                  if (textColor == 'accepted') {
                    return Color(0xff0dec57);
                  } else if (textColor == 'rejected') {
                    return Color(0xffec0d4a);
                  } else if (textColor == 'pending') {
                    return Color(0xffef9a07);
                  }
                }

                IconData icon = Icons.pause_circle_filled_rounded;
                IconData geticon(textColor) {
                  if (textColor == 'accepted') {
                    return Icons.assignment_turned_in_sharp;
                  } else if (textColor == 'rejected') {
                    return Icons.backspace_sharp;
                  } else if (textColor == 'pending') {
                    return Icons.pause_circle_filled_rounded;
                  }
                }

                return Container(
                  height: 160,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "Customer Name",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: const Color(0xff222b45),
                            ),
                          ),
                          SizedBox(width: 145),
                          Text(
                            "${customerName[index]}",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              color: const Color(0x70000000),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            "orderNumber",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: const Color(0xff222b45),
                            ),
                          ),
                          SizedBox(width: 180),
                          Text(
                            "${orderNumber[index]}",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              color: const Color(0x70000000),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            "From Store",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: const Color(0xff222b45),
                            ),
                          ),
                          SizedBox(width: 180),
                          Text(
                            "${store[index]}",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              color: const Color(0x70000000),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Icon(
                            geticon("${status[index]}"),
                            color: getColor("${status[index]}"),
                            size: 24.0,
                          ),
                          Text(
                            "${status[index]}",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 17,
                              color: getColor("${status[index]}"),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                          ),
                          Icon(Icons.warning_amber_sharp),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrderStatusdetails()));
                                },
                              child: Text(
                                "Order Details",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 11,
                                  color: const Color(0xffacacac),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          )
        ],
      ),
    );
  }
}

const String _svg_8cbo6j =
    '<svg viewBox="4.6 2.1 1.0 1.0" ><path transform="translate(-230.1, -104.59)" d="M 235.4984893798828 107.0832443237305 C 235.4984893798828 107.3125762939453 235.3125762939453 107.4984893798828 235.083251953125 107.4984893798828 C 234.8539123535156 107.4984893798828 234.6679992675781 107.3125762939453 234.6679992675781 107.0832443237305 C 234.6679992675781 106.8539123535156 234.8539123535156 106.6679992675781 235.083251953125 106.6679992675781 C 235.3125762939453 106.6679992675781 235.4984893798828 106.8539123535156 235.4984893798828 107.0832443237305 Z M 235.4984893798828 107.0832443237305" fill="#acacac" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vzmr1a =
    '<svg viewBox="3.9 3.7 1.3 4.2" ><path transform="translate(-198.72, -188.26)" d="M 203.7061462402344 196.1526794433594 C 203.5342254638672 196.1526794433594 203.3946990966797 196.0131378173828 203.3946990966797 195.8412170410156 L 203.3946990966797 192.6228942871094 L 202.9794616699219 192.6228942871094 C 202.8075256347656 192.6228942871094 202.6679992675781 192.4833679199219 202.6679992675781 192.3114471435547 C 202.6679992675781 192.1395263671875 202.8075256347656 192 202.9794616699219 192 L 203.7061462402344 192 C 203.8780822753906 192 204.0176086425781 192.1395263671875 204.0176086425781 192.3114471435547 L 204.0176086425781 195.8412170410156 C 204.0176086425781 196.0131378173828 203.8780822753906 196.1526794433594 203.7061462402344 196.1526794433594 Z M 203.7061462402344 196.1526794433594" fill="#acacac" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_q2e2dt =
    '<svg viewBox="0.0 0.0 10.0 10.0" ><path  d="M 4.983245849609375 9.96649169921875 C 2.235375165939331 9.96649169921875 0 7.731116771697998 0 4.983245849609375 C 0 2.235375165939331 2.235375165939331 0 4.983245849609375 0 C 7.731116771697998 0 9.96649169921875 2.235375165939331 9.96649169921875 4.983245849609375 C 9.96649169921875 7.731116771697998 7.731116771697998 9.96649169921875 4.983245849609375 9.96649169921875 Z M 4.983245849609375 0.6229057312011719 C 2.578830003738403 0.6229057312011719 0.6229057312011719 2.578830003738403 0.6229057312011719 4.983245849609375 C 0.6229057312011719 7.387660980224609 2.578830003738403 9.343585968017578 4.983245849609375 9.343585968017578 C 7.387660980224609 9.343585968017578 9.343585968017578 7.387660980224609 9.343585968017578 4.983245849609375 C 9.343585968017578 2.578830003738403 7.387660980224609 0.6229057312011719 4.983245849609375 0.6229057312011719 Z M 4.983245849609375 0.6229057312011719" fill="#acacac" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jb9urt =
    '<svg viewBox="3.7 7.3 2.5 1.0" ><path transform="translate(-188.26, -366.06)" d="M 194.1801605224609 373.9548950195313 L 192.3114471435547 373.9548950195313 C 192.1395263671875 373.9548950195313 192 373.8153686523438 192 373.6434631347656 C 192 373.4715270996094 192.1395263671875 373.3320007324219 192.3114471435547 373.3320007324219 L 194.1801605224609 373.3320007324219 C 194.3520812988281 373.3320007324219 194.4916229248047 373.4715270996094 194.4916229248047 373.6434631347656 C 194.4916229248047 373.8153686523438 194.3520812988281 373.9548950195313 194.1801605224609 373.9548950195313 Z M 194.1801605224609 373.9548950195313" fill="#acacac" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2iryg8 =
    '<svg viewBox="2.6 2.6 21.4 21.4" ><path transform="translate(-47.15, -47.15)" d="M 71.15198516845703 59.15394973754883 C 71.15198516845703 65.75395965576172 65.75199890136719 71.15394592285156 59.15198516845703 71.15394592285156 C 55.32701110839844 71.15394592285156 51.95201873779297 69.428955078125 49.77699279785156 66.65397644042969 C 51.80198669433594 68.30397796630859 54.42699432373047 69.27898406982422 57.27696228027344 69.27898406982422 C 63.87697601318359 69.27898406982422 69.27696990966797 63.87899017333984 69.27696990966797 57.27898406982422 C 69.27696990966797 54.42901229858398 68.30196380615234 51.80400466918945 66.65196228027344 49.77900695800781 C 69.42699432373047 51.95392990112305 71.15198516845703 55.32892227172852 71.15198516845703 59.15394973754883 Z" fill="#d1403f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n33ok7 =
    '<svg viewBox="6.2 6.2 11.6 11.6" ><path transform="translate(-111.15, -111.15)" d="M 128.6217041015625 128.6217041015625 C 128.1717224121094 129.0716857910156 127.4216766357422 129.0716857910156 126.9716949462891 128.6217041015625 L 123.146728515625 124.7967224121094 L 119.3217468261719 128.6217041015625 C 118.8717651367188 129.0716857910156 118.1217346191406 129.0716857910156 117.6717529296875 128.6217041015625 C 117.2217712402344 128.1717224121094 117.2217712402344 127.4216766357422 117.6717529296875 126.9716949462891 L 121.4967193603516 123.146728515625 L 117.6717529296875 119.3217468261719 C 117.2217712402344 118.8717651367188 117.2217712402344 118.1217346191406 117.6717529296875 117.6717529296875 C 118.1217346191406 117.2217712402344 118.8717651367188 117.2217712402344 119.3217468261719 117.6717529296875 L 123.146728515625 121.4967193603516 L 126.9716949462891 117.6717529296875 C 127.4216766357422 117.2217712402344 128.1717224121094 117.2217712402344 128.6217041015625 117.6717529296875 C 129.0716857910156 118.1217346191406 129.0716857910156 118.8717651367188 128.6217041015625 119.3217468261719 L 124.7967224121094 123.146728515625 L 128.6217041015625 126.9716949462891 C 129.0716857910156 127.4216766357422 129.0716857910156 128.1716613769531 128.6217041015625 128.6217041015625 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wj8au7 =
    '<svg viewBox="27.0 47.0 24.0 24.0" ><path transform="translate(21.0, 41.0)" d="M 30 16.5 L 11.74499988555908 16.5 L 20.13000106811523 8.114999771118164 L 18 6 L 6 18 L 18 30 L 20.11499977111816 27.88500022888184 L 11.74499988555908 19.5 L 30 19.5 L 30 16.5 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n9ucfs =
    '<svg viewBox="2.9 2.9 21.1 21.1" ><path transform="translate(-46.92, -46.92)" d="M 70.92098999023438 59.05263137817383 C 70.92098999023438 65.58131408691406 65.57936096191406 70.92294311523438 59.05067443847656 70.92294311523438 C 55.26703262329102 70.92294311523438 51.92851638793945 69.21659851074219 49.77699661254883 66.47160339355469 C 51.78010559082031 68.10377502441406 54.37674331665039 69.06824493408203 57.19591522216797 69.06824493408203 C 63.72460174560547 69.06824493408203 69.06623077392578 63.72660827636719 69.06623077392578 57.19792938232422 C 69.06623077392578 54.37875747680664 68.10176086425781 51.78211975097656 66.46959686279297 49.77900695800781 C 69.21463775634766 51.930419921875 70.92098999023438 55.26894378662109 70.92098999023438 59.05263137817383 Z" fill="#09c547" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nwo3py =
    '<svg viewBox="5.6 5.9 12.8 12.1" ><path transform="translate(-91.99, -115.3)" d="M 110.0843505859375 123.5542144775391 L 102.7997817993164 132.8566284179688 C 102.309455871582 133.5094451904297 101.4689559936523 133.5094451904297 100.978630065918 132.8566284179688 L 97.89668273925781 128.8582305908203 C 97.4764404296875 128.2870178222656 97.4764404296875 127.3894348144531 97.96671295166016 126.8182067871094 C 98.45703887939453 126.3286285400391 99.22750091552734 126.3286285400391 99.71783447265625 126.8997955322266 L 101.8891983032227 129.7557983398438 L 108.2631988525391 121.6774215698242 C 108.7535247802734 121.106201171875 109.5239868164063 121.0246124267578 110.0143203735352 121.595832824707 C 110.5046005249023 122.0854187011719 110.5046005249023 123.0646362304688 110.0843505859375 123.5542144775391 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xftzx6 =
    '<svg viewBox="0.0 0.0 4.1 13.0" ><path transform="translate(-153.08, -121.07)" d="M 156.6495056152344 121.0659866333008 L 153.5864562988281 121.0659866333008 C 153.3045349121094 121.0659866333008 153.0760040283203 121.2946166992188 153.0760040283203 121.5764465332031 L 153.0760040283203 133.5223388671875 C 153.0760040283203 133.8042602539063 153.3045349121094 134.0327911376953 153.5864562988281 134.0327911376953 L 156.6495056152344 134.0327911376953 C 156.9314270019531 134.0327911376953 157.1599578857422 133.8042602539063 157.1599578857422 133.5223388671875 L 157.1599578857422 121.5764465332031 C 157.1599578857422 121.2946166992188 156.9314270019531 121.0659866333008 156.6495056152344 121.0659866333008 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_1sepfj =
    '<svg viewBox="5.6 0.0 4.1 13.0" ><path transform="translate(-257.46, -121.07)" d="M 266.6494750976563 121.0659866333008 L 263.5864562988281 121.0659866333008 C 263.3045043945313 121.0659866333008 263.0759887695313 121.2946166992188 263.0759887695313 121.5764465332031 L 263.0759887695313 133.5223388671875 C 263.0759887695313 133.8042602539063 263.3045043945313 134.0327911376953 263.5864562988281 134.0327911376953 L 266.6494750976563 134.0327911376953 C 266.931396484375 134.0327911376953 267.1599426269531 133.8042602539063 267.1599426269531 133.5223388671875 L 267.1599426269531 121.5764465332031 C 267.1599426269531 121.2946166992188 266.931396484375 121.0659866333008 266.6494750976563 121.0659866333008 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_84yf8w =
    '<svg viewBox="0.0 0.0 24.0 24.0" ><path  d="M 24 12.00315093994141 C 24 5.375214099884033 18.62735366821289 0.003005974926054478 12.00014400482178 0.003005974926054478 C 5.372642993927002 0.002957313787192106 0 5.375116348266602 0 12.00315093994141 C 0 18.63016891479492 5.372642993927002 24.00276374816895 12.00019359588623 24.00276374816895 C 18.62735557556152 24.00271606445313 24 18.6301212310791 24 12.00315093994141 Z" fill="#e5aa17" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_5p2c1k =
    '<svg viewBox="328.9 80.9 27.1 27.1" ><path transform="translate(328.36, 80.86)" d="M 26.91234016418457 11.80575466156006 C 26.9115104675293 11.80513191223145 26.910888671875 11.80430507659912 26.91026878356934 11.80368232727051 L 15.83762741088867 0.731412947177887 C 15.36566066741943 0.2592398226261139 14.73816585540771 -0.0006628036499023438 14.07070732116699 -0.0006628036499023438 C 13.40324687957764 -0.0006628036499023438 12.77575206756592 0.2592392861843109 12.30358028411865 0.731412947177887 L 1.236717939376831 11.79806327819824 C 1.232990384101868 11.80179119110107 1.229055523872375 11.80572509765625 1.225534915924072 11.80945301055908 C 0.2563349902629852 12.78424072265625 0.2579943537712097 14.36581707000732 1.230298042297363 15.33811855316162 C 1.674513816833496 15.78254127502441 2.261001825332642 16.03975296020508 2.888286352157593 16.06687927246094 C 2.913965940475464 16.06936645507813 2.939645528793335 16.07060813903809 2.965532064437866 16.07060813903809 L 3.406641006469727 16.07060813903809 L 3.406641006469727 24.21888732910156 C 3.406641006469727 25.83152770996094 4.718784809112549 27.14346694946289 6.331422328948975 27.14346694946289 L 10.66340160369873 27.14346694946289 C 11.10264682769775 27.14346694946289 11.45864009857178 26.78726577758789 11.45864009857178 26.34822463989258 L 11.45864009857178 19.95980644226074 C 11.45864009857178 19.2240047454834 12.05734920501709 18.62550354003906 12.79315185546875 18.62550354003906 L 15.34827136993408 18.62550354003906 C 16.08407402038574 18.62550354003906 16.68257713317871 19.2240047454834 16.68257713317871 19.95980644226074 L 16.68257713317871 26.34822463989258 C 16.68257713317871 26.78726577758789 17.03857040405273 27.14346694946289 17.47781562805176 27.14346694946289 L 21.80979347229004 27.14346694946289 C 23.42263984680176 27.14346694946289 24.73457717895508 25.83152770996094 24.73457717895508 24.21888732910156 L 24.73457717895508 16.07060813903809 L 25.14379501342773 16.07060813903809 C 25.81104850769043 16.07060813903809 26.43854331970215 15.81070613861084 26.91092109680176 15.33832550048828 C 27.8842601776123 14.36457347869873 27.88467407226563 12.78010177612305 26.9123706817627 11.80572700500488 Z M 25.78616333007813 14.21383857727051 C 25.6144847869873 14.38551807403564 25.38626670837402 14.4801607131958 25.14376258850098 14.4801607131958 L 23.93930435180664 14.4801607131958 C 23.50005722045898 14.4801607131958 23.14406585693359 14.83615398406982 23.14406585693359 15.27539920806885 L 23.14406585693359 24.21891975402832 C 23.14406585693359 24.95451354980469 22.54556274414063 25.55301475524902 21.80976104736328 25.55301475524902 L 18.27301979064941 25.55301475524902 L 18.27301979064941 19.95983505249023 C 18.27301979064941 18.34719848632813 16.96108245849609 17.03505516052246 15.34823513031006 17.03505516052246 L 12.79311752319336 17.03505516052246 C 11.18027210235596 17.03505516052246 9.868127822875977 18.34719848632813 9.868127822875977 19.95983505249023 L 9.868127822875977 25.55301475524902 L 6.331387996673584 25.55301475524902 C 5.595791339874268 25.55301475524902 4.997082710266113 24.95451354980469 4.997082710266113 24.21891975402832 L 4.997082710266113 15.27539920806885 C 4.997082710266113 14.83615398406982 4.64108943939209 14.4801607131958 4.201844215393066 14.4801607131958 L 3.018099546432495 14.4801607131958 C 3.005673885345459 14.47933101654053 2.993455171585083 14.47871017456055 2.980822563171387 14.47850322723389 C 2.743907690048218 14.47436237335205 2.521696329116821 14.38034057617188 2.3551926612854 14.21363067626953 C 2.001062631607056 13.85950088500977 2.001062631607056 13.28316020965576 2.3551926612854 12.9288215637207 C 2.355399608612061 12.9288215637207 2.355399608612061 12.92861461639404 2.355606555938721 12.92840671539307 L 2.356228113174438 12.9277868270874 L 13.42849826812744 1.855940818786621 C 13.59997177124023 1.684260487556458 13.82798099517822 1.589825868606567 14.07069492340088 1.589825868606567 C 14.31320190429688 1.589825868606567 14.54121208190918 1.684260487556458 14.71289443969727 1.855940818786621 L 25.78267288208008 12.92550659179688 C 25.78433036804199 12.92716407775879 25.78619384765625 12.92881965637207 25.78784942626953 12.93047714233398 C 26.14011573791504 13.28522777557373 26.13949394226074 13.86032772064209 25.78619384765625 14.21383380889893 Z M 25.78616333007813 14.21383857727051" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

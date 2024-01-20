//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_utils/src/platform/platform_io.dart';
//
// import 'dashboard.dart';
// import 'printer-2.dart';
// import 'printersettings.dart';
//
// class Printer1 extends StatefulWidget {
//   @override
//   _Printer1State createState() => _Printer1State();
// }
//
// class _Printer1State extends State<Printer1> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: Container(
//           height: size.height,
//           width: size.width,
//           child: Stack(
//             children: [
//               Container(
//                   height: size.height * .3,
//                   width: size.width,
//                   child: Stack(
//                     children: [
//                       Image.asset(
//                         'assets/images/bk.png',
//                         width: size.width,
//                         fit: BoxFit.fill,
//                       ),
//                       Positioned(
//                           left: size.width * .1,
//                           top: size.height * .1,
//                           child: Text(
//                             'Printers List',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           )),
//                       Positioned(
//                         right: size.width * .05,
//                         top: size.height * .1,
//                         child: Container(
//                             child:InkWell(
//                                 onTap: (){
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) => Dashboard()),
//                                   );
//                                 },
//                                 child: Icon(Icons.home,color: Colors.white,size: 30, ))
//
//                         ),
//                       ),
//                       Positioned(
//                           left: size.width * .05,
//                           top: size.height * .05,
//                           child: Icon(
//                             Icons.arrow_forward,
//                             color: Colors.white,
//                             size: 50,
//                           ))
//                     ],
//                   )),
//               Positioned(
//                   right: 0,
//                   left: 0,
//                   top: size.height * .2,
//                   child: Container(
//                     height: size.height * .8,
//                     width: size.width,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(30),
//                             topLeft: Radius.circular(30))),
//                     child: Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.grey[100]),
//                           width: size.width * .9,
//                           height: 50,
//                           child: TextField(
//                             onChanged: (v) {},
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               focusedBorder: InputBorder.none,
//                               enabledBorder: InputBorder.none,
//                               errorBorder: InputBorder.none,
//                               disabledBorder: InputBorder.none,
//                               suffixIcon: Icon(Icons.search),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: ListView.builder(
//                               itemCount: 5,
//                               itemBuilder: (context, pos) {
//                                 return GestureDetector(onTap: (){
//                                   Get.to(Printer2);
//                                 },child: item(size: size));
//                               }),
//                         ),
//                       ],
//                     ),
//                   )),
//             ],
//           ),
//         ));
//
//   }
//   Widget item({size}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: (){
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => Printer2()),
//           );
//         },
//         child: Card(
//           elevation: 8,
//           child: Container(
//             height: size.height * .08,
//             padding: EdgeInsets.all(4),
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//             // height: size.height * .15,
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Column(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           children: [
//                             Text('Printer-1',style: (TextStyle(color: Colors.blue)),),
//                             SizedBox( width: size.width*.6),
//                             Icon(Icons.print_outlined)
//                           ],
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Row(
//                           children: [
//                             InkWell(
//                                 onTap: (){
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => PrinterSettings()),
//                                   );
//                                 },
//                                 child: Text('printer Settings')),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 8,
//                     ),
//
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

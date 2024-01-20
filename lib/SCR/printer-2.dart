//
//
//
// import 'package:flutter/material.dart';
//
// class Printer2 extends StatefulWidget {
//   @override
//   _Printer1State createState() => _Printer1State();
// }
//
// class _Printer1State extends State<Printer2> {
//   String dropdownValue = '1';
//   String dropdownValue1 = 'left';
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var sHeight = MediaQuery.of(context).size.height;
//     var sWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Container(
//         height: size.height,
//         width: size.width,
//         child: Stack(
//           children: [
//             Container(
//                 height: size.height * 2,
//                 width: size.width,
//                 child: Stack(
//                   children: [
//                     Image.asset(
//                       'assets/images/bk.png',
//                       width: size.width,
//                       fit: BoxFit.fill,
//                     ),
//                     Positioned(
//                         left: size.width * .05,
//                         top: size.height * .05,
//                         child: InkWell(
//                           onTap: (){  Navigator.pop(context);},
//                           child: Icon(
//                             Icons.arrow_back,
//                             color: Colors.white,
//                             size: 50,
//                           ),
//                         )),
//                     Positioned(
//                         left: size.width * .1,
//                         top: size.height * .12,
//                         child: Text(
//                           'pinter',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         )), ],
//                 )),
//             Positioned(
//                 right: 0,
//                 left: 0,
//                 top: size.height * .2,
//                 child: Container(
//                   height: size.height * .8,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(30),
//                           topLeft: Radius.circular(30))),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         bottom: size.height * .021,
//                         left: size.width * .14,
//                         child: Container(
//                           width: size.width * .7,
//                           height: size.height * .05,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(9.0),
//                             color: const Color(0xffffffff),
//                             border: Border.all(
//                                 width: 1.0,
//                                 color: const Color(0xffd4edff)),
//                           ),
//                           child: ConstrainedBox(
//                             constraints: BoxConstraints.tightFor(
//                                 height: size.height * 1,
//                                 width: size.width * 1),
//                             child: ElevatedButton(
//                               child: Text('Cancel'),
//                               style: ElevatedButton.styleFrom(
//                                 elevation: 20,
//                                 primary: Colors.indigo,
//                                 onPrimary: Colors.white70,
//                                 shape: const BeveledRectangleBorder(
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(5))),
//                               ),
//                               onPressed: () {
//
//                                 Navigator.pop(context);
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(builder: (context) => Bill()),
//                                 // );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: size.height * .15,
//                         left: size.width * .06,
//                         child: Row(
//                           children: [
//                             Container(
//                               width: size.width * .5,
//                               height: size.height * .07,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(9.0),
//                                 color: const Color(0xffffffff),
//                                 border: Border.all(
//                                     width: 1.0,
//                                     color: const Color(0xffd4edff)),
//                               ),
//                               child: ConstrainedBox(
//                                 constraints: BoxConstraints.tightFor(
//                                     height: size.height * 1,
//                                     width: size.width * 1),
//                                 child: ElevatedButton(
//                                   child: Text('pair with  printer'),
//                                   style: ElevatedButton.styleFrom(
//                                     elevation: 20,
//                                     primary: Colors.white70,
//                                     onPrimary: Colors.blue,
//                                     shape: const BeveledRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(5))),
//                                   ),
//                                   onPressed: () {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(builder: (context) => Bill()),
//                                     // );
//                                   },
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               width: size.width * .3,
//                               height: size.height * .07,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(9.0),
//                                 color: const Color(0xffffffff),
//                                 border: Border.all(
//                                     width: 1.0,
//                                     color: const Color(0xffd4edff)),
//                               ),
//                               child: ConstrainedBox(
//                                 constraints: BoxConstraints.tightFor(
//                                     height: size.height * 1,
//                                     width: size.width * 1),
//                                 child: ElevatedButton(
//                                   child: Text('print'),
//                                   style: ElevatedButton.styleFrom(
//                                     elevation: 20,
//                                     primary: Colors.indigo,
//                                     onPrimary: Colors.white70,
//                                     shape: const BeveledRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(5))),
//                                   ),
//                                   onPressed: () {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(builder: (context) => Bill()),
//                                     // );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         top: size.height * .021,
//                         left: size.width * .04,
//                         child: Text("sales product",style: TextStyle(color: Colors.blue),),
//                       ),
//                       Positioned(
//                         top: size.height * .07,
//                         left: size.width * .04,
//                         child: Row(
//                           children: [
//                             Text("Payment No",style: TextStyle(color: Colors.blue),
//                             ),
//                             SizedBox(width:size.width * .6 ,),
//                             Text("20",style: TextStyle(color: Colors.blue),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         top: size.height * .13,
//                         left: size.width * .04,
//                         child: Row(
//                           children: [
//                             Text("Payment Type",style: TextStyle(color: Colors.blue),
//                             ),
//                             SizedBox(width:size.width * .6 ,),
//                             Text("150",style: TextStyle(color: Colors.blue),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         top: size.height * .19,
//                         left: size.width * .04,
//                         child: Row(
//                           children: [
//                             Text("sales man",style: TextStyle(color: Colors.blue),
//                             ),
//                             SizedBox(width:size.width * .6 ,),
//                             Text("187",style: TextStyle(color: Colors.blue),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         top: size.height * .25,
//                         left: size.width * .04,
//                         child: Row(
//                           children: [
//                             Text("Customer name",style: TextStyle(color: Colors.blue),
//                             ),
//                             SizedBox(width:size.width * .6 ,),
//                             Text("1500",style: TextStyle(color: Colors.blue),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         top: size.height * .31,
//                         left: size.width * .04,
//                         child: Row(
//                           children: [
//                             Text("Check amount",style: TextStyle(color: Colors.blue),
//                             ),
//                             SizedBox(width:size.width * .6 ,),
//                             Text("1537",style: TextStyle(color: Colors.blue),
//                             ),
//                           ],
//                         ),
//
//                       ),
//                       Positioned(
//                         top: size.height * .4,
//                         left: size.width * .04,
//                         child: Row(
//                           children: [
//                             Column(
//                               children: [
//                                 Text("Check amount",style: TextStyle(color: Colors.blue),),
//                                 Container(
//                                   width: size.width * .2,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(9.0),
//                                     color: const Color(0xffffffff),
//                                     border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
//                                   ),
//                                   child: DropdownButton<String>(
//                                     value: dropdownValue,
//                                     elevation: 30,
//                                     style: const TextStyle(color: Colors.grey),
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         dropdownValue = newValue!;
//                                       });
//                                     },
//                                     items: <String>['1', '2', '3', '4']
//                                         .map<DropdownMenuItem<String>>((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value),
//                                       );
//                                     }).toList(),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(width:size.width * .4 ,),
//                             Column(
//                               children: [
//                                 Text("Justification",style: TextStyle(color: Colors.blue),),
//                                 Container(
//                                   width: size.width * .2,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(9.0),
//                                     color: const Color(0xffffffff),
//                                     border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
//                                   ),
//                                   child: DropdownButton<String>(
//                                     value: dropdownValue1,
//                                     elevation: 30,
//                                     style: const TextStyle(color: Colors.grey),
//                                     onChanged: (String newValue) {
//                                       setState(() {
//                                         dropdownValue1 = newValue;
//                                       });
//                                     },
//                                     items: <String>['left','right' ]
//                                         .map<DropdownMenuItem<String>>((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value),
//                                       );
//                                     }).toList(),
//                                   ),
//                                 ), ],
//
//                             ),
//
//                           ],
//                         ),
//
//                       ),
//
//
//
//                     ],
//                   ),
//                 )),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

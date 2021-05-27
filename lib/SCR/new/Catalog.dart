// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// class Catalog extends StatefulWidget {
//   @override
//   _CatalogState createState() => _CatalogState();
// }
//
// class _CatalogState extends State<Catalog> {
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Color(0xff2C4B89),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Container(
//                 height: size.height * .18,
//                 width: size.width,
//                 color: Colors.blue,
//                 child: Stack(
//                   children: [
//                     Image.asset(
//                       'assets/images/bk.png',
//                       width: size.width,
//                       fit: BoxFit.fill,
//                     ),
//                     Positioned(
//                         left: size.width * .1,
//                         top: size.height * .1,
//                         child: Text(
//                           'Catalog',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         )),
//                     Positioned(
//                         left: size.width * .05,
//                         top: size.height * .05,
//                         child: GestureDetector(onTap:(){
//                           Navigator.pop(context);
//                         } ,
//                           child: Icon(
//                             Icons.arrow_back,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                         )),
//                     Positioned(top: size.height*.06,right: size.width*.02,
//                       child: Container(height: 75,width: 75,
//                         child: Icon(Icons.home,color: Colors.white,size: 50,)
//                       ),
//                     )
//                   ],
//                 )),
//           ),
//           Expanded(
//             flex: 9,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
//                 color: Colors.white
//               ),
//               padding: EdgeInsets.only(top: 10),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: StaggeredGridView.countBuilder(
//                   crossAxisCount: 4,
//                   itemCount: 8,
//                   itemBuilder: (BuildContext context, int index) => new Container(
//                       // color: Colors.green,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15),
//                         child: FadeInImage.assetNetwork(
//                           placeholder: "assets/images/pic.png", image: 'https://fakeimg.pl/300/',
//                           height: double.infinity,
//                           width: double.infinity,
//                           fit: BoxFit.fill,
//                         ),
//                       )
//                   ),
//                   staggeredTileBuilder: (int index) =>
//                   new StaggeredTile.count(2, index.isEven ? 3 : 2),
//                   mainAxisSpacing: 15.0,
//                   crossAxisSpacing: 20.0,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

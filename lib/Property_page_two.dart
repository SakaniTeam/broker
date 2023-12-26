// import 'package:flutter/material.dart';
// import 'package:abdo/property_page_one.dart';

// class AddProTwo extends StatefulWidget {
//   const AddProTwo({Key? key}) : super(key: key);

//   @override
//   State<AddProTwo> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<AddProTwo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Column(
//             children: [
//               Text(
//                 "Commercial Property",
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Divider(
//                 height: 5.0,
//                 color: Colors.black12,
//               ),
//             ],
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 29),
//               Container(
//                 padding: EdgeInsets.fromLTRB(35, 40, 0, 0),
//                 child: Text(
//                   "Add media",
//                   style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black),
//                 ),
//               ),
//               SizedBox(height: 5),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Container(
//                   padding: EdgeInsets.all(35),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black12),
//                     borderRadius: BorderRadius.circular(2),
//                     color: Colors.black12,
//                   ),
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.add_a_photo_outlined,
//                         color: Colors.black,
//                       ),
//                       SizedBox(height: 20),
//                       Center(
//                         child: Container(
//                           padding: EdgeInsets.all(1),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(3),
//                               color: Colors.black12),
//                           child: Text(
//                             "Upload Photo",
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 80),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Container(
//                   padding: EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.black12,
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.location_on_outlined,
//                         color: Colors.black45,
//                       ),
//                       SizedBox(width: 20),
//                       Text(
//                         "Choose the location",
//                         style: TextStyle(fontSize: 15, color: Colors.black45),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 200),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(width: 45),
//                   MaterialButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AddProOne(),
//                         ),
//                       );
//                     },
//                     color: Color(0xfff69422),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       children: [
//                         Spacer(flex: 1,),
//                         Icon(
//                           Icons.arrow_back,
//                           color: Colors.white,
//                         ),
//                         Text(
//                           "Back",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Spacer(flex: 1,),
//                   MaterialButton(
//                     onPressed: () {
//                       // Add your logic here to handle the "Add" button press
//                     },
//                     color: Color(0xfff69422),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text("Add", style: TextStyle(color: Colors.white)),
//                     ),
//                   ),
//                   Spacer(flex: 1,),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

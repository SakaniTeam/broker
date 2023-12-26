// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: showProperty(),
//   ));
// }

// class showProperty extends StatefulWidget {
//   @override
//   State<showProperty> createState() => _showPropertyState();
// }

// class _showPropertyState extends State<showProperty> {
//   List comerrical = [];
//   List resdintial = [];
//   bool isloading = false;
//   bool isResd = false;

//   @override
//   void initState() {
//     getCommercial();
//     getResidintial();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shape: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
//         title: Text(
//           'Show Property',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
//         ),
//         centerTitle: true,
//       ),
//       body: isloading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Container(
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 20),
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Show Result',
//                       style:
//                           TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: isResd ? resdintial.length : comerrical.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           child: Stack(
//                             children: [
//                               Card(
//                                 color: Colors.orangeAccent,
//                                 child: ListTile(
//                                   onLongPress: () {
//                                     showDialog(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return AlertDialog(
//                                           title: Text("Delete Item"),
//                                           content: Text(
//                                               "Are you sure you want to delete this item?"),
//                                           actions: [
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text("Cancel"),
//                                             ),
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.pop(context);
//                                                 // isResd
//                                                 //     ? deleteResidintial(
//                                                 //      //   resdintial[index]
//                                                 //        //     ['documentId'],
//                                                 //    //     index)
//                                                 //     : deleteCommercial(
//                                                 //         comerrical[index]
//                                                 //             ['documentId'],
//                                                 //         index);
//                                                 setState(() {});
//                                               },
//                                               child: Text("Delete"),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//                                   },
//                                   minVerticalPadding: 40,
//                                   leading: Image.asset(
//                                     'assets/test.jpg',
//                                   ),
//                                   title: Text(isResd
//                                       ? '${resdintial[index]['propertyType']}'
//                                       : '${comerrical[index]['propertyType']}'),
//                                   subtitle: Text(
//                                     isResd
//                                         ? '${resdintial[index]['propertyStatus']} \n ${resdintial[index]['propertyAdress']} \n ${resdintial[index]['propertyDetails']} \n${resdintial[index]['propertyRentDuration']}'
//                                         : '${comerrical[index]['propertyStatus']} \n ${comerrical[index]['propertyAdress']} \n ${comerrical[index]['propertyDetails']} \n ${comerrical[index]['propertyRentDuration']}',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 right: 10,
//                                 bottom: 10,
//                                 child: Row(
//                                   children: [
//                                     IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(
//                                           Icons.edit,
//                                           size: 30,
//                                         )),
//                                     IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(
//                                           Icons.expand_circle_down,
//                                           size: 30,
//                                         ))
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         MaterialButton(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           color: Colors.orangeAccent,
//                           onPressed: () {
//                             isResd = false;
//                             setState(() {});
//                           },
//                           child: Text('Commercial'),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         MaterialButton(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           color: Colors.orangeAccent,
//                           onPressed: () {
//                             isResd = true;
//                             setState(() {});
//                           },
//                           child: Text('Residential'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: MaterialButton(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8)),
//                       color: Colors.orangeAccent,
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => showProperty(),
//                             ));
//                       },
//                       child: Text('Back'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   void getCommercial() async {
//     CollectionReference tblProduct =
//         FirebaseFirestore.instance.collection('commercialProperty');
//     await tblProduct.get().then((querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         Map<String, dynamic> store = doc.data() as Map<String, dynamic>;
//         store['documentId'] = doc.id;

//         comerrical.add(store);
//       });
//     });
//     print('-------------------------------');
//     setState(() {});
//   }

//   void getResidintial() async {
//     CollectionReference tblProduct =
//         FirebaseFirestore.instance.collection('ResidentialProperty');
//     await tblProduct.get().then((querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         Map<String, dynamic> store = doc.data() as Map<String, dynamic>;
//         store['documentId'] = doc.id;
//         resdintial.add(store);
//         print(store);
//       });
//     });
//     print('-------------------------------');
//     setState(() {});
//   }

//   // void deleteResidintial(String docID, int index) {
//   //   FirebaseFirestore.instance
//   //       .collection('ResidentialProperty')
//   //       .doc(resdintial[index]['documentId'])
//   //       .delete();
//   //   resdintial.removeAt(index);
//   //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //     content: Text('Deleted Successfuly'),
//   //     backgroundColor: Colors.green,
//   //   ));
//   //   setState(() {});
//   // }

//   // void deleteCommercial(String docID, int index) {
//   //   FirebaseFirestore.instance
//   //       .collection('commercialProperty')
//   //       .doc(comerrical[index]['documentId'])
//   //       .delete();
//   //   comerrical.removeAt(index);
//   //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //     content: Text('Deleted Successfuly'),
//   //     backgroundColor: Colors.green,
//   //   ));
//   //   setState(() {});
//   // }
// }
